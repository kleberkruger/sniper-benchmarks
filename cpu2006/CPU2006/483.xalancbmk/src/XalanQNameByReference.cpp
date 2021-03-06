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
// Class header file...
#include "XalanQNameByReference.hpp"



XALAN_CPP_NAMESPACE_BEGIN



XalanQNameByReference::XalanQNameByReference() :
	XalanQName(),
	m_namespace(&s_emptyString),
	m_localpart(&s_emptyString)
{
}



XalanQNameByReference::XalanQNameByReference(
			const XalanDOMString&	theNamespace,
			const XalanDOMString&	theLocalPart) :
	XalanQName(),
	m_namespace(&theNamespace),
	m_localpart(&theLocalPart)
{
}



XalanQNameByReference::XalanQNameByReference(const XalanDOMString&	theLocalPart) :
	XalanQName(),
	m_namespace(&s_emptyString),
	m_localpart(&theLocalPart)
{
}



XalanQNameByReference::XalanQNameByReference(const XalanQName&	theQName) :
	XalanQName(),
	m_namespace(&theQName.getNamespace()),
	m_localpart(&theQName.getLocalPart())
{
}



XalanQNameByReference::~XalanQNameByReference()
{
}



const XalanDOMString&
XalanQNameByReference::getLocalPart() const
{
	assert(m_localpart != 0);

	return *m_localpart;
}



const XalanDOMString&
XalanQNameByReference::getNamespace() const
{
	assert(m_namespace != 0);

	return *m_namespace;
}



XALAN_CPP_NAMESPACE_END
