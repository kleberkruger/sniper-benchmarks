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

#include "XSLTInputSource.hpp"



#include <cassert>

#if !defined(XALAN_CLASSIC_IOSTREAMS)
#include <istream>
#endif



#include <DOMStringHelper.hpp>
#include <StdBinInputStream.hpp>
#include <URISupport.hpp>



XALAN_CPP_NAMESPACE_BEGIN



XSLTInputSource::XSLTInputSource() :
	InputSource(),
	m_stream(0),
	m_node(0)
{
}



// $$$ ToDo:  Xerces' InputSource class does not yet have a copy
// constructor or assignment operator.  See bug #7944.
XSLTInputSource::XSLTInputSource(const XSLTInputSource&		theSource) :
#if 1
	InputSource(),
#else
	InputSource(theSource)
#endif
	m_stream(theSource.m_stream),
	m_node(theSource.m_node)
{
#if 1
	setIssueFatalErrorIfNotFound(theSource.getIssueFatalErrorIfNotFound());

	const XMLCh*	theValue = theSource.getSystemId();

	if (theValue != 0)
	{
		setSystemId(theValue);
	}

	theValue = theSource.getPublicId();

	if (theValue != 0)
	{
		setPublicId(theValue);
	}

	theValue = theSource.getEncoding();

	if (theValue != 0)
	{
		setEncoding(theValue);
	}
#endif
}



XSLTInputSource&
XSLTInputSource::operator=(const XSLTInputSource&	theRHS)
{
	if (this != &theRHS)
	{
		m_stream = theRHS.m_stream;
		m_node = theRHS.m_node;
#if 1
		setIssueFatalErrorIfNotFound(theRHS.getIssueFatalErrorIfNotFound());

		const XMLCh*	theValue = theRHS.getSystemId();

		if (theValue != 0)
		{
			setSystemId(theValue);
		}

		theValue = theRHS.getPublicId();

		if (theValue != 0)
		{
			setPublicId(theValue);
		}

		theValue = theRHS.getEncoding();

		if (theValue != 0)
		{
			setEncoding(theValue);
		}
#endif
	}

#if 1
	return *this;
#else
	return InputSource::operator=(theRHS);
#endif
}



XSLTInputSource::XSLTInputSource(const XMLCh*	systemId) :
	InputSource(systemId),
	m_stream(0),
	m_node(0)
{
}



XSLTInputSource::XSLTInputSource(const XalanDOMString&	systemId) :
	InputSource(systemId.c_str()),
	m_stream(0),
	m_node(0)
{
}



XSLTInputSource::XSLTInputSource(
			const XMLCh*	systemId,
			const XMLCh*	publicId) :
	InputSource(systemId, publicId),
	m_stream(0),
	m_node(0)
{
}



XSLTInputSource::XSLTInputSource(
			const XalanDOMString&	systemId,
			const XalanDOMString&	publicId) :
	InputSource(systemId.c_str(), publicId.c_str()),
	m_stream(0),
	m_node(0)
{
}



XSLTInputSource::XSLTInputSource(const char*	systemId) :
	InputSource(systemId),
	m_stream(0),
	m_node(0)
{
}



XSLTInputSource::XSLTInputSource(
			const char*		systemId,
			const char*		publicId) :
	InputSource(systemId,
				publicId),
	m_stream(0),
	m_node(0)
{
}



XSLTInputSource::XSLTInputSource(XalanNode*		node) :
	InputSource(),
	m_stream(0),
	m_node(node)
{
}



XSLTInputSource::XSLTInputSource(StreamType*	stream) :
	InputSource(),
	m_stream(stream),
	m_node(0)
{
}



XSLTInputSource::XSLTInputSource(StreamType&	stream) :
	InputSource(),
	m_stream(&stream),
	m_node(0)
{
}



BinInputStreamType*
XSLTInputSource::makeStream() const
{
	BinInputStreamType*		theResult = 0;

	if (m_stream != 0)
	{
		theResult = new StdBinInputStream(*m_stream);
	}
	else if (m_node == 0)
	{
		const XalanDOMChar* const	theSystemId = getSystemId();

		if (theSystemId != 0)
		{
			XERCES_CPP_NAMESPACE_QUALIFIER XMLURL	theURL;

			URISupport::getURLFromString(theSystemId, theURL);

			theResult = theURL.makeNewStream();
		}
	}

	return theResult;
}



XALAN_CPP_NAMESPACE_END
