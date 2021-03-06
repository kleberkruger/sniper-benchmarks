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
#include "XalanQNameByValueAllocator.hpp"



XALAN_CPP_NAMESPACE_BEGIN



XalanQNameByValueAllocator::XalanQNameByValueAllocator(size_type	theBlockCount) :
	m_allocator(theBlockCount)
{
}



XalanQNameByValueAllocator::~XalanQNameByValueAllocator()
{
}



XalanQNameByValueAllocator::data_type*
XalanQNameByValueAllocator::create(const XalanQNameByValue&	theSource)
{
	data_type* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	data_type* const	theResult =
		new(theBlock) data_type(theSource);

	m_allocator.commitAllocation(theBlock);

	return theResult;
}



XalanQNameByValueAllocator::data_type*
XalanQNameByValueAllocator::create(
			const XalanDOMString&	theNamespaceURI,
			const XalanDOMString&	theLocalPart)
{
	data_type* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	data_type* const	theResult =
		new(theBlock) data_type(theNamespaceURI, theLocalPart);

	m_allocator.commitAllocation(theBlock);

	return theResult;
}



XalanQNameByValueAllocator::data_type*
XalanQNameByValueAllocator::create(
			const XalanDOMString&		qname,
			const NamespacesStackType&	namespaces,
			const LocatorType*			locator,
			bool						fUseDefault)
{
	data_type* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	data_type* const	theResult =
		new(theBlock) data_type(qname, namespaces, locator, fUseDefault);

	m_allocator.commitAllocation(theBlock);

	return theResult;
}



XalanQNameByValueAllocator::data_type*
XalanQNameByValueAllocator::create(
			const XalanDOMChar*			qname,
			const NamespacesStackType&	namespaces,
			const LocatorType*			locator,
			bool						fUseDefault)
{
	data_type* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	data_type* const	theResult =
		new(theBlock) data_type(qname, namespaces, locator, fUseDefault);

	m_allocator.commitAllocation(theBlock);

	return theResult;
}



XalanQNameByValueAllocator::data_type*
XalanQNameByValueAllocator::create(
			const XalanDOMString&	qname,
			const XalanElement*		namespaceContext,
			const XPathEnvSupport&	envSupport,
			const DOMSupport& 		domSupport,
			const LocatorType*		locator)
{
	data_type* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	data_type* const	theResult =
		new(theBlock) data_type(qname, namespaceContext, envSupport, domSupport, locator);

	m_allocator.commitAllocation(theBlock);

	return theResult;
}



XalanQNameByValueAllocator::data_type*
XalanQNameByValueAllocator::create(
			const XalanDOMString&	qname,
			const PrefixResolver*	theResolver,
			const LocatorType*		locator)
{
	data_type* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	data_type* const	theResult =
		new(theBlock) data_type(qname, theResolver, locator);

	m_allocator.commitAllocation(theBlock);

	return theResult;
}



XALAN_CPP_NAMESPACE_END
