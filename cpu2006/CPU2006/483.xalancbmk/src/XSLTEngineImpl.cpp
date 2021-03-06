/*
 * Copyright 1999-2004 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */



// Class header file.
#include "XSLTEngineImpl.hpp"



#include <xercesc/sax/DocumentHandler.hpp>
#include <xercesc/sax/EntityResolver.hpp>
#include <xercesc/sax/Locator.hpp>



#include <xalanc/Include/STLHelper.hpp>



#include <XalanDOMException.hpp>
#include <XalanDocumentFragment.hpp>
#include <XalanNode.hpp>
#include <XalanAttr.hpp>
#include <XalanComment.hpp>
#include <XalanCDATASection.hpp>
#include <XalanNodeList.hpp>
#include <XalanNamedNodeMap.hpp>
#include <XalanProcessingInstruction.hpp>
#include <XalanText.hpp>



#include <PrintWriter.hpp>
#include <StringTokenizer.hpp>
#include <XalanLocator.hpp>
#include <XalanMessageLoader.hpp>
#include <XalanUnicode.hpp>



#include <DOMServices.hpp>
#include <DOMSupport.hpp>



#include <FormatterToHTML.hpp>
#include <FormatterTreeWalker.hpp>
#include <XMLParserLiaison.hpp>
#include <FormatterTreeWalker.hpp>



#include <ElementPrefixResolverProxy.hpp>
#include <XalanQNameByReference.hpp>
#include <XObject.hpp>
#include <XObjectFactory.hpp>
#include <XPathEnvSupport.hpp>
#include <XPathEnvSupportDefault.hpp>
#include <XPathExecutionContextDefault.hpp>
#include <XPathFactory.hpp>
#include <XPathFunctionTable.hpp>
#include <XPathProcessorImpl.hpp>



#include "Constants.hpp"
#include "ElemWithParam.hpp"
#include "FunctionCurrent.hpp"
#include "FunctionDocument.hpp"
#include "FunctionElementAvailable.hpp"
#include "FunctionFunctionAvailable.hpp"
#include "FunctionFormatNumber.hpp"
#include "FunctionGenerateID.hpp"
#include "FunctionKey.hpp"
#include "FunctionSystemProperty.hpp"
#include "FunctionUnparsedEntityURI.hpp"
#include "GenerateEvent.hpp"
#include "ProblemListener.hpp"
#include "ProblemListenerDefault.hpp"
#include "Stylesheet.hpp"
#include "StylesheetConstructionContext.hpp"
#include "StylesheetExecutionContext.hpp"
#include "StylesheetHandler.hpp"
#include "StylesheetRoot.hpp"
#include "TraceListener.hpp"
#include "XSLTInputSource.hpp"
#include "XSLTProcessorException.hpp"
#include "XSLTResultTarget.hpp"



//#define XALAN_VQ_SPECIAL_TRACE
#if defined(XALAN_VQ_SPECIAL_TRACE)
#include "C:/Program Files/Rational/Quantify/pure.h"
#endif



XALAN_CPP_NAMESPACE_BEGIN



const XalanDOMString	XSLTEngineImpl::s_emptyString;



//==========================================================
// SECTION: Constructors
//==========================================================

XSLTEngineImpl::XSLTEngineImpl(
			XMLParserLiaison&	parserLiaison,
			XPathEnvSupport&	xpathEnvSupport,
			DOMSupport&			domSupport,
			XObjectFactory&		xobjectFactory,
			XPathFactory&		xpathFactory) :
	XSLTProcessor(),
	PrefixResolver(),
	m_resultNameSpacePrefix(),
	m_resultNameSpaceURL(),
	m_xpathFactory(xpathFactory),
	m_xobjectFactory(xobjectFactory),
	m_xpathProcessor(new XPathProcessorImpl),
	m_cdataStack(),
	m_stylesheetLocatorStack(),
	m_defaultProblemListener(),
	m_problemListener(&m_defaultProblemListener),
	m_stylesheetRoot(0),
	m_traceSelects(false),
	m_quietConflictWarnings(true),
	m_diagnosticsPrintWriter(0),
	m_durationsTable(),
	m_traceListeners(),
	m_uniqueNSValue(0),
	m_topLevelParams(),
	m_parserLiaison(parserLiaison),
	m_xpathEnvSupport(xpathEnvSupport),
	m_domSupport(domSupport),
	m_executionContext(0),
	m_outputContextStack(),
	m_resultNamespacesStack(),
	m_dummyAttributesList(),
	m_scratchString(),
	m_attributeNamesVisited(),
	m_hasCDATASectionElements(false),
	m_xpathConstructionContext()
{
	m_outputContextStack.pushContext();
}



void
XSLTEngineImpl::reset()
{
	m_topLevelParams.clear();
	m_durationsTable.clear();
	m_stylesheetLocatorStack.clear();
	m_cdataStack.clear();

	m_stylesheetRoot = 0;

	m_outputContextStack.reset();

	m_outputContextStack.pushContext();

	m_xpathEnvSupport.reset();
	m_xpathFactory.reset();
	m_xobjectFactory.reset();
	m_domSupport.reset();

	m_resultNamespacesStack.clear();

	m_attributeNamesVisited.clear();

	m_hasCDATASectionElements = false;

	m_xpathConstructionContext.reset();
}



XSLTEngineImpl::~XSLTEngineImpl()
{
	reset();
}



//==========================================================
// SECTION: Main API Functions
//==========================================================



static const XalanDOMChar	s_dummyString = 0;


void
XSLTEngineImpl::process(
			const XSLTInputSource&			inputSource, 
	        const XSLTInputSource&			stylesheetSource,
	        XSLTResultTarget&				outputTarget,
			StylesheetConstructionContext&	constructionContext,
			StylesheetExecutionContext&		executionContext)
{
	XalanDOMString	xslIdentifier;

	if (0 == stylesheetSource.getSystemId())
	{
		xslIdentifier = XalanMessageLoader::getMessage(XalanMessages::InputXSL);
	}
	else
	{
		xslIdentifier = stylesheetSource.getSystemId();
	}

	bool totalTimeID = true;

	if(m_diagnosticsPrintWriter != 0)
	{
		pushTime(&totalTimeID);
	}

	XalanNode*	sourceTree = getSourceTreeFromInput(inputSource);

	m_stylesheetRoot = processStylesheet(stylesheetSource, constructionContext);

	if(0 != sourceTree && m_stylesheetRoot == 0)
	{
		// Didn't get a stylesheet from the input source, so look for a
		// stylesheet processing instruction...

		// The PI must be a child of the document...
		const XalanNode*	child = sourceTree->getFirstChild();

		XalanDOMString		theCurrentToken;
		XalanDOMString		theStylesheetURI;

		bool			isOK = false;

		while(child != 0 && isOK == false && theStylesheetURI.empty() == true)
		{
			if(XalanNode::PROCESSING_INSTRUCTION_NODE == child->getNodeType())
			{
				const XalanDOMString&	nodeName = child->getNodeName();

				if(equals(nodeName, s_stylesheetNodeName))
				{
					StringTokenizer 	tokenizer(child->getNodeValue(), s_piTokenizerString);

					while(tokenizer.hasMoreTokens() == true && (isOK == false || theStylesheetURI.empty() == true))
					{
						tokenizer.nextToken(theCurrentToken);

						if(equals(theCurrentToken, s_typeString))
						{
							tokenizer.nextToken(theCurrentToken);


							const XalanDOMString::size_type		theLength =
									theCurrentToken.length();

							if (theLength > 2)
							{
								theCurrentToken.erase(theLength - 1, 1);
								theCurrentToken.erase(0, 1);

								if(equals(theCurrentToken, s_typeValueString1) ||
									equals(theCurrentToken, s_typeValueString2) ||
									equals(theCurrentToken, s_typeValueString3) ||
									equals(theCurrentToken, s_typeValueString4))
								{
									isOK = true;
								}
							}
						}
						else if(equals(theCurrentToken, s_hrefString))
						{
							tokenizer.nextToken(theCurrentToken);

							const XalanDOMString::size_type		theLength =
									theCurrentToken.length();

							if (theLength > 2)
							{
								// Trim of the starting and trailing delimiters...
								theStylesheetURI.assign(theCurrentToken, 1, theLength - 2);
							}
						}
					}
				}
			}

			child = child->getNextSibling();
		}

		if (isOK == true && theStylesheetURI.empty() == false)
		{
			const XalanDOMChar* const	pxch = inputSource.getSystemId();

			const XalanDOMString		sysid(pxch == 0 ? &s_dummyString : pxch); 

			getStylesheetFromPIURL(
					theStylesheetURI,
					*sourceTree,
					sysid,
					true,
					constructionContext);
		}
	}

	if(0 == m_stylesheetRoot)
	{
		error(XalanMessageLoader::getMessage(XalanMessages::FailedToProcessStylesheet));
	}
	else if(0 != sourceTree)
	{
		executionContext.setStylesheetRoot(m_stylesheetRoot);

		FormatterListener* const	theFormatter =
				outputTarget.getFormatterListener();

		if (theFormatter != 0 && theFormatter->getPrefixResolver() == 0)
		{
			theFormatter->setPrefixResolver(this);
		}

		m_hasCDATASectionElements = m_stylesheetRoot->hasCDATASectionElements();

		m_stylesheetRoot->process(sourceTree, outputTarget, executionContext);
	}

	if(m_diagnosticsPrintWriter != 0)
	{
		displayDuration(XalanMessageLoader::getMessage(XalanMessages::TotalTime), &totalTimeID);
	}
}



void
XSLTEngineImpl::process(
			const XSLTInputSource&			inputSource, 
	        XSLTResultTarget&				outputTarget,
			StylesheetExecutionContext&		executionContext)
{
	bool	totalTimeID = true;

	if(m_diagnosticsPrintWriter != 0)
	{
		pushTime(&totalTimeID);
	}

	XalanNode* const	sourceTree = getSourceTreeFromInput(inputSource);

	if(0 != sourceTree)
	{
		if (m_stylesheetRoot == 0)
		{
			error(XalanMessageLoader::getMessage(XalanMessages::NoStylesheet));
		}

		FormatterListener* const	theFormatter =
				outputTarget.getFormatterListener();

		if (theFormatter != 0 && theFormatter->getPrefixResolver() == 0)
		{
			theFormatter->setPrefixResolver(this);
		}

		m_hasCDATASectionElements = m_stylesheetRoot->hasCDATASectionElements();

		m_stylesheetRoot->process(sourceTree, outputTarget, executionContext);
	}

	if(m_diagnosticsPrintWriter != 0)
	{
		displayDuration(XalanMessageLoader::getMessage(XalanMessages::TotalTime), &totalTimeID);
	}
}



