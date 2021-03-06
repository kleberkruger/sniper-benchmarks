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
#if !defined(XALAN_ELEMELEMENT_HEADER_GUARD)
#define XALAN_ELEMELEMENT_HEADER_GUARD 

/**
 * $Id: ElemElement.hpp,v 1.5 2004/02/26 22:58:57 mhoyt Exp $
 * 
 * 
 * $State: Exp $
 * 
 * @author Myriam Midy (Myriam_Midy @lotus.com 
 */

// Base include file.  Must be first.
#include "XSLTDefinitions.hpp"



// Base class header file.
#include "ElemUse.hpp"



XALAN_CPP_NAMESPACE_BEGIN



class AVT;



class ElemElement: public ElemUse
{
public:

	/**
	 * Construct an object corresponding to an "xsl:element" element
	 * 
	 * @param constructionContext context for construction of object
	 * @param stylesheetTree      stylesheet containing element
	 * @param atts                list of attributes for element
	 * @param lineNumber				line number in document
	 * @param columnNumber			column number in document
	 */
	ElemElement(
			StylesheetConstructionContext&	constructionContext,
			Stylesheet&						stylesheetTree,
			const AttributeListType&		atts,
			int								lineNumber,
			int								columnNumber);

	virtual
	~ElemElement();

	// These methods are inherited from ElemUse ...

	virtual const XalanDOMString&
	getElementName() const;

	virtual void 
	execute(StylesheetExecutionContext&		executionContext) const;

protected:

	/** 
	 * Process the children of a template.
	 * 
	 * @param executionContext The current execution context
	 * @param skipAttributeChildren If true, attribute children will not be executed.
	 */
	virtual void
	doExecuteChildren(
			StylesheetExecutionContext&		executionContext,
			bool							skipAttributeChildren) const;

	virtual void
	namespacesPostConstruction(
			StylesheetConstructionContext&	constructionContext,
			const NamespacesHandler&		theParentHandler,
			NamespacesHandler&				theHandler);

private:

	/** 
	 * Do any necessary fixup for the default namespace
	 * 
	 * @param executionContext The current execution context
	 */
	void
	fixupDefaultNamespace(StylesheetExecutionContext&	executionContext) const;

	/** 
	 * Get the default namespace from the parent of this element.  Returns
	 * an empty string if there's no default namespace.
	 *
	 * @return The default namespace of the parent, if any.
	 */
	const XalanDOMString&
	getParentDefaultNamespace() const;


	// not implemented
	ElemElement(const ElemElement &);

	ElemElement&
	operator=(const ElemElement &);

	// Data members...
	const AVT*				m_nameAVT;

	const AVT*				m_namespaceAVT;
};



XALAN_CPP_NAMESPACE_END



#endif	// XALAN_ELEMELEMENT_HEADER_GUARD
