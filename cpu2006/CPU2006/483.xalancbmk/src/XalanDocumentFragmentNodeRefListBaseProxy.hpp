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
#if !defined(XALANDOCUMENTFRAGMENTNODEREFLISTBASEPROXY_HEADER_GUARD_1357924680)
#define XALANDOCUMENTFRAGMENTNODEREFLISTBASEPROXY_HEADER_GUARD_1357924680



// Base header file.  Must be first.
#include <XPathDefinitions.hpp>



// Base class header file.
#include <NodeRefListBase.hpp>



XALAN_CPP_NAMESPACE_BEGIN



class XalanDocumentFragment;



class XALAN_XPATH_EXPORT XalanDocumentFragmentNodeRefListBaseProxy : public NodeRefListBase
{
public:


	/**
	 * Construct an instance from a document fragment
	 * 
	 * @param value source document fragment.
	 */
	XalanDocumentFragmentNodeRefListBaseProxy(const XalanDocumentFragment&	value);

	/**
	 * Copy constructor
	 * 
	 * @param source source instance
	 */
	XalanDocumentFragmentNodeRefListBaseProxy(const XalanDocumentFragmentNodeRefListBaseProxy&	source);

	virtual
	~XalanDocumentFragmentNodeRefListBaseProxy();


	// These methods are inherited from NodeRefListBase...
	XalanNode*
	item(size_type	index) const;

	size_type
	getLength() const;

	size_type
	indexOf(const XalanNode*	theNode) const;

private:

	// Data members...
	const XalanDocumentFragment&	m_value;	
};



XALAN_CPP_NAMESPACE_END



#endif	// XALANDOCUMENTFRAGMENTNODEREFLISTBASEPROXY_HEADER_GUARD_1357924680