StylesheetRoot*
XSLTEngineImpl::processStylesheet(
			const XalanDOMString&			xsldocURLString,
			StylesheetConstructionContext&	constructionContext)
{
	const XSLTInputSource	input(c_wstr(xsldocURLString));

	return processStylesheet(input, constructionContext);
}



StylesheetRoot*
XSLTEngineImpl::processStylesheet(
  			const XSLTInputSource&			stylesheetSource,
			StylesheetConstructionContext&	constructionContext)
{
	StylesheetRoot*		theStylesheet = 0;

	const XalanDOMChar* const	systemID = stylesheetSource.getSystemId();
	XalanNode* const			stylesheetNode = stylesheetSource.getNode();

	if (systemID != 0 || stylesheetNode != 0 || stylesheetSource.getStream() != 0)
	{
		XalanDOMString	xslIdentifier;

		theStylesheet = constructionContext.create(stylesheetSource);

		StylesheetHandler	stylesheetProcessor(*theStylesheet, constructionContext);

		if(stylesheetNode != 0)
		{
			const XalanNode::NodeType	theType = stylesheetNode->getNodeType();

			if (theType != XalanNode::ELEMENT_NODE && theType != XalanNode::DOCUMENT_NODE)
			{
				error(XalanMessageLoader::getMessage(XalanMessages::CompilingDOMStylesheetReqDocument));
			}
			else
			{
				xslIdentifier = XalanMessageLoader::getMessage(XalanMessages::InputXSL);

				FormatterTreeWalker tw(stylesheetProcessor);

				if (theType == XalanNode::DOCUMENT_NODE)
				{
					tw.traverse(stylesheetNode);
				}
				else
				{
					stylesheetProcessor.startDocument();

					tw.traverseSubtree(stylesheetNode);

					stylesheetProcessor.endDocument();
				}
			}
		}
		else
		{
			if (systemID != 0)
			{
				xslIdentifier = systemID;
			}

			if(m_diagnosticsPrintWriter != 0)
			{
				diag(XalanMessageLoader::getMessage(XalanMessages::Parsing_1Param, xslIdentifier));

				pushTime(&xslIdentifier);
			}

			m_parserLiaison.parseXMLStream(stylesheetSource,
										   stylesheetProcessor);

			if(m_diagnosticsPrintWriter != 0)
			{
				displayDuration(XalanMessageLoader::getMessage(XalanMessages::ParseOf_1Param, xslIdentifier),&xslIdentifier);
			}
		}

		theStylesheet->postConstruction(constructionContext);
	}

	return theStylesheet;
}



//==========================================================
// SECTION: XML Parsing Functions
//==========================================================

XalanNode*
XSLTEngineImpl::getSourceTreeFromInput(const XSLTInputSource&	inputSource)
{
	XalanNode*		sourceTree = inputSource.getNode();

	if(0 == sourceTree)
	{
		const XalanDOMString	xmlIdentifier = 0 != inputSource.getSystemId() ?
												XalanDOMString(inputSource.getSystemId()) :
												XalanMessageLoader::getMessage(XalanMessages::InputXML);

		if(m_diagnosticsPrintWriter != 0)
		{
			// In case we have a fragment identifier, go ahead and 
			// try to parse the XML here.

			diag(XalanMessageLoader::getMessage(XalanMessages::Parsing_1Param, xmlIdentifier));

			pushTime(&xmlIdentifier);
		}

#if defined(XALAN_VQ_SPECIAL_TRACE)
		QuantifyStartRecordingData();
#endif

		XalanDocument* const	theDocument =
						m_parserLiaison.parseXMLStream(inputSource,
													   xmlIdentifier);
		assert(theDocument != 0);

#if defined(XALAN_VQ_SPECIAL_TRACE)
		QuantifyStopRecordingData();
#endif
		if(0 != m_diagnosticsPrintWriter)
		{
			displayDuration(
				XalanMessageLoader::getMessage(XalanMessages::ParseOf_1Param, xmlIdentifier),
				&xmlIdentifier);
		}

		m_xpathEnvSupport.setSourceDocument(xmlIdentifier, theDocument);

		sourceTree = theDocument;
	}

	return sourceTree;
}



const XalanDOMString*
XSLTEngineImpl::getNamespaceForPrefix(const XalanDOMString&		prefix) const
{
	return m_resultNamespacesStack.getNamespaceForPrefix(prefix);
}



const XalanDOMString&
XSLTEngineImpl::getURI() const
{
	return s_emptyString;
}



XalanDocument*
XSLTEngineImpl::parseXML(
			const XalanDOMString&	urlString,
			DocumentHandlerType*	docHandler,
			XalanDocument*			docToRegister)
{
	
	XalanDocument*	doc =
			m_xpathEnvSupport.getSourceDocument(urlString);

	if(doc == 0)
	{
		EntityResolverType* const	theResolver = 
			m_parserLiaison.getEntityResolver();

		if (theResolver == 0)
		{
			const XSLTInputSource	inputSource(c_wstr(urlString));

			doc = parseXML(inputSource, docHandler, docToRegister);
		}
		else
		{
			const XalanAutoPtr<InputSourceType>		resolverInputSource =
				theResolver->resolveEntity(0, c_wstr(urlString));

			if (resolverInputSource.get() != 0)
			{
				doc = parseXML(*resolverInputSource.get(), docHandler, docToRegister);
			}
			else
			{
				const XSLTInputSource	inputSource(c_wstr(urlString));

				doc = parseXML(inputSource, docHandler, docToRegister);
			}
		}

		if (doc != 0)
		{
			m_xpathEnvSupport.setSourceDocument(urlString, doc);
		}
	}

	return doc;
}



XalanDocument*
XSLTEngineImpl::parseXML(
			const InputSourceType&	inputSource,
			DocumentHandlerType*	docHandler,
			XalanDocument*			docToRegister)
{
	if(0 != docHandler)
	{
		m_parserLiaison.parseXMLStream(inputSource, *docHandler);

		return docToRegister;
	}
	else
	{
		return m_parserLiaison.parseXMLStream(inputSource);
	}
}



Stylesheet*
XSLTEngineImpl::getStylesheetFromPIURL(
			const XalanDOMString&			xslURLString,
			XalanNode&						fragBase,
			const XalanDOMString&			xmlBaseIdent,
			bool							isRoot,
			StylesheetConstructionContext&	constructionContext)
{
	Stylesheet*				stylesheet = 0;

	XalanDOMString			stringHolder;

	XalanDOMString			localXSLURLString = trim(xslURLString);

	const XalanDOMString::size_type		fragIndex = indexOf(localXSLURLString, XalanUnicode::charNumberSign);

	const XalanDocument*	stylesheetDoc = 0;

	if(fragIndex == 0)
	{
		const XalanDOMString	fragID(localXSLURLString, 1);

		const XalanElement*		nsNode = 0;

		const XalanNode::NodeType	theType = fragBase.getNodeType();

		if (theType == XalanNode::DOCUMENT_NODE)
		{
			const XalanDocument&	doc =
#if defined(XALAN_OLD_STYLE_CASTS)
				(const XalanDocument&)fragBase;
#else
				static_cast<const XalanDocument&>(fragBase);
#endif

			nsNode = doc.getDocumentElement(); 
		}
		else if	(theType == XalanNode::ELEMENT_NODE)
		{
#if defined(XALAN_OLD_STYLE_CASTS)
			nsNode = (const XalanElement*)&fragBase;
#else
			nsNode = static_cast<const XalanElement*>(&fragBase);
#endif
		}
		else
		{
			XalanNode* const	node = fragBase.getParentNode();

			if	(node->getNodeType() == XalanNode::ELEMENT_NODE) 
			{
#if defined(XALAN_OLD_STYLE_CASTS)
				nsNode = (const XalanElement*)&fragBase;
#else
				nsNode = static_cast<XalanElement*>(node);
#endif
			}
			else
			{
				error(XalanMessageLoader::getMessage(XalanMessages::CantFindFragment_1Param, fragID));
			}
		}

		// Try a bunch of really ugly stuff to find the fragment.
		// What's the right way to do this?
		XalanDOMString	ds(XALAN_STATIC_UCODE_STRING("id("));

		ds += fragID;
		ds += XALAN_STATIC_UCODE_STRING(")");

		ElementPrefixResolverProxy		theProxy(nsNode, m_xpathEnvSupport, m_domSupport);

		XPathExecutionContextDefault	theExecutionContext(m_xpathEnvSupport,
															m_domSupport,
															m_xobjectFactory,
															&fragBase,
															0,
															&theProxy);

		const XObjectPtr	xobj(evalXPathStr(ds, theExecutionContext));
		assert(xobj.null() == false);

		NodeRefList		nl(xobj->nodeset());

		if(nl.getLength() == 0)
		{
			ds = XALAN_STATIC_UCODE_STRING("//*[@id='");
			ds += fragID;
			ds += XALAN_STATIC_UCODE_STRING("']");

			const XObjectPtr	xobj(evalXPathStr(ds, theExecutionContext));
			assert(xobj.null() == false);

			nl = xobj->nodeset();

			if(nl.getLength() == 0)
			{
				ds = XALAN_STATIC_UCODE_STRING("//*[@name='");
				ds += fragID;
				ds += XALAN_STATIC_UCODE_STRING("']");

				const XObjectPtr	xobj(evalXPathStr(ds, theExecutionContext));
				assert(xobj.null() == false);

				nl = xobj->nodeset();

				if(nl.getLength() == 0)
				{
					// Well, hell, maybe it's an XPath...
					const XObjectPtr	xobj(evalXPathStr(fragID, theExecutionContext));
					assert(xobj.null() == false);

					nl = xobj->nodeset();
				}
			}
		}

		if(nl.getLength() == 0)
		{
			error(XalanMessageLoader::getMessage(XalanMessages::CantFindFragment_1Param,fragID));
		}

		XalanNode* const	frag = nl.item(0);

		if(XalanNode::ELEMENT_NODE == frag->getNodeType())
		{
			if(m_diagnosticsPrintWriter != 0)
			{
				pushTime(frag);
			}

			XalanAutoPtr<Stylesheet>	theGuard;

			if(isRoot)
			{
				StylesheetRoot* const	theLocalRoot =
					constructionContext.create(stringHolder);

				stylesheet = theLocalRoot;

				m_stylesheetRoot = theLocalRoot;
			}
			else
			{
#if defined(XALAN_OLD_STYLE_CASTS)
				stylesheet = constructionContext.create(*((StylesheetRoot*)m_stylesheetRoot), stringHolder);
#else
				stylesheet = constructionContext.create(*const_cast<StylesheetRoot*>(m_stylesheetRoot), stringHolder);
#endif

				theGuard.reset(stylesheet);
			}

			StylesheetHandler stylesheetProcessor(*stylesheet, constructionContext);

			FormatterTreeWalker tw(stylesheetProcessor);

			stylesheetProcessor.startDocument();

			tw.traverseSubtree(frag);

			stylesheetProcessor.endDocument();

			if(m_diagnosticsPrintWriter != 0)
			{
				displayDuration(
						XalanMessageLoader::getMessage(XalanMessages::SetupOf_1Param,localXSLURLString),
						frag);
			}

			stylesheet->postConstruction(constructionContext);

			theGuard.release();
		}
		else
		{
			stylesheetDoc = 0;

			error(XalanMessageLoader::getMessage(XalanMessages::NodePointedByFragment,fragID));
		}
	}
	else
	{
		if(m_diagnosticsPrintWriter != 0)
		{
			diag(XalanMessageLoader::getMessage(XalanMessages::ParsingAndPreparing_1Param,localXSLURLString) + 
					XALAN_STATIC_UCODE_STRING(" =========="));
			pushTime(&localXSLURLString);
		}

		XalanAutoPtr<Stylesheet>	theGuard;

		const XalanDocument* const	theOwnerDocument =
				fragBase.getNodeType() == XalanNode::DOCUMENT_NODE ?
#if defined(XALAN_OLD_STYLE_CASTS)
				(const XalanDocument*)&fragBase :
#else
				static_cast<const XalanDocument*>(&fragBase) :
#endif
				fragBase.getOwnerDocument();
		assert(theOwnerDocument != 0);

		// Catch any XMLExceptions thrown, since we may not
		// be able to resolve the URL.  In that case, the
		// parser will throw an error.  We do this because
		// we don't know what sort of EntityResolvers might
		// be active, so we never want to error out here.
		try
		{
			if (length(xmlBaseIdent) == 0)
			{
				URISupport::getURLStringFromString(
							localXSLURLString,
							m_xpathEnvSupport.findURIFromDoc(theOwnerDocument),
							localXSLURLString);
			}
			else
			{
				URISupport::getURLStringFromString(
							localXSLURLString,
							xmlBaseIdent,
							localXSLURLString);
			}
		}
		catch(const XERCES_CPP_NAMESPACE_QUALIFIER XMLException&)
		{
		}

		if(isRoot)
		{
			StylesheetRoot* const	theLocalRoot =
					constructionContext.create(localXSLURLString);

			stylesheet = theLocalRoot;

			m_stylesheetRoot = theLocalRoot;
		}
		else
		{
#if defined(XALAN_OLD_STYLE_CASTS)
			stylesheet = new Stylesheet(*(StylesheetRoot*)m_stylesheetRoot, localXSLURLString, constructionContext);
#else
			stylesheet = new Stylesheet(*const_cast<StylesheetRoot*>(m_stylesheetRoot), localXSLURLString, constructionContext);
#endif

			theGuard.reset(stylesheet);
		}

		StylesheetHandler stylesheetProcessor(*stylesheet, constructionContext);

		typedef StylesheetConstructionContext::URLAutoPtrType	URLAutoPtrType;

		URLAutoPtrType	xslURL(constructionContext.getURLFromString(localXSLURLString));

		XSLTInputSource		inputSource(xslURL->getURLText());

		m_parserLiaison.parseXMLStream(inputSource, stylesheetProcessor);

		stylesheet->postConstruction(constructionContext);

		theGuard.release();

		if(m_diagnosticsPrintWriter != 0)
		{
			displayDuration(XalanMessageLoader::getMessage(XalanMessages::ParsingAndInitOf_1Param, localXSLURLString),&localXSLURLString);

		}
	}

	return stylesheet;
}



