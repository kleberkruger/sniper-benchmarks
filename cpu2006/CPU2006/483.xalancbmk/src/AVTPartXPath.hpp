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
#if !defined(XALAN_AVTPARTXPATH_HEADER_GUARD)
#define XALAN_AVTPARTXPATH_HEADER_GUARD 

/**
 * $Id: AVTPartXPath.hpp,v 1.4 2004/02/26 22:58:57 mhoyt Exp $
 * 
 * $State: Exp $
 * 
 */

// Base include file.  Must be first.
#include <XSLTDefinitions.hpp>



#include <XObject.hpp>



#include <AVTPart.hpp>



XALAN_CPP_NAMESPACE_BEGIN



class PrefixResolver;
class XPath;
class XPathEnvSupport;
class XPathFactory;
class XPathProcessor;



/**
 * Simple string part of a complex AVT.
 */
class AVTPartXPath: public AVTPart
{
public:

	/**
	 * Construct an XPath Attribute Value Template (AVT) part from an XPath.
	 *
	 * @param xpath XPath to evaluate
	 */
	AVTPartXPath(const XPath*	xpath);


	// These methods are inherited from AVTPart ...
	
	virtual void
	evaluate(
			XalanDOMString&			buf,
			XalanNode*				contextNode,
			const PrefixResolver&	prefixResolver,
			XPathExecutionContext&	executionContext) const;

	virtual void
	evaluate(
			XalanDOMString&			buf,
			const PrefixResolver&	prefixResolver,
			XPathExecutionContext&	executionContext) const;

private:

	/**
	 * XPath for evaluation;
	 */
	const XPath* const	m_pXPath;
};



XALAN_CPP_NAMESPACE_END



#endif	//XALAN_AVTPARTXPATH_HEADER_GUARD 
