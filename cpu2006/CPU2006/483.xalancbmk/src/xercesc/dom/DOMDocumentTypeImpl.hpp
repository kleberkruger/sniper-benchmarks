#ifndef DOMDocumentTypeImpl_HEADER_GUARD_
#define DOMDocumentTypeImpl_HEADER_GUARD_

/*
 * The Apache Software License, Version 1.1
 *
 * Copyright (c) 2001-2002 The Apache Software Foundation.  All rights
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
 * originally based on software copyright (c) 2001, International
 * Business Machines, Inc., http://www.ibm.com .  For more information
 * on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 */

/*
 * $Id: DOMDocumentTypeImpl.hpp,v 1.14 2004/01/29 11:44:26 cargilld Exp $
 */

//
//  This file is part of the internal implementation of the C++ XML DOM.
//  It should NOT be included or used directly by application programs.
//
//  Applications should include the file <xercesc/dom/DOM.hpp> for the entire
//  DOM API, or xercesc/dom/DOM*.hpp for individual DOM classes, where the class
//  name is substituded for the *.
//



#include <xercesc/util/XercesDefs.hpp>
#include <xercesc/dom/DOMDocumentType.hpp>
#include "DOMNodeImpl.hpp"
#include "DOMChildNode.hpp"
#include "DOMParentNode.hpp"

XERCES_CPP_NAMESPACE_BEGIN


class NamedNodeMapImpl;

class CDOM_EXPORT DOMDocumentTypeImpl: public DOMDocumentType {
private:
    DOMNodeImpl          fNode;
    DOMParentNode        fParent;
    DOMChildNode         fChild;



    const XMLCh *       fName;
    DOMNamedNodeMap*    fEntities;
    DOMNamedNodeMap*    fNotations;
    DOMNamedNodeMap*    fElements;
    const XMLCh *       fPublicId;
    const XMLCh *       fSystemId;
    const XMLCh *       fInternalSubset;

    bool			    fIntSubsetReading;
    bool                fIsCreatedFromHeap;

    virtual void        setPublicId(const XMLCh * value);
    virtual void        setSystemId(const XMLCh * value);
    virtual void        setInternalSubset(const XMLCh *value);
    bool                isIntSubsetReading() const;

    friend class AbstractDOMParser;

public:
    DOMDocumentTypeImpl(DOMDocument *, const XMLCh *, bool);
    DOMDocumentTypeImpl(DOMDocument *,
                     const XMLCh *qualifiedName,	//DOM Level 2
                     const XMLCh *publicId, const XMLCh *systemId, bool);
    DOMDocumentTypeImpl(const DOMDocumentTypeImpl &other, bool heap, bool deep=false);
    virtual ~DOMDocumentTypeImpl();

    // Declare all of the functions from DOMNode.
    DOMNODE_FUNCTIONS;

    virtual void setOwnerDocument(DOMDocument *doc);
    virtual DOMNamedNodeMap * getEntities() const;
    virtual const XMLCh *       getName() const;
    virtual DOMNamedNodeMap * getNotations() const;
    virtual DOMNamedNodeMap * getElements() const;
    virtual void                setReadOnly(bool readOnly, bool deep);

    //Introduced in DOM Level 2

    virtual const XMLCh *     getPublicId() const;
    virtual const XMLCh *     getSystemId() const;
    virtual const XMLCh *     getInternalSubset() const;

private:
    // -----------------------------------------------------------------------
    // Unimplemented constructors and operators
    // -----------------------------------------------------------------------    
    DOMDocumentTypeImpl & operator = (const DOMDocumentTypeImpl &);
};

XERCES_CPP_NAMESPACE_END

#endif