const StylesheetRoot*
XSLTEngineImpl::getStylesheetRoot() const
{
	return m_stylesheetRoot;
}



void
XSLTEngineImpl::setStylesheetRoot(const StylesheetRoot*		theStylesheet)
{
	m_stylesheetRoot = theStylesheet;
}



void
XSLTEngineImpl::setExecutionContext(StylesheetExecutionContext*		theExecutionContext)
{
	m_executionContext = theExecutionContext;
}



//==========================================================
// SECTION: Diagnostic functions
//==========================================================

XSLTEngineImpl::size_type
XSLTEngineImpl::getTraceListeners() const
{
	return m_traceListeners.size();
}



void
XSLTEngineImpl::addTraceListener(TraceListener* tl)
{
	if (tl != 0)
	{
		m_traceListeners.push_back(tl);
	}
}



void
XSLTEngineImpl::removeTraceListener(TraceListener*	tl)
{
	XALAN_USING_STD(remove)

	const TraceListenerVectorType::iterator		i =
		remove(
			m_traceListeners.begin(),
			m_traceListeners.end(),
			tl);

	m_traceListeners.erase(i);
}



void
XSLTEngineImpl::fireGenerateEvent(const GenerateEvent&	ge)
{
	XALAN_USING_STD(for_each)

	for_each(
		m_traceListeners.begin(),
		m_traceListeners.end(),
		TraceListener::TraceListenerGenerateFunctor(ge));
}



void
XSLTEngineImpl::fireSelectEvent(const SelectionEvent&	se)
{
	XALAN_USING_STD(for_each)

	for_each(
		m_traceListeners.begin(),
		m_traceListeners.end(),
		TraceListener::TraceListenerSelectFunctor(se));
}



void
XSLTEngineImpl::fireTraceEvent(const TracerEvent& te)
{
	XALAN_USING_STD(for_each)

	for_each(
		m_traceListeners.begin(),
		m_traceListeners.end(),
		TraceListener::TraceListenerTraceFunctor(te));
}



bool
XSLTEngineImpl::getTraceSelects() const
{
	return m_traceSelects;
}



void
XSLTEngineImpl::setTraceSelects(bool	b)
{
	m_traceSelects = b;
}



void
XSLTEngineImpl::message(
			const XalanDOMString&		msg,
			const XalanNode*			sourceNode,
			const ElemTemplateElement*	styleNode) const
{
	problem(msg, ProblemListener::eMESSAGE, sourceNode, styleNode);
}



void
XSLTEngineImpl::message(
			const XalanDOMString&	msg,
			const LocatorType&		locator,
			const XalanNode*		sourceNode) const
{
	problem(msg, ProblemListener::eMESSAGE, locator, sourceNode);
}



void
XSLTEngineImpl::problem(
			const XalanDOMString&				msg, 
			ProblemListener::eClassification	classification,
			const XalanNode*					sourceNode,
			const ElemTemplateElement*			styleNode) const
{
	const XalanDOMChar*		id = 0;

	XalanDOMString			uri;

	int						lineNumber = XalanLocator::getUnknownValue();
	int 					columnNumber = XalanLocator::getUnknownValue();

	const LocatorType*		locator = getLocatorFromStack();

	if (locator == 0 && styleNode != 0)
	{
		locator = styleNode->getLocator();
	}

	if (locator != 0)
	{
		id = locator->getPublicId();

		if (id == 0)
		{
			id = locator->getSystemId();
		}

		if (id != 0)
		{
			uri = id;
		}

		lineNumber = locator->getLineNumber();
		columnNumber = locator->getColumnNumber();
	}
	else if (styleNode != 0)
	{
		lineNumber = styleNode->getLineNumber();
		columnNumber = styleNode->getColumnNumber();

		uri = styleNode->getURI();
	}

	if (m_problemListener != 0)
	{
		m_problemListener->problem(
					ProblemListener::eXSLPROCESSOR,
					classification,
					sourceNode,
					styleNode,
					msg,
					id,
					lineNumber,
					columnNumber);
	}

	if (classification == ProblemListener::eERROR)
	{
		throw XSLTProcessorException(msg, uri, lineNumber, columnNumber);
	}
}



static const XalanDOMChar	theDummy = 0;

void
XSLTEngineImpl::problem(
			const XalanDOMString&				msg, 
			ProblemListener::eClassification	classification,
			const LocatorType&					locator,
			const XalanNode*					sourceNode) const
{
	const XalanDOMChar*		id = locator.getSystemId();

	if (id == 0)
	{
		id = &theDummy;
	}

	const XalanLocator::size_type	lineNumber = locator.getLineNumber();
	const XalanLocator::size_type 	columnNumber = locator.getColumnNumber();

	if (m_problemListener != 0)
	{
		m_problemListener->problem(
					ProblemListener::eXSLPROCESSOR,
					classification,
					sourceNode,
					0,
					msg,
					id,
					lineNumber,
					columnNumber);
	}

	if (classification == ProblemListener::eERROR)
	{
		throw XSLTProcessorException(msg, XalanDOMString(id), lineNumber, columnNumber);
	}
}



void
XSLTEngineImpl::warn(
			const XalanDOMString&		msg,
			const XalanNode*			sourceNode,
			const ElemTemplateElement*	styleNode) const
{
	const LocatorType* const	locator = styleNode == 0 ? 0 : styleNode->getLocator();

	if (locator != 0)
	{
		problem(msg, ProblemListener::eWARNING, *locator, sourceNode);
	}
	else
	{
		problem(msg, ProblemListener::eWARNING, sourceNode, styleNode);
	}
}



void
XSLTEngineImpl::warn(
			const XalanDOMString&	msg,
			const LocatorType&		locator,
			const XalanNode*		sourceNode) const
{
	problem(msg, ProblemListener::eWARNING, locator, sourceNode);
}



void
XSLTEngineImpl::warn(
			const char*					msg,
			const XalanNode*			sourceNode,
			const ElemTemplateElement*	styleNode) const
{
	warn(TranscodeFromLocalCodePage(msg), sourceNode, styleNode);
}



void
XSLTEngineImpl::error(
			const XalanDOMString&		msg,
			const XalanNode*			sourceNode,
			const ElemTemplateElement*	styleNode) const
{
	problem(msg, ProblemListener::eERROR, sourceNode, styleNode);
}



void
XSLTEngineImpl::error(
			const XalanDOMString&	msg,
			const LocatorType&		locator,
			const XalanNode*		sourceNode) const
{
	problem(msg, ProblemListener::eERROR, locator, sourceNode);
}



