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
#if !defined(XALANTOXERCESTRANSCODERWRAPPER_HEADER_GUARD_1357924680)
#define XALANTOXERCESTRANSCODERWRAPPER_HEADER_GUARD_1357924680



// Base include file.  Must be first.
#include <PlatformSupportDefinitions.hpp>



// Base class header file...
#include <XalanTranscodingServices.hpp>



XALAN_DECLARE_XERCES_CLASS(XMLTranscoder)



XALAN_CPP_NAMESPACE_BEGIN



class XALAN_PLATFORMSUPPORT_EXPORT XalanToXercesTranscoderWrapper : public XalanOutputTranscoder
{
public:

	typedef XERCES_CPP_NAMESPACE_QUALIFIER XMLTranscoder	XMLTranscoderType;

	explicit
	XalanToXercesTranscoderWrapper(XMLTranscoderType&	theTranscoder);
   
	virtual
	~XalanToXercesTranscoderWrapper();

	virtual eCode
	transcode(
			const XalanDOMChar*		theSourceData,
			size_type				theSourceCount,
			XalanXMLByte*			theTarget,
			size_type				theTargetSize,
			size_type&				theSourceCharsTranscoded,
			size_type&				theTargetBytesUsed);

	virtual eCode
	transcode(
			const XalanXMLByte*		theSourceData,
			size_type				theSourceCount,
			XalanDOMChar*			theTarget,
			size_type				theTargetSize,
			size_type&				theSourceCharsTranscoded,
			size_type&				theTargetBytesUsed,
			unsigned char*			theCharSizes);

	virtual bool
	canTranscodeTo(UnicodeCharType	theChar) const;

private:

	// Not implemented...
	XalanToXercesTranscoderWrapper(const XalanToXercesTranscoderWrapper&);

	XalanToXercesTranscoderWrapper&
	operator=(const XalanToXercesTranscoderWrapper&);


	// Data members...
	XMLTranscoderType* const	m_transcoder;
};



XALAN_CPP_NAMESPACE_END



#endif	// XALANTOXERCESTRANSCODERWRAPPER_HEADER_GUARD_1357924680
