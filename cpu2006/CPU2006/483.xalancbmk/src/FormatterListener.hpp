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
#if !defined(FORMATTERLISTENER_HEADER_GUARD_1357924680)
#define FORMATTERLISTENER_HEADER_GUARD_1357924680

/**
 * $Id: FormatterListener.hpp,v 1.5 2004/02/26 22:34:18 mhoyt Exp $
 * 
 * $State: Exp $
 * 
 * @author David N. Bertoni (david_n_bertoni@lotus.com)
 */



// Base include file.  Must be first.
#include <PlatformSupportDefinitions.hpp>



#include <DocumentHandler.hpp>



#include <XalanDOMString.hpp>



XALAN_CPP_NAMESPACE_BEGIN



class PrefixResolver;
class Writer;



typedef XERCES_CPP_NAMESPACE_QUALIFIER Locator			LocatorType;
typedef XERCES_CPP_NAMESPACE_QUALIFIER AttributeList	AttributeListType;



/**
 * A SAX-based formatter interface for the XSL processor.  This interface 
 * will be called as result tree elements are constructed.
 */
class XALAN_PLATFORMSUPPORT_EXPORT FormatterListener : public XERCES_CPP_NAMESPACE_QUALIFIER DocumentHandler
{
public:

	typedef XERCES_CPP_NAMESPACE_QUALIFIER DocumentHandler	ParentType;

	// A handy typedef...  Must match DocumentHandler's type for characters(), etc...
	typedef unsigned int	size_type;

	enum eFormat
	{
		OUTPUT_METHOD_NONE = 0,
		OUTPUT_METHOD_XML = 1,
		OUTPUT_METHOD_HTML = 2,
		OUTPUT_METHOD_TEXT = 3,
		OUTPUT_METHOD_DOM = 4,
		OUTPUT_METHOD_OTHER = 5
	};

	FormatterListener(eFormat	theFormat);

	virtual
	~FormatterListener();


	eFormat
	getOutputFormat() const
	{
		return m_outputFormat;
	}

	/**
	 * Get the PrefixResolver for the FormatterListener
	 *
	 * @return A pointer to the PrefixResolver, if any.
	 */
	const PrefixResolver*
	getPrefixResolver() const
	{
		return m_prefixResolver;
	}

	/**
	 * Set the PrefixResolver for the FormatterListener
	 *
	 * @param thePrefixResolver A pointer to the PrefixResolver, if any.
	 */
	void
	setPrefixResolver(const PrefixResolver*		thePrefixResolver)
	{
		m_prefixResolver = thePrefixResolver;
	}

	/**
	 * Receive notification of character data. If available, when the
	 * disable-output-escaping attribute is used, output raw text without
	 * escaping.
	 *
	 * @param chars  pointer to characters from the XML document
	 * @param length number of characters to read from the array
	 * @exception SAXException
	 */
	virtual void
	charactersRaw(
			const XMLCh* const	chars,
			const size_type		length) = 0;

	/**
	 * Called when a Comment is to be constructed.
	 *
	 * @param   data	pointer to comment data
	 * @exception SAXException
	 */
	virtual void
	comment(const XMLCh* const	data) = 0;

	/**
	 * Receive notification of cdata.
	 *
	 * <p>The Parser will call this method to report each chunk of
	 * character data.  SAX parsers may return all contiguous character
	 * data in a single chunk, or they may split it into several
	 * chunks; however, all of the characters in any single event
	 * must come from the same external entity, so that the Locator
	 * provides useful information.</p>
	 *
	 * <p>The application must not attempt to read from the array
	 * outside of the specified range.</p>
	 *
	 * <p>Note that some parsers will report whitespace using the
	 * ignorableWhitespace() method rather than this one (validating
	 * parsers must do so).</p>
	 *
	 * @param ch     pointer to characters from the XML document
	 * @param length number of characters to read from the array
	 * @exception SAXException
	 */
	virtual void
	cdata(
			const XMLCh* const	ch,
			const size_type 	length) = 0;

	/**
	 * Receive notification of a entityReference.
	 *
	 * @param data pointer to characters from the XML document
	 * @exception SAXException
	 */
	virtual void
	entityReference(const XMLCh* const	name) = 0;


// These methods are inherited from DocumentHandler ...

    virtual void
	characters(
			const XMLCh* const	chars,
			const size_type		length) = 0;

    virtual void
	endDocument() = 0;

    virtual void
	endElement(const XMLCh* const	name) = 0;

	virtual void
	ignorableWhitespace(
			const XMLCh* const	chars,
			const size_type		length) = 0;

	virtual void
	processingInstruction(
			const XMLCh* const	target,
			const XMLCh* const	data) = 0;

	virtual void
	resetDocument() = 0;

	virtual void
	setDocumentLocator(const LocatorType* const		locator) = 0;

	virtual void
	startDocument() = 0;

	virtual void
	startElement(
			const	XMLCh* const	name,
			AttributeListType&		attrs) = 0;

	virtual Writer*
	getWriter() const;

	virtual const XalanDOMString&
	getDoctypeSystem() const;

	virtual const XalanDOMString&
	getDoctypePublic() const;

	virtual const XalanDOMString&
	getEncoding() const;

	virtual const XalanDOMString&
	getMediaType() const;

	virtual int
	getIndent() const;


	// Used when creating PI to work around limitations of
	// our interfaces...
	static const XalanDOMChar	s_piTarget[];

	static const XalanDOMChar	s_piData[];

#if defined(XALAN_INLINE_INITIALIZATION)
	static const XalanDOMString::size_type	s_piTargetLength = 5;
	static const XalanDOMString::size_type	s_piDataLength = 3;
#else
	static const XalanDOMString::size_type	s_piTargetLength;
	static const XalanDOMString::size_type	s_piDataLength;
#endif

protected:

	// Data membmers...
	const PrefixResolver*	m_prefixResolver;

	static const XalanDOMString		s_emptyString;

private:

	// Not implemented...
	FormatterListener(const FormatterListener&);

	FormatterListener&
	operator=(const FormatterListener&);

	bool
	operator==(const FormatterListener&) const;

	// Data membmers...
	const eFormat	m_outputFormat;
};



XALAN_CPP_NAMESPACE_END



#endif	// FORMATTERLISTENER_HEADER_GUARD_1357924680
