/*
 * The Apache Software License, Version 1.1
 *
 * Copyright (c) 1999-2000 The Apache Software Foundation.  All rights
 * reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by the
 *        Apache Software Foundation (http://www.apache.org/)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Xerces" and "Apache Software Foundation" must
 *    not be used to endorse or promote products derived from this
 *    software without prior written permission. For written
 *    permission, please contact apache\@apache.org.
 *
 * 5. Products derived from this software may not be called "Apache",
 *    nor may "Apache" appear in their name, without prior written
 *    permission of the Apache Software Foundation.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL THE APACHE SOFTWARE FOUNDATION OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of the Apache Software Foundation, and was
 * originally based on software copyright (c) 1999, International
 * Business Machines, Inc., http://www.ibm.com .  For more information
 * on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 */

/**
 * $Log: URLInputSource.cpp,v $
 * Revision 1.4  2003/05/16 21:36:55  knoaman
 * Memory manager implementation: Modify constructors to pass in the memory manager.
 *
 * Revision 1.3  2002/11/04 15:00:21  tng
 * C++ Namespace Support.
 *
 * Revision 1.2  2002/04/25 00:12:34  jasons
 * fairly serious error in the two XMLCh* constructor, the fURL member
 * was being improperly initialized with the (systemID,publicID) instead
 * of (baseId,systemId)
 *
 * Revision 1.1.1.1  2002/02/01 22:21:50  peiyongz
 * sane_include
 *
 * Revision 1.3  2000/02/06 07:47:46  rahulj
 * Year 2K copyright swat.
 *
 * Revision 1.2  2000/01/15 01:26:16  rahulj
 * Added support for HTTP to the parser using libWWW 5.2.8.
 * Renamed URL.[ch]pp to XMLURL.[ch]pp and like wise for the class name.
 * Only tested under NT 4.0 SP 5.
 * Removed URL.hpp from files where it was not used.
 *
 * Revision 1.1  2000/01/12 00:13:26  roddey
 * These were moved from internal/ to framework/, which was something that should have
 * happened long ago. They are really framework type of classes.
 *
 * Revision 1.1.1.1  1999/11/09 01:08:18  twl
 * Initial checkin
 *
 * Revision 1.3  1999/11/08 20:44:44  rahul
 * Swat for adding in Product name and CVS comment log variable.
 *
 */


// ---------------------------------------------------------------------------
//  Includes
// ---------------------------------------------------------------------------
#include <xercesc/util/BinFileInputStream.hpp>
#include <xercesc/util/Janitor.hpp>
#include <xercesc/util/XMLURL.hpp>
#include <xercesc/util/XMLString.hpp>
#include <xercesc/framework/URLInputSource.hpp>

XERCES_CPP_NAMESPACE_BEGIN

// ---------------------------------------------------------------------------
//  URLInputSource: Constructors and Destructor
// ---------------------------------------------------------------------------
URLInputSource::URLInputSource( const XMLURL&         urlId
                              , MemoryManager* const  manager) :

    InputSource(manager)
    , fURL(urlId)
{
    setSystemId(fURL.getURLText());
}

URLInputSource::URLInputSource( const XMLCh* const    baseId
                              , const XMLCh* const    systemId
                              , MemoryManager* const  manager) :
    InputSource(manager)
    , fURL(baseId, systemId)
{
    // Create a URL that will build up the full URL and store as the system id
    setSystemId(fURL.getURLText());
}

URLInputSource::URLInputSource( const XMLCh* const    baseId
                              , const XMLCh* const    systemId
                              , const XMLCh* const    publicId
                              , MemoryManager* const  manager) :
    InputSource(0, publicId, manager)
    , fURL(baseId, systemId)
{
    setSystemId(fURL.getURLText());
}

URLInputSource::URLInputSource( const XMLCh* const    baseId
                              , const char* const     systemId
                              , MemoryManager* const  manager) :
    InputSource(manager)
    , fURL(baseId, systemId)
{
    setSystemId(fURL.getURLText());
}

URLInputSource::URLInputSource( const   XMLCh* const   baseId
                                , const char* const    systemId
                                , const char* const    publicId
                                , MemoryManager* const  manager) :
    InputSource(0, publicId, manager)
    , fURL(baseId, systemId)
{
    setSystemId(fURL.getURLText());
}

URLInputSource::~URLInputSource()
{
}


// ---------------------------------------------------------------------------
//  URLInputSource: Implementation of the input source interface
// ---------------------------------------------------------------------------
BinInputStream* URLInputSource::makeStream() const
{
    // Ask the URL to create us an appropriate input stream
    return fURL.makeNewStream();
}

XERCES_CPP_NAMESPACE_END

