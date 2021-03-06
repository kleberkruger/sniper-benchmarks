/*
 * The Apache Software License, Version 1.1
 *
 * Copyright (c) 1999-2003 The Apache Software Foundation.  All rights
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
 * $Log: XMLBuffer.cpp,v $
 * Revision 1.4  2003/05/15 18:26:07  knoaman
 * Partial implementation of the configurable memory manager.
 *
 * Revision 1.3  2002/11/04 15:00:21  tng
 * C++ Namespace Support.
 *
 * Revision 1.2  2002/08/13 17:07:43  peiyongz
 * using 2 instead of 1.25 to expand capacity
 *
 * Revision 1.1.1.1  2002/02/01 22:21:50  peiyongz
 * sane_include
 *
 * Revision 1.5  2000/08/17 00:04:50  andyh
 * Fix error in growing of XMLBuffer from within ensureCapacity()
 * Fixes crash pointed out by Simon Fell.
 *
 * Revision 1.4  2000/05/15 22:31:11  andyh
 * Replace #include<memory.h> with <string.h> everywhere.
 *
 * Revision 1.3  2000/02/06 07:47:47  rahulj
 * Year 2K copyright swat.
 *
 * Revision 1.2  1999/11/23 01:04:19  roddey
 * Updates to some of the internal VC++ project files and some small
 * fixes to make XMLBuffer correctly character size agnostic.
 *
 * Revision 1.1.1.1  1999/11/09 01:08:29  twl
 * Initial checkin
 *
 * Revision 1.2  1999/11/08 20:44:35  rahul
 * Swat for adding in Product name and CVS comment log variable.
 *
 */


// ---------------------------------------------------------------------------
//  Includes
// ---------------------------------------------------------------------------
#include <xercesc/framework/XMLBuffer.hpp>
#include <xercesc/util/XMLString.hpp>

XERCES_CPP_NAMESPACE_BEGIN

// ---------------------------------------------------------------------------
//  XMLBuffer: Buffer management
// ---------------------------------------------------------------------------
void XMLBuffer::append(const XMLCh* const chars, const unsigned int count)
{
    unsigned int actualCount = count;
    if (!count)
        actualCount = XMLString::stringLen(chars);
    insureCapacity(actualCount);
    memcpy(&fBuffer[fIndex], chars, actualCount * sizeof(XMLCh));
    fIndex += actualCount;
}

void XMLBuffer::set(const XMLCh* const chars, const unsigned int count)
{
    unsigned int actualCount = count;
    if (!count)
        actualCount = XMLString::stringLen(chars);
    fIndex = 0;
    insureCapacity(actualCount);
    memcpy(fBuffer, chars, actualCount * sizeof(XMLCh));
    fIndex = actualCount;
}


// ---------------------------------------------------------------------------
//  XMLBuffer: Private helper methods
// ---------------------------------------------------------------------------
void XMLBuffer::expand()
{
    unsigned int newCap = (unsigned int)(fCapacity * 1.5);

    // Allocate the new buffer
    XMLCh* newBuf = (XMLCh*) fMemoryManager->allocate((newCap + 1) * sizeof(XMLCh)); //new XMLCh[newCap + 1];

    // Copy over the old stuff
    memcpy(newBuf, fBuffer, fCapacity * sizeof(XMLCh));

    // Clean up old buffer and store new stuff
    fMemoryManager->deallocate(fBuffer); //delete [] fBuffer;
    fBuffer = newBuf;
    fCapacity = newCap;
}

void XMLBuffer::insureCapacity(const unsigned int extraNeeded)
{
    // If we can handle it, do nothing yet
    if (fIndex + extraNeeded < fCapacity)
        return;

    // Oops, not enough room. Calc new capacity and allocate new buffer
    const unsigned int newCap = (unsigned int)((fIndex + extraNeeded) * 2);
    XMLCh* newBuf = (XMLCh*) fMemoryManager->allocate((newCap+1) * sizeof(XMLCh)); //new XMLCh[newCap+1];

    // Copy over the old stuff
    memcpy(newBuf, fBuffer, fCapacity * sizeof(XMLCh));

    // Clean up old buffer and store new stuff
    fMemoryManager->deallocate(fBuffer); //delete [] fBuffer;
    fBuffer = newBuf;
    fCapacity = newCap;
}

XERCES_CPP_NAMESPACE_END

