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
#include "XalanSourceTreeElementAAllocator.hpp"



XALAN_CPP_NAMESPACE_BEGIN



XalanSourceTreeElementAAllocator::XalanSourceTreeElementAAllocator(size_type	theBlockCount) :
	m_allocator(theBlockCount)
{
}



XalanSourceTreeElementAAllocator::~XalanSourceTreeElementAAllocator()
{
}



XalanSourceTreeElementAAllocator::ObjectType*
XalanSourceTreeElementAAllocator::create(
			const XalanDOMString&		theTagName,
			XalanSourceTreeDocument*	theOwnerDocument,
			XalanSourceTreeAttr**		theAttributes,
			AttributesCountType			theAttributeCount,
			XalanNode*					theParentNode,
			XalanNode*					thePreviousSibling,
			XalanNode*					theNextSibling,
			IndexType					theIndex)
{
	ObjectType* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	new(theBlock) ObjectType(
						theTagName,
						theOwnerDocument,
						theAttributes,
						theAttributeCount,
						theParentNode,
						thePreviousSibling,
						theNextSibling,
						theIndex);

	m_allocator.commitAllocation(theBlock);

	return theBlock;
}



void 
XalanSourceTreeElementAAllocator::reset()
{
	m_allocator.reset();
}



XALAN_CPP_NAMESPACE_END
