/* ====================================================================
 * Copyright (c) 1999-2001 Carnegie Mellon University.  All rights
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
 * This work was supported in part by funding from the Defense Advanced 
 * Research Projects Agency and the National Science Foundation of the 
 * United States of America, and the CMU Sphinx Speech Consortium.
 *
 * THIS SOFTWARE IS PROVIDED BY CARNEGIE MELLON UNIVERSITY ``AS IS'' AND 
 * ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY
 * NOR ITS EMPLOYEES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * ====================================================================
 *
 */
/*
 * libutil.h -- Collection of all other .h files in this directory; for brevity
 *
 * **********************************************
 * CMU ARPA Speech Project
 *
 * Copyright (c) 1996 Carnegie Mellon University.
 * ALL RIGHTS RESERVED.
 * **********************************************
 * 
 * HISTORY
 * 
 * 08-Dec-1999	M K Ravishankar (rkm@cs.cmu.edu) at Carnegie Mellon
 * 		Added SLEEP_SEC macro.
 * 
 * 08-31-95	M K Ravishankar (rkm@cs.cmu.edu) at Carnegie Mellon
 * 		Created.
 */


#ifndef _LIBUTIL_LIBUTIL_H_
#define _LIBUTIL_LIBUTIL_H_


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#ifndef SPEC_CPU_WINDOWS			/* RAH */
#include <unistd.h>
#endif /* RAH */
#include <math.h>

#include "prim_type.h"

#include "bitvec.h"
#include "case.h"
#include "ckd_alloc.h"
#include "cmd_ln.h"
#include "err.h"
#include "filename.h"
#include "glist.h"
#include "hash.h"
#include "heap.h"
#include "io.h"
#include "profile.h"
#include "str2words.h"
#include "unlimit.h"


#if (defined(SPEC_CPU_WINDOWS) && !defined(__CYGWIN__))
#define SLEEP_SEC(sec)	(0)			/* Why doesn't Sleep((sec)*1000) work? */
#else
#define SLEEP_SEC(sec)	sleep(sec)		/* sec must be integer */
#endif

#ifndef TRUE
#define TRUE	1
#define FALSE	0
#endif

#ifndef M_PI
#define M_PI		3.1415926535897932385	/* For the pain-in-the-neck Win32 */
#endif
#define PI		M_PI


#endif