void
XSLTEngineImpl::pushTime(const void*	key)
{
	if(0 != key)
	{
#if defined(XALAN_STRICT_ANSI_HEADERS)
		m_durationsTable[key] = std::clock();
#else
		m_durationsTable[key] = clock();
#endif
	}
}



XSLTEngineImpl::ClockType
XSLTEngineImpl::popDuration(const void*		key)
{
	ClockType 	clockTicksDuration = 0;

	if(0 != key)
	{
		const DurationsTableMapType::iterator	i =
				m_durationsTable.find(key);

		if (i != m_durationsTable.end())
		{
#if defined(XALAN_STRICT_ANSI_HEADERS)
			clockTicksDuration = std::clock() - (*i).second;
#else
			clockTicksDuration = clock() - (*i).second;
#endif

			m_durationsTable.erase(i);
		}
	}

	return clockTicksDuration;
}



void
XSLTEngineImpl::displayDuration(
			const XalanDOMString&	info,
			const void*				key)
{
	if(0 != key)
	{
		const ClockType	theDuration = popDuration(key);

		if(m_diagnosticsPrintWriter != 0)
		{
			const double	millis = (double(theDuration) / CLOCKS_PER_SEC) * 1000.0;

			m_diagnosticsPrintWriter->print(info);

			m_diagnosticsPrintWriter->print(" took ");
			m_diagnosticsPrintWriter->print(millis);
			m_diagnosticsPrintWriter->println(" milliseconds.");
		}
	}
}



void
XSLTEngineImpl::setDiagnosticsOutput(PrintWriter*	pw)
{
	m_diagnosticsPrintWriter = pw;

	m_problemListener->setPrintWriter(pw);
}



void
XSLTEngineImpl::diag(const XalanDOMString& 	s) const
{
	if (0 != m_diagnosticsPrintWriter)
	{
		m_diagnosticsPrintWriter->println(s);
	}
}



void
XSLTEngineImpl::diag(const char*	s) const
{
	diag(TranscodeFromLocalCodePage(s));
}



void
XSLTEngineImpl::setQuietConflictWarnings(bool	b)
{
	m_quietConflictWarnings = b;
}



void
XSLTEngineImpl::setDocumentLocator(const LocatorType*	/* locator */)
{
	// Do nothing for now
}



void
XSLTEngineImpl::traceSelect(
			StylesheetExecutionContext& 	executionContext,
			const ElemTemplateElement&		theTemplate,
			const NodeRefListBase&			nl,
			const XPath*					xpath) const
{
	if (0 != m_diagnosticsPrintWriter)
	{
		XalanDOMString	msg = theTemplate.getElementName() + XalanDOMString(XALAN_STATIC_UCODE_STRING(": "));

		if(xpath != 0)
		{
			msg += xpath->getExpression().getCurrentPattern();
			msg += XALAN_STATIC_UCODE_STRING(", ");
		}
		else
		{
			msg += XALAN_STATIC_UCODE_STRING("*|text(), (default select), ");
		}

		msg += UnsignedLongToDOMString(nl.getLength());
		msg += XALAN_STATIC_UCODE_STRING(" selected");

		const XalanQName* const		mode = executionContext.getCurrentMode();

		if(mode != 0 && mode->isEmpty() == false)
		{
			msg += XALAN_STATIC_UCODE_STRING(", mode = {");
			msg += mode->getNamespace();
			msg += XALAN_STATIC_UCODE_STRING("}");
			msg += mode->getLocalPart();
		}

		m_diagnosticsPrintWriter->println(msg);
	}
}



void
XSLTEngineImpl::startDocument()
{
	assert(getFormatterListener() != 0);
	assert(m_executionContext != 0);

	if (getHasPendingStartDocument() == false)
	{
		assert(m_cdataStack.empty() == true || m_outputContextStack.size() != 1);

		m_resultNamespacesStack.pushContext();

		setHasPendingStartDocument(true);

		setMustFlushPendingStartDocument(false);

		if (m_hasCDATASectionElements == true)
		{
			m_cdataStack.push_back(false);
		}
	}
	else if (getMustFlushPendingStartDocument() == true)
	{
		getFormatterListener()->startDocument();

		if(getTraceListeners() > 0)
		{
			const GenerateEvent		ge(GenerateEvent::EVENTTYPE_STARTDOCUMENT);

			fireGenerateEvent(ge);
		}

		// Reset this, but leave getMustFlushPendingStartDocument() alone,
		// since it will still be needed.
		setHasPendingStartDocument(false);
	}
}



void
XSLTEngineImpl::endDocument()
{
	assert(getFormatterListener() != 0);
	assert(m_executionContext != 0);

	setMustFlushPendingStartDocument(true);

	flushPending();

	getFormatterListener()->endDocument();

	if(getTraceListeners() > 0)
	{
		const GenerateEvent		ge(GenerateEvent::EVENTTYPE_ENDDOCUMENT);

		fireGenerateEvent(ge);
	}

	if (m_hasCDATASectionElements == true)
	{
		m_cdataStack.pop_back();
	}
	assert(m_cdataStack.empty() == true);

	m_resultNamespacesStack.popContext();

	assert(m_resultNamespacesStack.empty() == true);
}



void
XSLTEngineImpl::addResultAttribute(
			AttributeListImpl&			attList,
			const XalanDOMString&		aname,
			const XalanDOMChar*			value)
{
	assert(value != 0);

	// Always exclude the implicit XML declaration...
	if (equals(aname, DOMServices::s_XMLNamespacePrefix) == false) 
	{
		bool	fExcludeAttribute = false;

		if (equals(aname, DOMServices::s_XMLNamespace) == true)
		{
			// OK, we're adding a default namespace declaration.  So see if the length
			// of the namespace is 0.  If it's not, go ahead and add the declaration.
			// If it's not, it means we're "turning off" the previous default
			// declaration.

			const XalanDOMString* const		currentDefaultNamespace =
						getNamespaceForPrefix(s_emptyString);

			const XalanDOMString::size_type		theLength = length(value);

			// Note that we use an empty string for the prefix, instead of "xmlns", since the
			// prefix really is "".
			if (theLength != 0)
			{
				if (currentDefaultNamespace != 0 &&
					equals(*currentDefaultNamespace, value, theLength) == true)
				{
					fExcludeAttribute = true;
				}
				else
				{
					addResultNamespaceDecl(s_emptyString, value, theLength);
				}
			}
			else
			{
				// OK, we're turning of the previous default namespace declaration.
				// Check to see if there is one, and if there isn't, don't add
				// the namespace declaration _and_ don't add the attribute.
				if (currentDefaultNamespace != 0 && length(*currentDefaultNamespace) != 0)
				{
					addResultNamespaceDecl(s_emptyString, value, theLength);
				}
				else
				{
					fExcludeAttribute = true;
				}
			}
		}
		else if (startsWith(aname, DOMServices::s_XMLNamespaceWithSeparator) == true)
		{
			assert(m_executionContext != 0);

			StylesheetExecutionContext::GetAndReleaseCachedString	prefixGuard(*m_executionContext);

			XalanDOMString&		prefix = prefixGuard.get();

			substring(aname, prefix, DOMServices::s_XMLNamespaceWithSeparatorLength);

			const XalanDOMString* const	theNamespace = getResultNamespaceForPrefix(prefix);

			const XalanDOMString::size_type		theLength = length(value);

			if (theNamespace == 0 || equals(*theNamespace, value, theLength) == false)
			{
				addResultNamespaceDecl(prefix, value, theLength);
			}
			else
			{
				fExcludeAttribute = true;
			}
		}

		if (fExcludeAttribute == false)
		{
			attList.addAttribute(
				c_wstr(aname),
				c_wstr(Constants::ATTRTYPE_CDATA),
				c_wstr(value));
		}
	}
}



bool
XSLTEngineImpl::pendingAttributesHasDefaultNS() const
{
	const AttributeListImpl&	thePendingAttributes =
		getPendingAttributes();

	const unsigned int	n = thePendingAttributes.getLength();

	for(unsigned int i = 0; i < n; i++)
	{
		if(equals(thePendingAttributes.getName(i),
				  DOMServices::s_XMLNamespace) == true)
		{
			return true;
		}
	}

	return false;
}



void
XSLTEngineImpl::flushPending()
{
	if(getHasPendingStartDocument() == true && 0 != length(getPendingElementName()))
	{
		assert(getFormatterListener() != 0);
		assert(m_executionContext != 0);

		if (m_stylesheetRoot->isOutputMethodSet() == false)
		{
			if (equalsIgnoreCaseASCII(getPendingElementName(),
								 Constants::ELEMNAME_HTML_STRING) == true &&
				pendingAttributesHasDefaultNS() == false)
			{
				if (getFormatterListener()->getOutputFormat() == FormatterListener::OUTPUT_METHOD_XML)
				{
					// Yuck!!! Ugly hack to switch to HTML on-the-fly.
					FormatterListener* const	theFormatter =
							getFormatterListener();
					assert(theFormatter->getWriter() != 0);

					setFormatterListenerImpl(
						m_executionContext->createFormatterToHTML(
							*theFormatter->getWriter(),
							theFormatter->getEncoding(),
							theFormatter->getMediaType(),
							theFormatter->getDoctypeSystem(),
							theFormatter->getDoctypePublic(),
							true,	// indent
							theFormatter->getIndent() > 0 ? theFormatter->getIndent() :
											StylesheetExecutionContext::eDefaultHTMLIndentAmount));

					if (m_hasCDATASectionElements == true)
					{
						m_hasCDATASectionElements = false;
					}
				}
			}
		}
	}

	if(getHasPendingStartDocument() == true && getMustFlushPendingStartDocument() == true)
	{
		startDocument();
	}

	XalanDOMString&		thePendingElementName = getPendingElementNameImpl();

	if(0 != length(thePendingElementName) && getMustFlushPendingStartDocument() == true)
	{
		assert(getFormatterListener() != 0);
		assert(m_executionContext != 0);

		if(m_hasCDATASectionElements == true)
		{
			m_cdataStack.push_back(isCDataResultElem(thePendingElementName));
		}

		AttributeListImpl&	thePendingAttributes =
				getPendingAttributesImpl();

		getFormatterListener()->startElement(c_wstr(thePendingElementName), thePendingAttributes);

		if(getTraceListeners() > 0)
		{
			const GenerateEvent		ge(
				GenerateEvent::EVENTTYPE_STARTELEMENT,
				thePendingElementName,
				&thePendingAttributes);

			fireGenerateEvent(ge);
		}

		thePendingAttributes.clear();

		clear(thePendingElementName);
	}
}



