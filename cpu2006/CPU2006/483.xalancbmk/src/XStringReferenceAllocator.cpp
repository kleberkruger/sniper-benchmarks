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
#include "XStringReferenceAllocator.hpp"



XALAN_CPP_NAMESPACE_BEGIN



XStringReferenceAllocator::XStringReferenceAllocator(size_type	theBlockCount) :
	m_allocator(theBlockCount)
{
}



XStringReferenceAllocator::~XStringReferenceAllocator()
{
}



XStringReferenceAllocator::string_type*
XStringReferenceAllocator::createString(const XalanDOMString&	theString) 
{
	string_type* const	theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	string_type* const	theResult = new(theBlock) string_type(theString);

	m_allocator.commitAllocation(theBlock);

	return theResult;
}



XStringReferenceAllocator::string_type*
XStringReferenceAllocator::clone(const string_type&		value)
{
	string_type* const		theBlock = m_allocator.allocateBlock();
	assert(theBlock != 0);

	value.clone(theBlock);

	m_allocator.commitAllocation(theBlock);

	return theBlock;
}



bool 
XStringReferenceAllocator::destroy(string_type*	theString)
{
	return m_allocator.destroyObject(theString);
}



void 
XStringReferenceAllocator::reset()
{
	m_allocator.reset();
}



XALAN_CPP_NAMESPACE_END
