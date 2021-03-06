//----------------------------  tria_iterator_base.h  ---------------------------
//    $Id: tria_iterator_base.h,v 1.1 2004/09/14 00:53:34 wolf Exp $
//    Version: $Name:  $
//
//    Copyright (C) 1998, 1999, 2000, 2001, 2002, 2003, 2004 by the deal.II authors
//
//    This file is subject to QPL and may not be  distributed
//    without copyright and license information. Please refer
//    to the file deal.II/doc/license.html for the  text  and
//    further information on this license.
//
//----------------------------  tria_iterator_base.h  ---------------------------
#ifndef __deal2__tria_iterator_base_h
#define __deal2__tria_iterator_base_h


#include <base/config.h>


/**
 * Namespace in which an enumeration is declared that denotes the
 * states in which an iterator can be in.
 */
namespace IteratorState
{
  
/**
 *   The three states an iterator can be in: valid, past-the-end and
 *   invalid.
 */
  enum IteratorStates
  {
					 /// Iterator points to a valid object
	valid,
					 /// Iterator reached end of container
	past_the_end,
					 /// Iterator is invalid, probably due to an error
	invalid
  };
}



#endif
