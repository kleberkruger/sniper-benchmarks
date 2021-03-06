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
#include "XercesElementWrapperAllocator.hpp"



XALAN_CPP_NAMESPACE_BEGIN



XercesElementWrapperAllocator::XercesElementWrapperAllocator(size_type	theBlockCount) :
	m_allocator(theBlockCount)
{
}



XercesElementWrapperAllocator::~XercesElementWrapperAllocator()
{
}



XercesElementWrapperAllocator::ObjectType*
XercesElementWrapperAllocator::create(
			const DOMElementType*			theXercesElement,
			const XercesWrapperNavigator&	theNavigator)
{
	ObjectType* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	new(theBlock) ObjectType(theXercesElement, theNavigator);

	m_allocator.commitAllocation(theBlock);

	return theBlock;
}



void 
XercesElementWrapperAllocator::reset()
{
	m_allocator.reset();
}



XALAN_CPP_NAMESPACE_END
