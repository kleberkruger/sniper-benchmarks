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
#if !defined(XALANDEFAULTDOCUMENTBUILDER_HEADER_GUARD)
#define XALANDEFAULTDOCUMENTBUILDER_HEADER_GUARD



// Base include file.  Must be first.
#include <XalanTransformerDefinitions.hpp>



#include <XalanDocumentBuilder.hpp>



#include <XalanSourceTreeContentHandler.hpp>
#include <XalanSourceTreeDOMSupport.hpp>
#include <XalanSourceTreeParserLiaison.hpp>



XALAN_CPP_NAMESPACE_BEGIN



/**
 * This is class is designed to allow a XalanTranfomer object
 * to use a document that is build dynamically by a user.
 */
class XALAN_TRANSFORMER_EXPORT XalanDefaultDocumentBuilder : public XalanDocumentBuilder
{
public:

	/**
	 * Create a XalanDefaultDocumentBuilder instance,
	 *
	 * @param theURI An optional string to identify the document.
	 */
	XalanDefaultDocumentBuilder(const XalanDOMString&	theURI = XalanDOMString());

	virtual
	~XalanDefaultDocumentBuilder();

	virtual XalanDocument*
	getDocument() const;

	virtual XalanParsedSourceHelper*
	createHelper() const;

	virtual const XalanDOMString&
	getURI() const;

	virtual ContentHandlerType*
	getContentHandler();

	virtual DTDHandlerType*
	getDTDHandler();

	virtual LexicalHandlerType*
	getLexicalHandler();

private:

	// not implemented...
	XalanDefaultDocumentBuilder(const XalanDefaultDocumentBuilder&);

	XalanDefaultDocumentBuilder&
	operator=(const XalanDefaultDocumentBuilder&);

	// Data members...
	XalanSourceTreeDOMSupport		m_domSupport;

	XalanSourceTreeParserLiaison	m_parserLiaison;

	XalanSourceTreeContentHandler	m_contentHandler;

	const XalanDOMString			m_uri;
};



XALAN_CPP_NAMESPACE_END



#endif	// XALANDEFAULTDOCUMENTBUILDER_HEADER_GUARD
