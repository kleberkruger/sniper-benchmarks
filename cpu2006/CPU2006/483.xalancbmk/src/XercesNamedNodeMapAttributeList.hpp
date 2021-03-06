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
#if !defined(XERCESNAMEDNODEMAPATTRIBUTELIST_HEADER_GUARD_1357924680)
#define XERCESNAMEDNODEMAPATTRIBUTELIST_HEADER_GUARD_1357924680



// Base include file.  Must be first.
#include <XercesParserLiaisonDefinitions.hpp>



#include <vector>



#include <xercesc/sax/AttributeList.hpp>



#include <XercesWrapperTypes.hpp>



XALAN_CPP_NAMESPACE_BEGIN



class XALAN_XERCESPARSERLIAISON_EXPORT XercesNamedNodeMapAttributeList : public XERCES_CPP_NAMESPACE_QUALIFIER AttributeList
{
public:

	typedef XERCES_CPP_NAMESPACE_QUALIFIER AttributeList	ParentType;

	explicit
	XercesNamedNodeMapAttributeList(const DOMNamedNodeMapType*	theMap);

	virtual
	~XercesNamedNodeMapAttributeList();

	// These are inherited from AttributeList
    virtual unsigned int
	getLength() const;

    virtual const XMLCh*
	getName(const unsigned int index) const;

    virtual const XMLCh*
	getType(const unsigned int index) const;

    virtual const XMLCh*
	getValue(const unsigned int index) const;

    virtual const XMLCh*
	getType(const XMLCh* const name) const;

    virtual const XMLCh*
	getValue(const XMLCh* const name) const;

	virtual const XMLCh* 
	getValue(const char* const name) const;

private:

	// Not implemented...
	XercesNamedNodeMapAttributeList&
	operator=(const XercesNamedNodeMapAttributeList&);

	bool
	operator==(const XercesNamedNodeMapAttributeList&);


	// Data members...
	const DOMNamedNodeMapType* const	m_nodeMap;

	const XMLSizeType					m_lastIndex;

	static const XMLCh	s_typeString[];
};



XALAN_CPP_NAMESPACE_END



#endif	// XERCESNAMEDNODEMAPATTRIBUTELIST_HEADER_GUARD_1357924680