void
XSLTEngineImpl::startElement(const XalanDOMChar*	name)
{
	assert(getFormatterListener() != 0);
	assert(name != 0);

	flushPending();

	m_resultNamespacesStack.pushContext();

	setPendingElementName(name);

	setMustFlushPendingStartDocument(true);
}



void
XSLTEngineImpl::startElement(
			const XalanDOMChar*		name,
			AttributeListType&		atts)
{
	assert(getFormatterListener() != 0);
	assert(name != 0);

	flushPending();

	const unsigned int	nAtts = atts.getLength();

	assert(m_outputContextStack.empty() == false);

	AttributeListImpl&	thePendingAttributes =
		getPendingAttributesImpl();

	thePendingAttributes.clear();

	for(unsigned int i = 0; i < nAtts; i++)
	{
		thePendingAttributes.addAttribute(
			atts.getName(i),
			atts.getType(i),
			atts.getValue(i));
	}

	m_resultNamespacesStack.pushContext();

	setPendingElementName(name);
}



void
XSLTEngineImpl::endElement(const XalanDOMChar*	name)
{
	assert(getFormatterListener() != 0);
	assert(name != 0);

	flushPending();

	getFormatterListener()->endElement(name);

	if(getTraceListeners() > 0)
	{
		const GenerateEvent		ge(GenerateEvent::EVENTTYPE_ENDELEMENT, name, &getPendingAttributesImpl());

		fireGenerateEvent(ge);
	}

	m_resultNamespacesStack.popContext();

	if(m_hasCDATASectionElements == true)
	{
		assert(m_cdataStack.empty() == false);

		m_cdataStack.pop_back();
	}
}



void
XSLTEngineImpl::characters(
			const XalanDOMChar*			ch,
			XalanDOMString::size_type 	length)
{
	characters(ch,
			   0,
			   length);
}



void
XSLTEngineImpl::characters(
			const XalanDOMChar*			ch,
			XalanDOMString::size_type	start,
			XalanDOMString::size_type	length)
{
	assert(getFormatterListener() != 0);
	assert(ch != 0);
	assert(m_hasCDATASectionElements == m_stylesheetRoot->hasCDATASectionElements());

	doFlushPending();

	if(generateCDATASection() == true)
	{
		getFormatterListener()->cdata(ch + start, length);

		if(getTraceListeners() > 0)
		{
			fireCharacterGenerateEvent(ch, start, length, true);
		}
	}
	else
	{
		getFormatterListener()->characters(ch + start, length);

		if(getTraceListeners() > 0)
		{
			fireCharacterGenerateEvent(ch, start, length, false);
		}
	}
}



void
XSLTEngineImpl::characters(const XalanNode&		node)
{
	assert(getFormatterListener() != 0);
	assert(m_hasCDATASectionElements == m_stylesheetRoot->hasCDATASectionElements());

	doFlushPending();

	if(generateCDATASection() == true)
	{
		DOMServices::getNodeData(node, *getFormatterListener(), &FormatterListener::cdata);

		if(getTraceListeners() > 0)
		{
			fireCharacterGenerateEvent(node, true);
		}
	}
	else
	{
		DOMServices::getNodeData(node, *getFormatterListener(), &FormatterListener::characters);

		if(getTraceListeners() > 0)
		{
			fireCharacterGenerateEvent(node, false);
		}
	}
}



void
XSLTEngineImpl::characters(const XObjectPtr&	xobject)
{
	assert(getFormatterListener() != 0);
	assert(xobject.null() == false);
	assert(m_hasCDATASectionElements == m_stylesheetRoot->hasCDATASectionElements());

	doFlushPending();

	if(generateCDATASection() == true)
	{
		xobject->str(*getFormatterListener(), &FormatterListener::cdata);

		if(getTraceListeners() > 0)
		{
			fireCharacterGenerateEvent(xobject, true);
		}
	}
	else
	{
		xobject->str(*getFormatterListener(), &FormatterListener::characters);

		if(getTraceListeners() > 0)
		{
			fireCharacterGenerateEvent(xobject, false);
		}
	}
}



void 
XSLTEngineImpl::charactersRaw(
			const XalanDOMChar*			ch,
			XalanDOMString::size_type	start,
			XalanDOMString::size_type	length)
{
	assert(ch != 0);

	doFlushPending();

	getFormatterListener()->charactersRaw(ch, length);

	if(getTraceListeners() > 0)
	{
		fireCharacterGenerateEvent(ch, start, length, false);
	}
}



void
XSLTEngineImpl::charactersRaw(const XalanNode&	node)
{
	doFlushPending();

	DOMServices::getNodeData(node, *getFormatterListener(), &FormatterListener::charactersRaw);

	if(getTraceListeners() > 0)
	{
		fireCharacterGenerateEvent(node, false);
	}
}



void
XSLTEngineImpl::charactersRaw(const XObjectPtr&		xobject)
{
	doFlushPending();

	xobject->str(*getFormatterListener(), &FormatterListener::charactersRaw);

	if(getTraceListeners() > 0)
	{
		fireCharacterGenerateEvent(xobject, false);
	}
}



void
XSLTEngineImpl::resetDocument()
{
	assert(getFormatterListener() != 0);

	flushPending();
	
	getFormatterListener()->resetDocument();
}



void
XSLTEngineImpl::ignorableWhitespace(
			const XalanDOMChar*			ch,
			XalanDOMString::size_type	length)
{
	assert(getFormatterListener() != 0);
	assert(ch != 0);

	doFlushPending();

	getFormatterListener()->ignorableWhitespace(ch, length);

	if(getTraceListeners() > 0)
	{
		GenerateEvent ge(GenerateEvent::EVENTTYPE_IGNORABLEWHITESPACE,
					ch, 0, length);

		fireGenerateEvent(ge);
	}
}



void
XSLTEngineImpl::processingInstruction(
			const XalanDOMChar*		target,
			const XalanDOMChar*		data)
{
	assert(getFormatterListener() != 0);
	assert(target != 0);
	assert(data != 0);

	doFlushPending();

	getFormatterListener()->processingInstruction(target, data);

	if(getTraceListeners() > 0)
	{
		GenerateEvent ge(
				GenerateEvent::EVENTTYPE_PI,
                target,
				data);

		fireGenerateEvent(ge);
	}
}



void
XSLTEngineImpl::comment(const XalanDOMChar*		data)
{
	assert(getFormatterListener() != 0);
	assert(data != 0);

	doFlushPending();

	getFormatterListener()->comment(data);

	if(getTraceListeners() > 0)
	{
		GenerateEvent ge(GenerateEvent::EVENTTYPE_COMMENT,
                                          data);
		fireGenerateEvent(ge);
	}
}


void
XSLTEngineImpl::entityReference(const XalanDOMChar*		name)
{
	assert(getFormatterListener() != 0);
	assert(name != 0);

	doFlushPending();

	getFormatterListener()->entityReference(name);

	if(getTraceListeners() > 0)
	{
		GenerateEvent ge(GenerateEvent::EVENTTYPE_ENTITYREF,
                                          name);

		fireGenerateEvent(ge);
	}
}



void
XSLTEngineImpl::cdata(
			const XalanDOMChar*			ch,
			XalanDOMString::size_type	start,
			XalanDOMString::size_type	length)
{
	assert(getFormatterListener() != 0);
	assert(ch != 0);

	setMustFlushPendingStartDocument(true);

	flushPending();

	getFormatterListener()->cdata(ch, length);

	if(getTraceListeners() > 0)
	{
		GenerateEvent ge(GenerateEvent::EVENTTYPE_CDATA, ch, start,
					length);

		fireGenerateEvent(ge);
	}
}



void
XSLTEngineImpl::checkDefaultNamespace(
			const XalanDOMString&	theElementName,
			const XalanDOMString&	theElementNamespaceURI)
{
	// Check for elements with no prefix...
	if (indexOf(theElementName, XalanUnicode::charColon) == theElementName.length())
	{
		// Get the current default namespace URI..
		const XalanDOMString* const		theResultNamespace =
			getResultNamespaceForPrefix(s_emptyString);

		// If there is one, and the URIs are different, add a new declaration.  This
		// will also "turn-off" the default namespace, if necessary.
		if (theResultNamespace != 0 && theElementNamespaceURI != *theResultNamespace)
		{
			addResultAttribute(DOMServices::s_XMLNamespace, theElementNamespaceURI);
		}
	}
}



void
XSLTEngineImpl::warnCopyTextNodesOnly(
			const XalanNode*	sourceNode,
			const LocatorType*	locator)
{
	warn(XalanMessageLoader::getMessage(XalanMessages::OnlyTextNodesCanBeCopied),
			*locator,
			sourceNode);
}



inline void
XSLTEngineImpl::cloneToResultTree(
			const XalanText&	node,
			bool				overrideStrip)
{
	assert(m_executionContext != 0 && m_stylesheetRoot != 0);
	assert(node.getParentNode() == 0 ||
		   node.getParentNode()->getNodeType() != XalanNode::DOCUMENT_NODE);

    if (overrideStrip == true ||
        m_executionContext->shouldStripSourceNode(node) == false)
    {
	    const XalanDOMString&	data = node.getData();
        assert(0 != length(data));

	    characters(toCharArray(data), 0, length(data));
    }
}



void
XSLTEngineImpl::cloneToResultTree(
			const XalanNode&	node,
			bool				cloneTextNodesOnly,
			const LocatorType*	locator)
{
	XalanNode::NodeType		posNodeType = node.getNodeType();

	if (posNodeType == XalanNode::DOCUMENT_FRAGMENT_NODE)
	{
		outputResultTreeFragment(
#if defined(XALAN_OLD_STYLE_CASTS)
				(const XalanDocumentFragment&)node,
#else
				static_cast<const XalanDocumentFragment&>(node),
#endif
			cloneTextNodesOnly,
			locator);
	}
	else if (cloneTextNodesOnly == true &&
		posNodeType != XalanNode::TEXT_NODE)
	{
		warnCopyTextNodesOnly(
			&node,
			locator);
	}
	else
	{
		const XalanNode*	pos = &node;

		while(pos != 0)
		{
			if(posNodeType != XalanNode::ATTRIBUTE_NODE)
			{
				flushPending();
			}

			cloneToResultTree(
							*pos,
							posNodeType,
							false,
							true,
							false,
							locator);

			const XalanNode*	nextNode = pos->getFirstChild();

			while(nextNode == 0)
			{
				if(XalanNode::ELEMENT_NODE == posNodeType)
				{
					endElement(c_wstr(pos->getNodeName()));
				}

				if(&node == pos)
					break;

				nextNode = pos->getNextSibling();

				if(nextNode == 0)
				{
					pos = pos->getParentNode();
					assert(pos != 0);

					posNodeType = pos->getNodeType();

					if (&node == pos)
					{
						if(XalanNode::ELEMENT_NODE == posNodeType)
						{
							endElement(c_wstr(pos->getNodeName()));
						}

						nextNode = 0;
						break;
					}
				}
			}

			pos = nextNode;

			if (pos != 0)
			{
				posNodeType = pos->getNodeType();
			}
		}
	}
}



