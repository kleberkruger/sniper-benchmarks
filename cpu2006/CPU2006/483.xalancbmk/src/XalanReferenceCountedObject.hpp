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
#if !defined(XALANREFERENCECOUNTEDOBJECT_HEADER_GUARD_1357924680)
#define XALANREFERENCECOUNTEDOBJECT_HEADER_GUARD_1357924680



// Base include file.  Must be first.
#include <PlatformSupportDefinitions.hpp>



XALAN_CPP_NAMESPACE_BEGIN



/**
 * Class to hold reference count information.
 */
class XALAN_PLATFORMSUPPORT_EXPORT XalanReferenceCountedObject
{
public:

	/**
	 * Increment reference count.	 
	 */
	static void
	addReference(XalanReferenceCountedObject*	theInstance);

	/**
	 * Decrement reference count.	 
	 */
	static void
	removeReference(XalanReferenceCountedObject*	theInstance);

protected:

	/**
	 * Create a XalanReferenceCountedObject.
	 */
	explicit
	XalanReferenceCountedObject();

	virtual
	~XalanReferenceCountedObject();

	virtual void 
	referenced() = 0;

	virtual void 
	dereferenced() = 0;

	virtual unsigned int
	getReferenceCount() const
	{
		return m_referenceCount;
	}

private:

	unsigned int	m_referenceCount;

	// Not implemented...
	XalanReferenceCountedObject&
	operator=(const XalanReferenceCountedObject&);

	XalanReferenceCountedObject(const XalanReferenceCountedObject&);
};



XALAN_CPP_NAMESPACE_END



#endif	// XALANREFERENCECOUNTEDOBJECT_HEADER_GUARD_1357924680
