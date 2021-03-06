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
 * $Log: MemBufInputSource.cpp,v $
 * Revision 1.5  2003/05/16 21:36:55  knoaman
 * Memory manager implementation: Modify constructors to pass in the memory manager.
 *
 * Revision 1.4  2003/05/16 03:11:30  knoaman
 * Partial implementation of the configurable memory manager.
 *
 * Revision 1.3  2003/05/15 18:26:07  knoaman
 * Partial implementation of the configurable memory manager.
 *
 * Revision 1.2  2002/11/04 15:00:21  tng
 * C++ Namespace Support.
 *
 * Revision 1.1.1.1  2002/02/01 22:21:50  peiyongz
 * sane_include
 *
 * Revision 1.2  2000/02/06 07:47:46  rahulj
 * Year 2K copyright swat.
 *
 * Revision 1.1  2000/01/12 00:13:26  roddey
 * These were moved from internal/ to framework/, which was something that should have
 * happened long ago. They are really framework type of classes.
 *
 * Revision 1.1.1.1  1999/11/09 01:08:10  twl
 * Initial checkin
 *
 * Revision 1.2  1999/11/08 20:44:42  rahul
 * Swat for adding in Product name and CVS comment log variable.
 *
 */


// ---------------------------------------------------------------------------
//  Includes
// ---------------------------------------------------------------------------
#include <xercesc/util/BinMemInputStream.hpp>
#include <xercesc/framework/MemBufInputSource.hpp>

XERCES_CPP_NAMESPACE_BEGIN

// ---------------------------------------------------------------------------
//  MemBufInputSource: Constructors and Destructor
// ---------------------------------------------------------------------------
MemBufInputSource::MemBufInputSource( const XMLByte* const  srcDocBytes
                                    , const unsigned int    byteCount
                                    , const XMLCh* const    bufId
                                    , const bool            adoptBuffer
                                    , MemoryManager* const  manager) :
    InputSource(bufId, manager)
    , fAdopted(adoptBuffer)
    , fByteCount(byteCount)
    , fCopyBufToStream(true)
    , fSrcBytes(srcDocBytes)
{
}

MemBufInputSource::MemBufInputSource( const XMLByte* const  srcDocBytes
                                    , const unsigned int    byteCount
                                    , const char* const     bufId
                                    , const bool            adoptBuffer
                                    , MemoryManager* const  manager) :
    InputSource(bufId, manager)
    , fAdopted(adoptBuffer)
    , fByteCount(byteCount)
    , fCopyBufToStream(true)
    , fSrcBytes(srcDocBytes)
{
}

MemBufInputSource::~MemBufInputSource()
{
    if (fAdopted)
        delete [] (XMLByte*)fSrcBytes;
}


// ---------------------------------------------------------------------------
//  MemBufInputSource: InputSource interface implementation
// ---------------------------------------------------------------------------
BinInputStream* MemBufInputSource::makeStream() const
{
    //
    //  Create a memory input stream over our buffer. According to our
    //  fCopyBufToStream flag, we either tell it to copy the buffer or to
    //  just reference it.
    //
    return new (getMemoryManager()) BinMemInputStream
    (
        fSrcBytes
        , fByteCount
        , fCopyBufToStream ? BinMemInputStream::BufOpt_Copy
                           : BinMemInputStream::BufOpt_Reference
        , getMemoryManager()
    );
}

XERCES_CPP_NAMESPACE_END