void
XSLTEngineImpl::cloneToResultTree(
			const XalanNode&		node,
			XalanNode::NodeType		nodeType,
			bool					overrideStrip,
			bool					shouldCloneAttributes,
			bool					cloneTextNodesOnly,
			const LocatorType*		locator)
{
	assert(nodeType == node.getNodeType());
	assert(m_executionContext != 0);

	if(cloneTextNodesOnly == true)
	{
		if (nodeType != XalanNode::TEXT_NODE)
		{
			warnCopyTextNodesOnly(
					&node,
					locator);
		}
		else
		{
			const XalanText& 	tx =
#if defined(XALAN_OLD_STYLE_CASTS)
				(const XalanText&)node;
#else
				static_cast<const XalanText&>(node);
#endif

			cloneToResultTree(tx, overrideStrip);
		}
	}
	else
	{
		switch(nodeType)
		{
		case XalanNode::TEXT_NODE:
			{
				const XalanText& 	tx =
	#if defined(XALAN_OLD_STYLE_CASTS)
					(const XalanText&)node;
	#else
					static_cast<const XalanText&>(node);
	#endif

				cloneToResultTree(tx, overrideStrip);
			}
			break;

		case XalanNode::ELEMENT_NODE:
			{
				const XalanDOMString&	theElementName =
					node.getNodeName();

				startElement(c_wstr(theElementName));

				if(shouldCloneAttributes == true)
				{
					copyAttributesToAttList(
						node,
						getPendingAttributesImpl());

					copyNamespaceAttributes(node);
				}

				checkDefaultNamespace(theElementName, node.getNamespaceURI());
			}
			break;

		case XalanNode::CDATA_SECTION_NODE:
			{
				const XalanDOMString& 	data = node.getNodeValue();

				cdata(toCharArray(data), 0, length(data));
			}
			break;

		case XalanNode::ATTRIBUTE_NODE:
			if (length(getPendingElementName()) != 0)
			{
				addResultAttribute(
						getPendingAttributesImpl(),
						node.getNodeName(),
						node.getNodeValue());
			}
			else
			{
				warn(
					XalanMessageLoader::getMessage(XalanMessages::WrongAttemptingToAddAttrinbute),
					*locator,
					&node);
			}
			break;

		case XalanNode::COMMENT_NODE:
			comment(c_wstr(node.getNodeValue()));
			break;

		case XalanNode::ENTITY_REFERENCE_NODE:
			entityReference(c_wstr(node.getNodeName()));
			break;

		case XalanNode::PROCESSING_INSTRUCTION_NODE:
			processingInstruction(
					c_wstr(node.getNodeName()),
					c_wstr(node.getNodeValue()));
			break;

		case XalanNode::DOCUMENT_FRAGMENT_NODE:
			assert(false);
			break;

		// Can't really do this, but we won't throw an error so that copy-of will
		// work
		case XalanNode::DOCUMENT_NODE:
		case XalanNode::DOCUMENT_TYPE_NODE:
		break;

		default:
			error(XalanMessageLoader::getMessage(XalanMessages::CantCreateItemInResultTree), *locator, &node);
		break;
		}
	}
}



void
XSLTEngineImpl::outputToResultTree(
			const XObject& 		value,
			bool				outputTextNodesOnly,
			const LocatorType*	locator)
{
	const XObject::eObjectType	type = value.getType();

	switch(type)
	{
	case XObject::eTypeBoolean:
	case XObject::eTypeNumber:
	case XObject::eTypeString:
		{
			const XalanDOMString&	s = value.str();

			characters(toCharArray(s), 0, length(s));
		}
		break;

	case XObject::eTypeNodeSet:
		{
			const NodeRefListBase&	nl = value.nodeset();

			const NodeRefListBase::size_type	nChildren = nl.getLength();

			for(NodeRefListBase::size_type i = 0; i < nChildren; i++)
			{
				XalanNode*			pos = nl.item(i);
				assert(pos != 0);

				XalanNode::NodeType		posNodeType = pos->getNodeType();

				if (outputTextNodesOnly == true &&
					posNodeType != XalanNode::TEXT_NODE)
				{
					warnCopyTextNodesOnly(
							pos,
							locator);
				}
				else
				{
					XalanNode* const	top = pos;

					while(0 != pos)
					{
						flushPending();

						XalanNode::NodeType		posNodeType = pos->getNodeType();

						cloneToResultTree(*pos, posNodeType, false, false, false, locator);

						XalanNode*	nextNode = pos->getFirstChild();

						while(0 == nextNode)
						{
							if(XalanNode::ELEMENT_NODE == posNodeType)
							{
								endElement(c_wstr(pos->getNodeName()));
							}

							if(top == pos)
								break;

							nextNode = pos->getNextSibling();

							if(0 == nextNode)
							{
								pos = pos->getParentNode();
								assert(pos != 0);

								posNodeType = pos->getNodeType();

								if(top == pos)
								{
									if(XalanNode::ELEMENT_NODE == posNodeType)
									{
										endElement(c_wstr(pos->getNodeName()));
									}

									nextNode = 0;
									break;
								}
							}
						}

						pos = nextNode;

						if (pos != 0)
						{
							posNodeType = pos->getNodeType();
						}
					}
				}
			}
		}
		break;
		
	case XObject::eTypeResultTreeFrag:
		outputResultTreeFragment(value, outputTextNodesOnly, locator);
		break;

	case XObject::eTypeNull:
	case XObject::eTypeUnknown:
	case XObject::eUnknown:
	default:
		assert(false);
		break;
	}
}



void
XSLTEngineImpl::outputResultTreeFragment(
			const XalanDocumentFragment& 	theTree,
			bool							outputTextNodesOnly,
			const LocatorType*				locator)
{
	for(XalanNode* child = theTree.getFirstChild(); child != 0; child = child->getNextSibling())
	{
		XalanNode*	pos = child;

		XalanNode::NodeType		posNodeType = pos->getNodeType();

		if (outputTextNodesOnly == true &&
			posNodeType != XalanNode::TEXT_NODE)
		{
			warnCopyTextNodesOnly(
					pos,
					locator);
		}
		else
		{
			XalanNode* const	top = pos;

			while(0 != pos)
			{
				flushPending();

				cloneToResultTree(*pos, posNodeType, true, true, false, locator);

				XalanNode*	nextNode = pos->getFirstChild();

				while(0 == nextNode)
				{
					if(XalanNode::ELEMENT_NODE == posNodeType)
					{
						endElement(c_wstr(pos->getNodeName()));
					}

					if(top == pos)
						break;

					nextNode = pos->getNextSibling();

					if(0 == nextNode)
					{
						pos = pos->getParentNode();

						if(0 == pos)
						{
							nextNode = 0;

							break;
						}
						else
						{
							assert(0 != pos);

							posNodeType = pos->getNodeType();

							if(top == pos)
							{
								if(XalanNode::ELEMENT_NODE == posNodeType)
								{
									endElement(c_wstr(pos->getNodeName()));
								}

								nextNode = 0;

								break;
							}
						}
					}
				}

				pos = nextNode;

				if (pos != 0)
				{
					posNodeType = pos->getNodeType();
				}
			}
		}
	}
}



bool
XSLTEngineImpl::isCDataResultElem(const XalanDOMString&		elementName) const
{
	assert(m_executionContext != 0);
	assert(m_hasCDATASectionElements == true);

	bool	fResult = false;

	// We only want to worry about cdata-section-elements when we're serializing the
	// result tree, which is only when the output context is 1.
	if (m_outputContextStack.size() == 1)
	{
		const XalanDOMString::size_type		indexOfNSSep = indexOf(elementName, XalanUnicode::charColon);

		if(indexOfNSSep == length(elementName))
		{
			const XalanDOMString* const		elemNS =
						getResultNamespaceForPrefix(s_emptyString);

			if (elemNS != 0)
			{
				fResult = m_stylesheetRoot->isCDATASectionElementName(XalanQNameByReference(*elemNS, elementName));
			}
			else
			{
				fResult = m_stylesheetRoot->isCDATASectionElementName(XalanQNameByReference(s_emptyString, elementName));
			}
		}
		else
		{
			typedef StylesheetExecutionContext::GetAndReleaseCachedString	GetAndReleaseCachedString;

			GetAndReleaseCachedString	elemLocalNameGuard(*m_executionContext);
			GetAndReleaseCachedString	prefixGuard(*m_executionContext);

			XalanDOMString&		elemLocalName = elemLocalNameGuard.get();
			XalanDOMString&		prefix = prefixGuard.get();

			substring(elementName, prefix, 0, indexOfNSSep);
			substring(elementName, elemLocalName, indexOfNSSep + 1);

			if(equals(prefix, DOMServices::s_XMLString))
			{
				fResult =
						m_stylesheetRoot->isCDATASectionElementName(XalanQNameByReference(DOMServices::s_XMLNamespaceURI, elemLocalName));
			}
			else
			{
				const XalanDOMString* const		elemNS =
					getResultNamespaceForPrefix(prefix);

				if(elemNS == 0)
				{
					error(XalanMessageLoader::getMessage(XalanMessages::PrefixMustResolveToNamespace_1Param,prefix));
				}
				else
				{
					fResult =
							m_stylesheetRoot->isCDATASectionElementName(XalanQNameByReference(*elemNS, elemLocalName));
				}
			}
		}
	}

	return fResult;
}
	


const XalanDOMString*
XSLTEngineImpl::getResultNamespaceForPrefix(const XalanDOMString&	prefix) const
{
	return m_resultNamespacesStack.getNamespaceForPrefix(prefix);
}
  


const XalanDOMString*
XSLTEngineImpl::getResultPrefixForNamespace(const XalanDOMString&	theNamespace) const
{
	return m_resultNamespacesStack.getPrefixForNamespace(theNamespace);
}



inline bool
isPrefixUsed(
			const XalanDOMString&		thePrefix,
			XalanDOMString::size_type	thePrefixLength,
			const XalanDOMChar*			theName,
			XalanDOMString::size_type	theNameLength)
{
	assert(thePrefixLength != 0);

	// The name must be greater than the length of the prefix + 1, since
	// there must be a ':' to separate the prefix from the local part...
	if (theNameLength <= thePrefixLength + 1)
	{
		return false;
	}
	else
	{
		assert(theName != 0);

		const XalanDOMString::size_type		theIndex = indexOf(
			theName,
			XalanUnicode::charColon);

		// OK, if the index of the ':' is the same as the length of the prefix,
		// and theElementName starts with thePrefix, then the prefix is in use.
		if (theIndex == thePrefixLength &&
			startsWith(theName, thePrefix) == true)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}



inline bool
isPrefixUsed(
			const XalanDOMString&		thePrefix,
			XalanDOMString::size_type	thePrefixLength,
			const XalanDOMString&		theName)
{
	return isPrefixUsed(thePrefix, thePrefixLength, c_wstr(theName), length(theName));
}



inline bool
isPrefixUsedOrDeclared(
			const XalanDOMString&		thePrefix,
			XalanDOMString::size_type	thePrefixLength,
			const XalanDOMChar*			theName,
			XalanDOMString::size_type	theNameLength)
{
	if (isPrefixUsed(thePrefix, thePrefixLength, theName, theNameLength) == true)
	{
		return true;
	}
	else
	{
		const XalanDOMString::size_type		theDeclarationLength =
			thePrefixLength + DOMServices::s_XMLNamespaceWithSeparatorLength;

		// If this is a namespace declaration for this prefix, then all of
		// these conditions must be true...
		if (theDeclarationLength == theNameLength &&
			startsWith(theName, DOMServices::s_XMLNamespaceWithSeparator) == true &&
			endsWith(theName, c_wstr(thePrefix)) == true)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}



inline bool
isPendingAttributePrefix(
			const AttributeListType&	thePendingAttributes,
			const XalanDOMString&		thePrefix,
			XalanDOMString::size_type	thePrefixLength)
{
	const unsigned int	thePendingAttributesCount =
				thePendingAttributes.getLength();

	if (thePendingAttributesCount == 0)
	{
		// No attributes, no problem...
		return false;
	}
	else
	{
		bool	fResult = false;

		// Check each attribute...
		for (unsigned int i = 0; i < thePendingAttributesCount; ++i)
		{
			const XalanDOMChar* const	thePendingAttributeName =
							thePendingAttributes.getName(i);
			assert(thePendingAttributeName != 0);

			if (isPrefixUsedOrDeclared(
					thePrefix,
					thePrefixLength,
					thePendingAttributeName,
					length(thePendingAttributeName)) == true)
			{
				fResult = true;

				break;
			}
		}

		return fResult;
	}
}



bool
XSLTEngineImpl::isPendingResultPrefix(const XalanDOMString&		thePrefix) const
{
	const XalanDOMString::size_type		thePrefixLength = length(thePrefix);
	assert(thePrefixLength > 0);

	// The element name must be greater than the length of the prefix + 1, since
	// there must be a ':' to separate the prefix from the local part...
	if (isPrefixUsed(thePrefix, thePrefixLength, getPendingElementName()) == true)
	{
		return true;
	}
	else
	{
		// The element is not using the prefix, so check the
		// pending attributes...
		return isPendingAttributePrefix(
						getPendingAttributes(),
						thePrefix,
						thePrefixLength);
	}
}



void
XSLTEngineImpl::addResultNamespace(
			const XalanDOMString&	thePrefix,
			const XalanDOMString&	theName,
			const XalanNode&		theNode,
			AttributeListImpl&		thePendingAttributes,
			bool					fOnlyIfPrefixNotPresent)
{
	if (fOnlyIfPrefixNotPresent == false ||
		m_resultNamespacesStack.prefixIsPresentLocal(thePrefix) == false)
	{
		const XalanDOMString* const 	desturi = getResultNamespaceForPrefix(thePrefix);
		const XalanDOMString&			srcURI = theNode.getNodeValue();

		if(desturi == 0 || equals(srcURI, *desturi) == false)
		{
			addResultAttribute(thePendingAttributes, theName, srcURI);
			addResultNamespaceDecl(thePrefix, srcURI);
		}
	}
}



void
XSLTEngineImpl::addResultNamespace(
			const XalanNode&	theNode,
			AttributeListImpl&	thePendingAttributes,
			bool				fOnlyIfPrefixNotPresent)
{
	assert(m_executionContext != 0);
	assert(theNode.getNodeType() == XalanNode::ATTRIBUTE_NODE);

	const XalanDOMString& 	aname = theNode.getNodeName();

	if (equals(aname, DOMServices::s_XMLNamespace) == true)
	{
		// Default namespace declaration...
		addResultNamespace(s_emptyString, aname, theNode, thePendingAttributes, fOnlyIfPrefixNotPresent);
	}
	else if (startsWith(aname, DOMServices::s_XMLNamespaceWithSeparator))
	{
		StylesheetExecutionContext::GetAndReleaseCachedString	prefixGuard(*m_executionContext);

		XalanDOMString& 	thePrefix = prefixGuard.get();

		substring(aname, thePrefix, DOMServices::s_XMLNamespaceWithSeparatorLength);

		addResultNamespace(thePrefix, aname, theNode, thePendingAttributes, fOnlyIfPrefixNotPresent);
	}
}



void
XSLTEngineImpl::copyNamespaceAttributes(const XalanNode&	src) 
{
	assert(m_attributeNamesVisited.empty() == true);

	const XalanNode*	parent = &src;

	while (parent != 0 &&
		   parent->getNodeType() == XalanNode::ELEMENT_NODE) 
	{
		const XalanNamedNodeMap* const	nnm =
				parent->getAttributes();
		assert(nnm != 0);

		const unsigned int	nAttrs = nnm->getLength();

		assert(m_outputContextStack.empty() == false);

		AttributeListImpl&	thePendingAttributes =
				getPendingAttributesImpl();

		for (unsigned int i = 0;  i < nAttrs; i++) 
		{
			const XalanNode* const	attr = nnm->item(i);
			assert(attr != 0);

			const XalanDOMString&	nodeName = attr->getNodeName();

			XALAN_USING_STD(find_if)

			if (find_if(
					m_attributeNamesVisited.begin(),
					m_attributeNamesVisited.end(),
					FindStringPointerFunctor(nodeName)) == m_attributeNamesVisited.end())
			{
				addResultNamespace(*attr, thePendingAttributes, true);

				m_attributeNamesVisited.push_back(&nodeName);
			}
		}

		parent = parent->getParentNode();
	}

	m_attributeNamesVisited.clear();
}



const XObjectPtr
XSLTEngineImpl::evalXPathStr(
			const XalanDOMString&	str,
			XPathExecutionContext&	executionContext)
{
	assert(executionContext.getPrefixResolver() != 0);

	XPath* const		theXPath = m_xpathFactory.create();

	const XPathGuard	theGuard(m_xpathFactory, theXPath);

    m_xpathProcessor->initXPath(
			*theXPath,
			m_xpathConstructionContext,
			str,
			*executionContext.getPrefixResolver(),
			getLocatorFromStack());

    return theXPath->execute(
			executionContext.getCurrentNode(),
			*executionContext.getPrefixResolver(),
			executionContext);
}



const XObjectPtr
XSLTEngineImpl::evalXPathStr(
			const XalanDOMString&	str,
			XalanNode*				contextNode,
			const PrefixResolver&	prefixResolver,
			XPathExecutionContext&	executionContext)
{
	XPath* const		theXPath = m_xpathFactory.create();

	const XPathGuard	theGuard(m_xpathFactory, theXPath);

    m_xpathProcessor->initXPath(
			*theXPath,
			m_xpathConstructionContext,
			str,
			prefixResolver,
			getLocatorFromStack());

    return theXPath->execute(contextNode, prefixResolver, executionContext);
}



const XObjectPtr
XSLTEngineImpl::evalXPathStr(
			const XalanDOMString&	str,
			XalanNode*				contextNode,
			const XalanElement&		prefixResolver,
			XPathExecutionContext&	executionContext)
{
	ElementPrefixResolverProxy	theProxy(&prefixResolver,
										 m_xpathEnvSupport,
										 m_domSupport);

	return evalXPathStr(str, contextNode, theProxy, executionContext);
}




/**
 * Create and initialize an xpath and return it.
 */
const XPath*
XSLTEngineImpl::createMatchPattern(
			const XalanDOMString&	str,
			const PrefixResolver&	resolver)
{
	XPath* const	xpath = m_xpathFactory.create();

	m_xpathProcessor->initMatchPattern(
			*xpath,
			m_xpathConstructionContext,
			str,
			resolver,
			getLocatorFromStack());

	return xpath;
}



void
XSLTEngineImpl::returnXPath(const XPath*	xpath)
{
	m_xpathFactory.returnObject(xpath);
}



inline void
XSLTEngineImpl::copyAttributeToTarget(
			const XalanDOMString&	attrName,
			const XalanDOMString&	attrValue,
			AttributeListImpl&		attrList)
{
	addResultAttribute(attrList, attrName, attrValue);
}



void
XSLTEngineImpl::copyAttributesToAttList(
			const XalanNode& 	node,
			AttributeListImpl&	attList)
{
	assert(m_stylesheetRoot != 0);

	const XalanNamedNodeMap* const	attributes =
		node.getAttributes();

	if (attributes != 0)
	{
		const unsigned int	nAttributes = attributes->getLength();

		for(unsigned int i = 0; i < nAttributes; ++i)  
		{	
			const XalanNode* const 	attr = attributes->item(i);
			assert(attr != 0);

			copyAttributeToTarget(
				attr->getNodeName(),
				attr->getNodeValue(),
				attList);
		}
	}
}



XMLParserLiaison&
XSLTEngineImpl::getXMLParserLiaison() const
{
	return m_parserLiaison;
}



const XalanDOMString
XSLTEngineImpl::getUniqueNamespaceValue()
{
	XalanDOMString	theResult;

	getUniqueNamespaceValue(theResult);

	return theResult;
}



void
XSLTEngineImpl::getUniqueNamespaceValue(XalanDOMString&		theValue)
{
	do
	{
		assign(m_scratchString, s_uniqueNamespacePrefix);

		UnsignedLongToDOMString(m_uniqueNSValue++, m_scratchString);
	} while(getResultNamespaceForPrefix(m_scratchString) != 0);

	append(theValue, m_scratchString);
}



void
XSLTEngineImpl::setStylesheetParam(
			const XalanDOMString&	theName,
			const XalanDOMString&	expression)
{
	const XalanQNameByValue		qname(theName, 0, m_xpathEnvSupport, m_domSupport);

	m_topLevelParams.push_back(ParamVectorType::value_type(qname, expression));
}



void
XSLTEngineImpl::setStylesheetParam(
			const XalanDOMString&	theName,
			XObjectPtr				theValue)
{
	const XalanQNameByValue		qname(theName, 0, m_xpathEnvSupport, m_domSupport);

	m_topLevelParams.push_back(ParamVectorType::value_type(qname, theValue));
}



void
XSLTEngineImpl::resolveTopLevelParams(StylesheetExecutionContext&	executionContext)
{
	executionContext.pushTopLevelVariables(m_topLevelParams);
}



FormatterListener*
XSLTEngineImpl::getFormatterListener() const
{
	return getFormatterListenerImpl();
}



void
XSLTEngineImpl::setFormatterListener(FormatterListener*		flistener)
{
	if (getHasPendingStartDocument() == true && getFormatterListener() != 0)
	{
		setMustFlushPendingStartDocument(true);

		flushPending();
	}

	setFormatterListenerImpl(flistener);
}



void
XSLTEngineImpl::fireCharacterGenerateEvent(
			const XalanNode&	theNode,
			bool				isCDATA)
{
	fireCharacterGenerateEvent(DOMServices::getNodeData(theNode), isCDATA);
}



void
XSLTEngineImpl::fireCharacterGenerateEvent(
			const XObjectPtr&	theXObject,
			bool				isCDATA)
{
	fireCharacterGenerateEvent(theXObject->str(), isCDATA);
}



void
XSLTEngineImpl::fireCharacterGenerateEvent(
			const XalanDOMString&	theString,
			bool					isCDATA)
{
	fireCharacterGenerateEvent(c_wstr(theString), 0, length(theString), isCDATA);
}



void
XSLTEngineImpl::fireCharacterGenerateEvent(
			const XalanDOMChar*			ch,
			XalanDOMString::size_type	start,
			XalanDOMString::size_type	length,
			bool						isCDATA)
{
	const GenerateEvent		ge(
		isCDATA == true ? GenerateEvent::EVENTTYPE_CDATA : GenerateEvent::EVENTTYPE_CHARACTERS,
		ch,
		start,
		length);

	fireGenerateEvent(ge);
}



void
XSLTEngineImpl::error(
			const char*			theMessage,
			const LocatorType*	theLocator,
			const XalanNode*	theSourceNode)
{
	assert(theMessage != 0);

	m_scratchString = theMessage;

	if (theLocator != 0)
	{
		error(m_scratchString, *theLocator, theSourceNode);
	}
	else
	{
		error(m_scratchString, theSourceNode);
	}
}



void
XSLTEngineImpl::warn(
			const char*			theMessage,
			const LocatorType*	theLocator,
			const XalanNode*	theSourceNode)
{
	assert(theMessage != 0);

	m_scratchString = theMessage;

	if (theLocator != 0)
	{
		warn(m_scratchString, *theLocator, theSourceNode);
	}
	else
	{
		warn(m_scratchString, theSourceNode);
	}
}



void
XSLTEngineImpl::installFunctions()
{
	XPath::installFunction(XPathFunctionTable::s_current, FunctionCurrent());
	XPath::installFunction(XPathFunctionTable::s_document, FunctionDocument());
	XPath::installFunction(XPathFunctionTable::s_elementAvailable, FunctionElementAvailable());
	XPath::installFunction(XPathFunctionTable::s_functionAvailable, FunctionFunctionAvailable());
	XPath::installFunction(XPathFunctionTable::s_formatNumber, FunctionFormatNumber());
	XPath::installFunction(XPathFunctionTable::s_generateId, FunctionGenerateID());
	XPath::installFunction(XPathFunctionTable::s_key, FunctionKey());
	XPath::installFunction(XPathFunctionTable::s_systemProperty, FunctionSystemProperty());
	XPath::installFunction(XPathFunctionTable::s_unparsedEntityUri, FunctionUnparsedEntityURI());
}



void
XSLTEngineImpl::uninstallFunctions()
{
	XPath::uninstallFunction(XPathFunctionTable::s_current);
	XPath::uninstallFunction(XPathFunctionTable::s_document);
	XPath::uninstallFunction(XPathFunctionTable::s_elementAvailable);
	XPath::uninstallFunction(XPathFunctionTable::s_functionAvailable);
	XPath::uninstallFunction(XPathFunctionTable::s_formatNumber);
	XPath::uninstallFunction(XPathFunctionTable::s_generateId);
	XPath::uninstallFunction(XPathFunctionTable::s_key);
	XPath::uninstallFunction(XPathFunctionTable::s_systemProperty);
	XPath::uninstallFunction(XPathFunctionTable::s_unparsedEntityUri);
}



XALAN_CPP_NAMESPACE_END


XALAN_USING_XALAN(XalanDOMString)



static XalanDOMString	s_XSLNameSpaceURL;

static XalanDOMString	s_XalanNamespaceURL;

static XalanDOMString	s_uniqueNamespacePrefix;

static XalanDOMString	s_stylesheetNodeName;

static XalanDOMString	s_typeString;

static XalanDOMString	s_hrefString;

static XalanDOMString	s_piTokenizerString;

static XalanDOMString	s_typeValueString1;

static XalanDOMString	s_typeValueString2;

static XalanDOMString	s_typeValueString3;

static XalanDOMString	s_typeValueString4;



XALAN_CPP_NAMESPACE_BEGIN



const XalanDOMString&	XSLTEngineImpl::s_XSLNameSpaceURL = ::s_XSLNameSpaceURL;

const XalanDOMString&	XSLTEngineImpl::s_XalanNamespaceURL = ::s_XalanNamespaceURL;

const XalanDOMString&	XSLTEngineImpl::s_uniqueNamespacePrefix = ::s_uniqueNamespacePrefix;

const XalanDOMString&	XSLTEngineImpl::s_stylesheetNodeName = ::s_stylesheetNodeName;

const XalanDOMString&	XSLTEngineImpl::s_typeString = ::s_typeString;

const XalanDOMString&	XSLTEngineImpl::s_hrefString = ::s_hrefString;

const XalanDOMString&	XSLTEngineImpl::s_piTokenizerString = ::s_piTokenizerString;

const XalanDOMString&	XSLTEngineImpl::s_typeValueString1 = ::s_typeValueString1;

const XalanDOMString&	XSLTEngineImpl::s_typeValueString2 = ::s_typeValueString2;

const XalanDOMString&	XSLTEngineImpl::s_typeValueString3 = ::s_typeValueString3;

const XalanDOMString&	XSLTEngineImpl::s_typeValueString4 = ::s_typeValueString4;


#if 0
#include <fstream>

void
dumpTable(
			const XSLTEngineImpl::ElementKeysMapType&	theTable,
			std::ostream&								theSourceStream,
			std::ostream&								theHeaderStream)
{
	XSLTEngineImpl::ElementKeysMapType::const_iterator	i = theTable.begin();

	while(i != theTable.end())
	{
		theSourceStream << "const XalanDOMChar\tXSLTEngineImpl::s_";

		const XalanDOMString&	theString = (*i).first;

		theHeaderStream << "\t// The string \"" << theString << "\"\n\tstatic const XalanDOMChar\ts_";

		bool	nextCap = false;

		XalanDOMString::const_iterator	j = theString.begin();

		while(*j)
		{
			if (*j == '-')
			{
				nextCap = true;
			}
			else
			{
				assert(*j >= 'a' && *j <= 'z');

				if (nextCap)
				{
					theSourceStream << char(*j -'a' + 'A');
					theHeaderStream << char(*j -'a' + 'A');

					nextCap = false;
				}
				else
				{
					theSourceStream << char(*j);
					theHeaderStream << char(*j);
				}
			}

			++j;
		}

		j = theString.begin();

		theSourceStream << "[] =\n{\n";
		theHeaderStream << "[];\n\n";

		while(*j)
		{
			if (*j == '-')
			{
				theSourceStream << "\tXalanUnicode::charHyphenMinus,\n";
			}
			else
			{
				assert(*j >= 'a' && *j <= 'z');

				theSourceStream << "\tXalanUnicode::charLetter_";

				theSourceStream << char(*j) << ",\n";
			}

			++j;
		}

		theSourceStream << "\t0\n};\n\n";

		++i;
	}
}
#endif


void
XSLTEngineImpl::initialize()
{
	::s_XSLNameSpaceURL = XALAN_STATIC_UCODE_STRING("http://www.w3.org/1999/XSL/Transform");

	::s_XalanNamespaceURL = XALAN_STATIC_UCODE_STRING("http://xml.apache.org/xalan");

	::s_uniqueNamespacePrefix = XALAN_STATIC_UCODE_STRING("ns");

	::s_stylesheetNodeName = XALAN_STATIC_UCODE_STRING("xml-stylesheet");

	::s_typeString = XALAN_STATIC_UCODE_STRING("type");

	::s_hrefString = Constants::ATTRNAME_HREF;

	::s_piTokenizerString = XALAN_STATIC_UCODE_STRING(" \t=");

	::s_typeValueString1 = XALAN_STATIC_UCODE_STRING("text/xml");

	::s_typeValueString2 = XALAN_STATIC_UCODE_STRING("text/xsl");

	::s_typeValueString3 = XALAN_STATIC_UCODE_STRING("application/xml");

	::s_typeValueString4 = XALAN_STATIC_UCODE_STRING("application/xml+xslt");

	installFunctions();
}



void
XSLTEngineImpl::terminate()
{
	uninstallFunctions();

	releaseMemory(::s_uniqueNamespacePrefix);

	releaseMemory(::s_XalanNamespaceURL);

	releaseMemory(::s_XSLNameSpaceURL);

	releaseMemory(::s_stylesheetNodeName);

	releaseMemory(::s_typeString);

	releaseMemory(::s_hrefString);

	releaseMemory(::s_piTokenizerString);

	releaseMemory(::s_typeValueString1);

	releaseMemory(::s_typeValueString2);

	releaseMemory(::s_typeValueString3);

	releaseMemory(::s_typeValueString4);
}



XALAN_CPP_NAMESPACE_END
