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

/*
 * $Id: XMLUni.cpp,v 1.38 2003/11/25 03:46:26 neilg Exp $
 */


// ---------------------------------------------------------------------------
//  Includes
// ---------------------------------------------------------------------------
#include <xercesc/util/XMLUniDefs.hpp>
#include <xercesc/util/XMLUni.hpp>

XERCES_CPP_NAMESPACE_BEGIN

// ---------------------------------------------------------------------------
//  XMLUni: Static data
// ---------------------------------------------------------------------------
const XMLCh XMLUni::fgAnyString[] =
{
    chLatin_A, chLatin_N, chLatin_Y, chNull
};

const XMLCh XMLUni::fgAttListString[] =
{
    chLatin_A, chLatin_T, chLatin_T, chLatin_L, chLatin_I, chLatin_S, chLatin_T, chNull
};

const XMLCh XMLUni::fgCommentString[] =
{
    chOpenAngle, chBang, chDash, chDash, chNull
};

const XMLCh XMLUni::fgCDATAString[] =
{
    chLatin_C, chLatin_D, chLatin_A, chLatin_T, chLatin_A, chNull
};

const XMLCh XMLUni::fgDefaultString[] =
{
    chPound, chLatin_D, chLatin_E, chLatin_F, chLatin_A, chLatin_U, chLatin_L, chLatin_T, chNull
};

const XMLCh XMLUni::fgDocTypeString[] =
{
    chOpenAngle, chBang, chLatin_D, chLatin_O, chLatin_C, chLatin_T, chLatin_Y, chLatin_P, chLatin_E, chNull
};

const XMLCh XMLUni::fgEBCDICEncodingString[] =
{
    // Just plain 'EBCDIC'
    chLatin_E, chLatin_B, chLatin_C, chLatin_D, chLatin_I, chLatin_C, chNull
};

const XMLCh XMLUni::fgElemString[] =
{
    chLatin_E, chLatin_L, chLatin_E, chLatin_M, chLatin_E, chLatin_N, chLatin_T, chNull
};

const XMLCh XMLUni::fgEmptyString[] =
{
    chLatin_E, chLatin_M, chLatin_P, chLatin_T, chLatin_Y, chNull
};

const XMLCh XMLUni::fgEncodingString[] =
{
    chLatin_e, chLatin_n, chLatin_c, chLatin_o, chLatin_d, chLatin_i, chLatin_n, chLatin_g, chNull
};

const XMLCh XMLUni::fgEntitString[] =
{
    chLatin_E, chLatin_N, chLatin_T, chLatin_I, chLatin_T, chNull
};

const XMLCh XMLUni::fgEntityString[] =
{
    chLatin_E, chLatin_N, chLatin_T, chLatin_I, chLatin_T, chLatin_Y, chNull
};

const XMLCh XMLUni::fgEntitiesString[] =
{
    chLatin_E, chLatin_N, chLatin_T, chLatin_I, chLatin_T, chLatin_I, chLatin_E, chLatin_S, chNull
};

const XMLCh XMLUni::fgEnumerationString[] =
{
    chLatin_E, chLatin_N, chLatin_U, chLatin_M, chLatin_E, chLatin_R, chLatin_A, chLatin_T, chLatin_I, chLatin_O, chLatin_N, chNull
};

const XMLCh XMLUni::fgExceptDomain[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c
    ,   chLatin_h, chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g
    ,   chForwardSlash, chLatin_x, chLatin_m, chLatin_l, chForwardSlash
    ,   chLatin_m, chLatin_e, chLatin_s, chLatin_s, chLatin_a, chLatin_g
    ,   chLatin_e, chLatin_s, chForwardSlash, chLatin_X, chLatin_M, chLatin_L
    ,   chDigit_4, chLatin_C, chLatin_E, chLatin_r, chLatin_r, chLatin_o
    ,   chLatin_r, chLatin_s, chNull
};

const XMLCh XMLUni::fgFixedString[] =
{
    chPound, chLatin_F, chLatin_I, chLatin_X, chLatin_E, chLatin_D, chNull
};

const XMLCh XMLUni::fgIBM037EncodingString[] =
{
    chLatin_E, chLatin_B, chLatin_C, chLatin_D, chLatin_I, chLatin_C, chDash, chLatin_C, chLatin_P, chDash, chLatin_U, chLatin_S, chNull
};

const XMLCh XMLUni::fgIBM037EncodingString2[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDigit_0, chDigit_3, chDigit_7, chNull
};

//hhe
const XMLCh XMLUni::fgIBM1047EncodingString[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDigit_1, chDigit_0, chDigit_4, chDigit_7, chNull
};

const XMLCh XMLUni::fgIBM1047EncodingString2[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDash, chDigit_1, chDigit_0, chDigit_4, chDigit_7, chNull
};

const XMLCh XMLUni::fgIBM1140EncodingString[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDigit_1, chDigit_1, chDigit_4, chDigit_0, chNull
};

const XMLCh XMLUni::fgIBM1140EncodingString2[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDigit_0, chDigit_1, chDigit_1, chDigit_4, chDigit_0, chNull
};

const XMLCh XMLUni::fgIBM1140EncodingString3[] =
{
    chLatin_C, chLatin_C, chLatin_S, chLatin_I, chLatin_D, chDigit_0, chDigit_1, chDigit_1, chDigit_4, chDigit_0, chNull
};

const XMLCh XMLUni::fgIBM1140EncodingString4[] =
{
    chLatin_C, chLatin_P, chDigit_0, chDigit_1, chDigit_1, chDigit_4, chDigit_0, chNull
};

const XMLCh XMLUni::fgIESString[] =
{
    chLatin_I, chLatin_E, chLatin_S, chNull
};

const XMLCh XMLUni::fgIDString[] =
{
    chLatin_I, chLatin_D, chNull
};

const XMLCh XMLUni::fgIDRefString[] =
{
    chLatin_I, chLatin_D, chLatin_R, chLatin_E, chLatin_F, chNull
};

const XMLCh XMLUni::fgIDRefsString[] =
{
    chLatin_I, chLatin_D, chLatin_R, chLatin_E, chLatin_F, chLatin_S, chNull
};

const XMLCh XMLUni::fgImpliedString[] =
{
    chPound, chLatin_I, chLatin_M, chLatin_P, chLatin_L, chLatin_I, chLatin_E, chLatin_D, chNull
};

const XMLCh XMLUni::fgIgnoreString[] =
{
    chLatin_I, chLatin_G, chLatin_N, chLatin_O, chLatin_R, chLatin_E, chNull
};

const XMLCh XMLUni::fgIncludeString[] =
{
    chLatin_I, chLatin_N, chLatin_C, chLatin_L, chLatin_U, chLatin_D, chLatin_E, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString[] =
{
    chLatin_I, chLatin_S, chLatin_O, chDigit_8, chDigit_8, chDigit_5, chDigit_9, chDash, chDigit_1, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString2[] =
{
    chLatin_I, chLatin_S, chLatin_O, chDash, chDigit_8, chDigit_8, chDigit_5, chDigit_9, chDash, chDigit_1, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString3[] =
{
    chLatin_I, chLatin_S, chLatin_O, chUnderscore, chDigit_8, chDigit_8, chDigit_5, chDigit_9, chDash, chDigit_1, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString4[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDash, chDigit_8, chDigit_1, chDigit_9, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString5[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDigit_8, chDigit_1, chDigit_9, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString6[] =
{
    chLatin_L, chLatin_A, chLatin_T, chLatin_I, chLatin_N, chDigit_1, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString7[] =
{
    chLatin_L, chLatin_A, chLatin_T, chLatin_I, chLatin_N, chDash, chDigit_1, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString8[] =
{
    chLatin_L, chLatin_A, chLatin_T, chLatin_I, chLatin_N, chUnderscore, chDigit_1, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString9[] =
{
    chLatin_C, chLatin_P, chDigit_8, chDigit_1, chDigit_9, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString10[] =
{
    chLatin_C, chLatin_S, chLatin_I, chLatin_S, chLatin_O, chLatin_L, chLatin_A, chLatin_T, chLatin_I, chLatin_N, chDigit_1, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString11[] =
{
    chLatin_I, chLatin_S, chLatin_O, chDash, chLatin_I, chLatin_R, chDash, chDigit_1, chDigit_0, chDigit_0, chNull
};

const XMLCh XMLUni::fgISO88591EncodingString12[] =
{
    chLatin_L, chDigit_1, chNull
};

const XMLCh XMLUni::fgLocalHostString[] =
{
    chLatin_l, chLatin_o, chLatin_c, chLatin_a, chLatin_l, chLatin_h, chLatin_o, chLatin_s, chLatin_t, chNull
};

const XMLCh XMLUni::fgNoString[] =
{
    chLatin_n, chLatin_o, chNull
};

const XMLCh XMLUni::fgNotationString[] =
{
    chLatin_N, chLatin_O, chLatin_T, chLatin_A, chLatin_T, chLatin_I, chLatin_O, chLatin_N, chNull
};

const XMLCh XMLUni::fgNDATAString[] =
{
    chLatin_N, chLatin_D, chLatin_A, chLatin_T, chLatin_A, chNull
};

const XMLCh XMLUni::fgNmTokenString[] =
{
    chLatin_N, chLatin_M, chLatin_T, chLatin_O, chLatin_K, chLatin_E, chLatin_N, chNull
};

const XMLCh XMLUni::fgNmTokensString[] =
{
    chLatin_N, chLatin_M, chLatin_T, chLatin_O, chLatin_K, chLatin_E, chLatin_N, chLatin_S, chNull
};

const XMLCh XMLUni::fgPCDATAString[] =
{
    chPound, chLatin_P, chLatin_C, chLatin_D, chLatin_A, chLatin_T, chLatin_A, chNull
};

const XMLCh XMLUni::fgPIString[] =
{
    chOpenAngle, chQuestion, chNull
};

const XMLCh XMLUni::fgPubIDString[] =
{
    chLatin_P, chLatin_U, chLatin_B, chLatin_L, chLatin_I, chLatin_C, chNull
};

const XMLCh XMLUni::fgRefString[] =
{
    chLatin_R, chLatin_E, chLatin_F, chNull
};

const XMLCh XMLUni::fgRequiredString[] =
{
    chPound, chLatin_R, chLatin_E, chLatin_Q, chLatin_U, chLatin_I, chLatin_R, chLatin_E, chLatin_D, chNull
};

const XMLCh XMLUni::fgStandaloneString[] =
{
    chLatin_s, chLatin_t, chLatin_a, chLatin_n, chLatin_d, chLatin_a, chLatin_l, chLatin_o, chLatin_n, chLatin_e, chNull
};

const XMLCh XMLUni::fgVersion1_0[] =
{
    chDigit_1, chPeriod, chDigit_0, chNull
};

const XMLCh XMLUni::fgVersion1_1[] =
{
    chDigit_1, chPeriod, chDigit_1, chNull
};

const XMLCh XMLUni::fgSysIDString[] =
{
    chLatin_S, chLatin_Y, chLatin_S, chLatin_T, chLatin_E, chLatin_M, chNull
};

const XMLCh XMLUni::fgUnknownURIName[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c
    ,   chLatin_h, chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g
    ,   chForwardSlash, chLatin_x, chLatin_m, chLatin_l, chForwardSlash
    ,   chLatin_U, chLatin_k, chLatin_n, chLatin_o, chLatin_w, chLatin_n
    ,   chLatin_N, chLatin_S, chNull
};

const XMLCh XMLUni::fgUCS4EncodingString[] =
{
    chLatin_U, chLatin_C, chLatin_S, chDigit_4, chNull
};

const XMLCh XMLUni::fgUCS4EncodingString2[] =
{
    chLatin_U, chLatin_C, chLatin_S, chDash, chDigit_4, chNull
};

const XMLCh XMLUni::fgUCS4EncodingString3[] =
{
    chLatin_U, chLatin_C, chLatin_S, chUnderscore, chDigit_4, chNull
};

const XMLCh XMLUni::fgUCS4BEncodingString[] =
{
    chLatin_U, chLatin_C, chLatin_S, chDash, chDigit_4, chSpace, chOpenParen, chLatin_B, chLatin_E, chCloseParen, chNull
};

const XMLCh XMLUni::fgUCS4BEncodingString2[] =
{
    chLatin_U, chLatin_C, chLatin_S, chDash, chDigit_4, chLatin_B, chLatin_E, chNull
};

const XMLCh XMLUni::fgUCS4LEncodingString[] =
{
    chLatin_U, chLatin_C, chLatin_S, chDash, chDigit_4, chSpace, chOpenParen, chLatin_L, chLatin_E, chCloseParen, chNull
};

const XMLCh XMLUni::fgUCS4LEncodingString2[] =
{
    chLatin_U, chLatin_C, chLatin_S, chDash, chDigit_4, chLatin_L, chLatin_E, chNull
};

const XMLCh XMLUni::fgUSASCIIEncodingString[] =
{
    chLatin_U, chLatin_S, chDash, chLatin_A, chLatin_S, chLatin_C, chLatin_I, chLatin_I, chNull
};

const XMLCh XMLUni::fgUSASCIIEncodingString2[] =
{
    chLatin_U, chLatin_S, chLatin_A, chLatin_S, chLatin_C, chLatin_I, chLatin_I, chNull
};

const XMLCh XMLUni::fgUSASCIIEncodingString3[] =
{
    chLatin_A, chLatin_S, chLatin_C, chLatin_I, chLatin_I, chNull
};

const XMLCh XMLUni::fgUSASCIIEncodingString4[] =
{
    chLatin_U, chLatin_S, chUnderscore, chLatin_A, chLatin_S, chLatin_C, chLatin_I, chLatin_I, chNull
};

const XMLCh XMLUni::fgUTF8EncodingString[] =
{
    chLatin_U, chLatin_T, chLatin_F, chDash, chDigit_8, chNull
};

const XMLCh XMLUni::fgUTF8EncodingString2[] =
{
    chLatin_U, chLatin_T, chLatin_F, chDigit_8, chNull
};

const XMLCh XMLUni::fgUTF16EncodingString[] =
{
    chLatin_U, chLatin_T, chLatin_F, chDash, chDigit_1, chDigit_6, chNull
};

const XMLCh XMLUni::fgUTF16EncodingString2[] =
{
    chLatin_U, chLatin_C, chLatin_S, chDigit_2, chNull
};

const XMLCh XMLUni::fgUTF16EncodingString3[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDigit_1, chDigit_2, chDigit_0, chDigit_0, chNull
};

const XMLCh XMLUni::fgUTF16EncodingString4[] =
{
    chLatin_I, chLatin_B, chLatin_M, chDash, chDigit_1, chDigit_2, chDigit_0, chDigit_0, chNull
};

const XMLCh XMLUni::fgUTF16EncodingString5[] =
{
    chLatin_U, chLatin_T, chLatin_F, chDigit_1, chDigit_6, chNull
};

const XMLCh XMLUni::fgUTF16BEncodingString[] =
{
    chLatin_U, chLatin_T, chLatin_F, chDash, chDigit_1, chDigit_6, chSpace, chOpenParen, chLatin_B, chLatin_E, chCloseParen, chNull
};

const XMLCh XMLUni::fgUTF16BEncodingString2[] =
{
    chLatin_U, chLatin_T, chLatin_F, chDash, chDigit_1, chDigit_6, chLatin_B, chLatin_E, chNull
};

const XMLCh XMLUni::fgUTF16LEncodingString[] =
{
    chLatin_U, chLatin_T, chLatin_F, chDash, chDigit_1, chDigit_6, chSpace, chOpenParen, chLatin_L, chLatin_E, chCloseParen, chNull
};

const XMLCh XMLUni::fgUTF16LEncodingString2[] =
{
    chLatin_U, chLatin_T, chLatin_F, chDash, chDigit_1, chDigit_6, chLatin_L, chLatin_E, chNull
};

const XMLCh XMLUni::fgVersionString[] =
{
    chLatin_v, chLatin_e, chLatin_r, chLatin_s, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgValidityDomain[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_m, chLatin_e
    ,   chLatin_s, chLatin_s, chLatin_a, chLatin_g, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_X, chLatin_M, chLatin_L, chLatin_V, chLatin_a
    ,   chLatin_l, chLatin_i, chLatin_d, chLatin_i, chLatin_t, chLatin_y, chNull
};

const XMLCh XMLUni::fgWin1252EncodingString[] =
{
        chLatin_W, chLatin_I, chLatin_N, chLatin_D, chLatin_O, chLatin_W
    ,   chLatin_S, chDash, chDigit_1, chDigit_2, chDigit_5, chDigit_2, chNull
};

const XMLCh XMLUni::fgXMLChEncodingString[] =
{
        chLatin_X, chLatin_E, chLatin_R, chLatin_C, chLatin_E, chLatin_S
    ,   chDash, chLatin_X, chLatin_M, chLatin_L, chLatin_C, chLatin_H, chNull
};

const XMLCh XMLUni::fgXMLString[] =
{
    chLatin_x, chLatin_m, chLatin_l, chNull
};

//xml{S}
const XMLCh XMLUni::fgXMLStringSpace[] =
{
    chLatin_x, chLatin_m, chLatin_l, chSpace, chNull
};

const XMLCh XMLUni::fgXMLStringHTab[] =
{
    chLatin_x, chLatin_m, chLatin_l, chHTab, chNull
};

const XMLCh XMLUni::fgXMLStringCR[] =
{
    chLatin_x, chLatin_m, chLatin_l, chCR, chNull
};

const XMLCh XMLUni::fgXMLStringLF[] =
{
    chLatin_x, chLatin_m, chLatin_l, chLF, chNull
};

//XML{S}
const XMLCh XMLUni::fgXMLStringSpaceU[] =
{
    chLatin_X, chLatin_M, chLatin_L, chSpace, chNull
};

const XMLCh XMLUni::fgXMLStringHTabU[] =
{
    chLatin_X, chLatin_M, chLatin_L, chHTab, chNull
};

const XMLCh XMLUni::fgXMLStringCRU[] =
{
    chLatin_X, chLatin_M, chLatin_L, chCR, chNull
};

const XMLCh XMLUni::fgXMLStringLFU[] =
{
    chLatin_X, chLatin_M, chLatin_L, chLF, chNull
};

//<?xml{S}
const XMLCh XMLUni::fgXMLDeclString[] =
{
    chOpenAngle, chQuestion, chLatin_x, chLatin_m, chLatin_l, chNull
};

const XMLCh XMLUni::fgXMLDeclStringSpace[] =
{
    chOpenAngle, chQuestion, chLatin_x, chLatin_m, chLatin_l, chSpace, chNull
};

const XMLCh XMLUni::fgXMLDeclStringHTab[] =
{
    chOpenAngle, chQuestion, chLatin_x, chLatin_m, chLatin_l, chHTab, chNull
};

const XMLCh XMLUni::fgXMLDeclStringLF[] =
{
    chOpenAngle, chQuestion, chLatin_x, chLatin_m, chLatin_l, chLF, chNull
};

const XMLCh XMLUni::fgXMLDeclStringCR[] =
{
    chOpenAngle, chQuestion, chLatin_x, chLatin_m, chLatin_l, chCR, chNull
};

//<?XML{S}
const XMLCh XMLUni::fgXMLDeclStringSpaceU[] =
{
    chOpenAngle, chQuestion, chLatin_X, chLatin_M, chLatin_L, chSpace, chNull
};

const XMLCh XMLUni::fgXMLDeclStringHTabU[] =
{
    chOpenAngle, chQuestion, chLatin_X, chLatin_M, chLatin_L, chHTab, chNull
};

const XMLCh XMLUni::fgXMLDeclStringLFU[] =
{
    chOpenAngle, chQuestion, chLatin_X, chLatin_M, chLatin_L, chLF, chNull
};

const XMLCh XMLUni::fgXMLDeclStringCRU[] =
{
    chOpenAngle, chQuestion, chLatin_X, chLatin_M, chLatin_L, chCR, chNull
};

const XMLCh XMLUni::fgXMLNSString[] =
{
    chLatin_x, chLatin_m, chLatin_l, chLatin_n, chLatin_s, chNull
};

const XMLCh XMLUni::fgXMLNSColonString[] =
{
    chLatin_x, chLatin_m, chLatin_l, chLatin_n, chLatin_s, chColon, chNull
};

const XMLCh XMLUni::fgXMLNSURIName[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_w, chLatin_w, chLatin_w, chPeriod, chLatin_w
    ,   chDigit_3, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chDigit_2, chDigit_0, chDigit_0, chDigit_0, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chLatin_n, chLatin_s, chForwardSlash
    ,   chNull
};

const XMLCh XMLUni::fgXMLErrDomain[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_m, chLatin_e
    ,   chLatin_s, chLatin_s, chLatin_a, chLatin_g, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_X, chLatin_M, chLatin_L, chLatin_E, chLatin_r
    ,   chLatin_r, chLatin_o, chLatin_r, chLatin_s, chNull
};

const XMLCh XMLUni::fgXMLURIName[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_w, chLatin_w, chLatin_w, chPeriod, chLatin_w
    ,   chDigit_3, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_X, chLatin_M, chLatin_L, chForwardSlash, chDigit_1, chDigit_9
    ,   chDigit_9, chDigit_8, chForwardSlash, chLatin_n, chLatin_a, chLatin_m
    ,   chLatin_e, chLatin_s, chLatin_p, chLatin_a, chLatin_c, chLatin_e, chNull
};

const XMLCh XMLUni::fgYesString[] =
{
        chLatin_y, chLatin_e, chLatin_s, chNull
};

const XMLCh XMLUni::fgZeroLenString[] = { chNull };

const XMLCh XMLUni::fgDTDEntityString[] =
{
        chOpenSquare, chLatin_d, chLatin_t, chLatin_d, chCloseSquare, chNull
};

const XMLCh XMLUni::fgAmp[] =
{
        chLatin_a, chLatin_m, chLatin_p, chNull
};

const XMLCh XMLUni::fgLT[] =
{
        chLatin_l, chLatin_t, chNull
};

const XMLCh XMLUni::fgGT[] =
{
        chLatin_g, chLatin_t, chNull
};

const XMLCh XMLUni::fgQuot[] =
{
        chLatin_q, chLatin_u, chLatin_o, chLatin_t, chNull
};

const XMLCh XMLUni::fgApos[] =
{
        chLatin_a, chLatin_p, chLatin_o, chLatin_s, chNull
};

const XMLCh XMLUni::fgWFXMLScanner[] =
{
        chLatin_W, chLatin_F, chLatin_X, chLatin_M, chLatin_L, chLatin_S
    ,   chLatin_c, chLatin_a, chLatin_n, chLatin_n, chLatin_e, chLatin_r, chNull
};

const XMLCh XMLUni::fgIGXMLScanner[] =
{
        chLatin_I, chLatin_G, chLatin_X, chLatin_M, chLatin_L, chLatin_S
    ,   chLatin_c, chLatin_a, chLatin_n, chLatin_n, chLatin_e, chLatin_r, chNull
};

const XMLCh XMLUni::fgSGXMLScanner[] =
{
        chLatin_S, chLatin_G, chLatin_X, chLatin_M, chLatin_L, chLatin_S
    ,   chLatin_c, chLatin_a, chLatin_n, chLatin_n, chLatin_e, chLatin_r, chNull
};

const XMLCh XMLUni::fgDGXMLScanner[] =
{
        chLatin_D, chLatin_G, chLatin_X, chLatin_M, chLatin_L, chLatin_S
    ,   chLatin_c, chLatin_a, chLatin_n, chLatin_n, chLatin_e, chLatin_r, chNull
};

const XMLCh XMLUni::fgCDataStart[] =
{
        chOpenAngle, chBang, chOpenSquare, chLatin_C, chLatin_D
    ,   chLatin_A, chLatin_T, chLatin_A, chOpenSquare, chNull
};

const XMLCh XMLUni::fgCDataEnd[] =
{
         chCloseSquare, chCloseSquare, chCloseAngle, chNull
};

//Exception strings
const XMLCh XMLUni::fgArrayIndexOutOfBoundsException_Name[] =
{
        chLatin_A, chLatin_r, chLatin_r, chLatin_a, chLatin_y, chLatin_I
    ,   chLatin_n, chLatin_d, chLatin_e, chLatin_x, chLatin_O, chLatin_u
    ,   chLatin_t, chLatin_o, chLatin_f, chLatin_B, chLatin_o, chLatin_u
    ,   chLatin_n, chLatin_d, chLatin_s, chLatin_E, chLatin_x, chLatin_c
    ,   chLatin_e, chLatin_p, chLatin_t, chLatin_i, chLatin_o, chLatin_n
    ,   chNull
};

const XMLCh XMLUni::fgEmptyStackException_Name[] =
{
        chLatin_E, chLatin_m, chLatin_p, chLatin_t, chLatin_y, chLatin_S
    ,   chLatin_t, chLatin_a, chLatin_c, chLatin_k, chLatin_E, chLatin_x
    ,   chLatin_c, chLatin_e, chLatin_p, chLatin_t, chLatin_i, chLatin_o
    ,   chLatin_n, chNull
};

const XMLCh XMLUni::fgIllegalArgumentException_Name[] =
{
        chLatin_I, chLatin_l, chLatin_l, chLatin_e, chLatin_g, chLatin_a
    ,   chLatin_l, chLatin_A, chLatin_r, chLatin_g, chLatin_u, chLatin_m
    ,   chLatin_e, chLatin_n, chLatin_t, chLatin_E, chLatin_x, chLatin_c
    ,   chLatin_e, chLatin_p, chLatin_t, chLatin_i, chLatin_o, chLatin_n
    ,   chNull
};

const XMLCh XMLUni::fgInvalidCastException_Name[] =
{
        chLatin_I, chLatin_n, chLatin_v, chLatin_a, chLatin_l, chLatin_i
    ,   chLatin_d, chLatin_C, chLatin_a, chLatin_s, chLatin_t, chLatin_E
    ,   chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t, chLatin_i
    ,   chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgIOException_Name[] =
{
        chLatin_I, chLatin_O, chLatin_E, chLatin_x, chLatin_c, chLatin_e
    ,   chLatin_p, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgNoSuchElementException_Name[] =
{
        chLatin_N, chLatin_o, chLatin_S, chLatin_u, chLatin_c, chLatin_h
    ,   chLatin_E, chLatin_l, chLatin_e, chLatin_m, chLatin_e, chLatin_n
    ,   chLatin_t, chLatin_E, chLatin_x, chLatin_c, chLatin_e, chLatin_p
    ,   chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgNullPointerException_Name[] =
{
        chLatin_N, chLatin_u, chLatin_l, chLatin_l, chLatin_P, chLatin_o
    ,   chLatin_i, chLatin_n, chLatin_t, chLatin_e, chLatin_r, chLatin_E
    ,   chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t, chLatin_i
    ,   chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgXMLPlatformUtilsException_Name[] =
{
        chLatin_X, chLatin_M, chLatin_L, chLatin_P, chLatin_l, chLatin_a
    ,   chLatin_t, chLatin_f, chLatin_o, chLatin_r, chLatin_m, chLatin_E
    ,   chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t, chLatin_i
    ,   chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgRuntimeException_Name[] =
{
        chLatin_R, chLatin_u, chLatin_n, chLatin_t, chLatin_i
    ,   chLatin_m, chLatin_e, chLatin_E, chLatin_x, chLatin_c
    ,   chLatin_e, chLatin_p, chLatin_t, chLatin_i, chLatin_o
    ,   chLatin_n, chNull
};

const XMLCh XMLUni::fgTranscodingException_Name[] =
{
        chLatin_T, chLatin_r, chLatin_a, chLatin_n, chLatin_s, chLatin_c
    ,   chLatin_o, chLatin_d, chLatin_i, chLatin_n, chLatin_g, chLatin_E
    ,   chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t, chLatin_i
    ,   chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgUnexpectedEOFException_Name[] =
{
        chLatin_U, chLatin_n, chLatin_e, chLatin_x, chLatin_p, chLatin_e
    ,   chLatin_c, chLatin_t, chLatin_e, chLatin_d, chLatin_E, chLatin_O
    ,   chLatin_F, chLatin_E, chLatin_x, chLatin_c, chLatin_e, chLatin_p
    ,   chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgUnsupportedEncodingException_Name[] =
{
        chLatin_U, chLatin_n, chLatin_s, chLatin_u, chLatin_p, chLatin_p
    ,   chLatin_o, chLatin_r, chLatin_t, chLatin_e, chLatin_d, chLatin_E
    ,   chLatin_n, chLatin_c, chLatin_o, chLatin_d, chLatin_i, chLatin_n
    ,   chLatin_g, chLatin_E, chLatin_x, chLatin_c, chLatin_e, chLatin_p
    ,   chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgUTFDataFormatException_Name[] =
{
        chLatin_U, chLatin_T, chLatin_F, chLatin_D, chLatin_a, chLatin_t
    ,   chLatin_a, chLatin_F, chLatin_o, chLatin_r, chLatin_m, chLatin_a
    ,   chLatin_t, chLatin_E, chLatin_x, chLatin_c, chLatin_e, chLatin_p
    ,   chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};


const XMLCh XMLUni::fgNetAccessorException_Name[] =
{
        chLatin_N, chLatin_e, chLatin_t, chLatin_A, chLatin_c, chLatin_c
    ,   chLatin_e, chLatin_s, chLatin_s, chLatin_o, chLatin_r, chLatin_E
    ,   chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t, chLatin_i
    ,   chLatin_o, chLatin_n, chNull
};


const XMLCh XMLUni::fgMalformedURLException_Name[] =
{
        chLatin_M, chLatin_a, chLatin_l, chLatin_f, chLatin_o, chLatin_r
    ,   chLatin_m, chLatin_e, chLatin_d, chLatin_U, chLatin_R, chLatin_L
    ,   chLatin_E, chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t
    ,   chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgNumberFormatException_Name[] =
{
        chLatin_N, chLatin_u, chLatin_m, chLatin_b, chLatin_e, chLatin_r
    ,   chLatin_F, chLatin_o, chLatin_r, chLatin_m, chLatin_a, chLatin_t
    ,   chLatin_E, chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t
    ,   chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgParseException_Name[] =
{
        chLatin_P, chLatin_a, chLatin_r, chLatin_s, chLatin_e
    ,   chLatin_E, chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t
    ,   chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgInvalidDatatypeFacetException_Name[] =
{
        chLatin_I, chLatin_n, chLatin_v, chLatin_a, chLatin_l, chLatin_i
    ,   chLatin_d, chLatin_D, chLatin_a, chLatin_t, chLatin_a, chLatin_t
    ,   chLatin_y, chLatin_p, chLatin_e, chLatin_F, chLatin_a, chLatin_c
    ,   chLatin_e, chLatin_t, chLatin_E, chLatin_x, chLatin_c, chLatin_e
    ,   chLatin_p, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgInvalidDatatypeValueException_Name[] =
{
        chLatin_I, chLatin_n, chLatin_v, chLatin_a, chLatin_l, chLatin_i
    ,   chLatin_d, chLatin_D, chLatin_a, chLatin_t, chLatin_a, chLatin_t
    ,   chLatin_y, chLatin_p, chLatin_e, chLatin_V, chLatin_a, chLatin_l
    ,   chLatin_u, chLatin_e, chLatin_E, chLatin_x, chLatin_c, chLatin_e
    ,   chLatin_p, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgSchemaDateTimeException_Name[] =
{
        chLatin_S, chLatin_c, chLatin_h, chLatin_e, chLatin_m, chLatin_a
    ,   chLatin_D, chLatin_a, chLatin_t, chLatin_e
    ,   chLatin_T, chLatin_i, chLatin_m, chLatin_e
    ,   chLatin_E, chLatin_x, chLatin_c, chLatin_e
    ,   chLatin_p, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgXPathException_Name[] =
{
        chLatin_X, chLatin_P, chLatin_a, chLatin_t, chLatin_h, chLatin_E
    ,   chLatin_x, chLatin_c, chLatin_e, chLatin_p, chLatin_t, chLatin_i
    ,   chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgXSerializationException_Name[] =
{
        chLatin_X, chLatin_S, chLatin_e, chLatin_r, chLatin_i, chLatin_a
    ,   chLatin_l, chLatin_i, chLatin_z, chLatin_a, chLatin_t, chLatin_i
    ,   chLatin_o, chLatin_n, chLatin_E, chLatin_x, chLatin_c, chLatin_e
    ,   chLatin_p, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgNegINFString[] =
{
    chDash, chLatin_I, chLatin_N, chLatin_F, chNull
};

const XMLCh XMLUni::fgNegZeroString[] =
{
    chDash, chDigit_0, chNull
};

const XMLCh XMLUni::fgPosZeroString[] =
{
    chDigit_0, chNull
};

const XMLCh XMLUni::fgPosINFString[] =
{
    chLatin_I, chLatin_N, chLatin_F, chNull
};

const XMLCh XMLUni::fgNaNString[] =
{
    chLatin_N, chLatin_a, chLatin_N, chNull
};

const XMLCh XMLUni::fgEString[] =
{
    chLatin_E, chNull
};

const XMLCh XMLUni::fgZeroString[] =
{
    chDigit_0, chNull
};

const XMLCh XMLUni::fgNullString[] =
{
    chLatin_n, chLatin_u, chLatin_l, chLatin_l, chNull
};

// SAX2 Core: http://xml.org/sax/features/validation
const XMLCh XMLUni::fgSAX2CoreValidation[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_x, chLatin_m, chLatin_l, chPeriod, chLatin_o
    ,   chLatin_r, chLatin_g, chForwardSlash, chLatin_s, chLatin_a, chLatin_x
    ,   chForwardSlash, chLatin_f, chLatin_e, chLatin_a, chLatin_t, chLatin_u
    ,   chLatin_r, chLatin_e, chLatin_s, chForwardSlash, chLatin_v, chLatin_a
    ,   chLatin_l, chLatin_i, chLatin_d, chLatin_a, chLatin_t, chLatin_i
    ,   chLatin_o, chLatin_n, chNull
};

// SAX2 Core: http://xml.org/sax/features/namespaces
const XMLCh XMLUni::fgSAX2CoreNameSpaces[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_x, chLatin_m, chLatin_l, chPeriod, chLatin_o
    ,   chLatin_r, chLatin_g, chForwardSlash, chLatin_s, chLatin_a, chLatin_x
    ,   chForwardSlash, chLatin_f, chLatin_e, chLatin_a, chLatin_t, chLatin_u
    ,   chLatin_r, chLatin_e, chLatin_s, chForwardSlash, chLatin_n, chLatin_a
    ,   chLatin_m, chLatin_e, chLatin_s, chLatin_p, chLatin_a, chLatin_c
    ,   chLatin_e, chLatin_s, chNull
};

//SAX2 Core: http://xml.org/sax/features/namespace-prefixes
const XMLCh XMLUni::fgSAX2CoreNameSpacePrefixes[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_x, chLatin_m, chLatin_l, chPeriod, chLatin_o
    ,   chLatin_r, chLatin_g, chForwardSlash, chLatin_s, chLatin_a, chLatin_x
    ,   chForwardSlash, chLatin_f, chLatin_e, chLatin_a, chLatin_t, chLatin_u
    ,   chLatin_r, chLatin_e, chLatin_s, chForwardSlash, chLatin_n, chLatin_a
    ,   chLatin_m, chLatin_e, chLatin_s, chLatin_p, chLatin_a, chLatin_c, chLatin_e
    ,   chDash, chLatin_p, chLatin_r, chLatin_e, chLatin_f, chLatin_i, chLatin_x
    ,   chLatin_e, chLatin_s, chNull
};

//Xerces: http://apache.org/xml/features/validation/dynamic
const XMLCh XMLUni::fgXercesDynamic[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash , chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d
    ,   chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chForwardSlash
    ,   chLatin_d, chLatin_y, chLatin_n, chLatin_a, chLatin_m, chLatin_i, chLatin_c, chNull
};

//Xerces: http://apache.org/xml/features/validation/schema
const XMLCh XMLUni::fgXercesSchema[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d
    ,   chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chForwardSlash
    ,   chLatin_s, chLatin_c, chLatin_h, chLatin_e, chLatin_m, chLatin_a, chNull
};

//Xerces: http://apache.org/xml/features/validation/schema-full-checking
const XMLCh XMLUni::fgXercesSchemaFullChecking[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d
    ,   chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chForwardSlash
    ,   chLatin_s, chLatin_c, chLatin_h, chLatin_e, chLatin_m, chLatin_a, chDash
    ,   chLatin_f, chLatin_u, chLatin_l, chLatin_l, chDash, chLatin_c, chLatin_h
    ,   chLatin_e, chLatin_c, chLatin_k, chLatin_i, chLatin_n, chLatin_g, chNull
};

//Xerces: http://apache.org/xml/features/nonvalidating/load-external-dtd
const XMLCh XMLUni::fgXercesLoadExternalDTD[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_n, chLatin_o, chLatin_n
    ,   chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d
    ,   chLatin_a, chLatin_t, chLatin_i, chLatin_n, chLatin_g, chForwardSlash
    ,   chLatin_l, chLatin_o, chLatin_a, chLatin_d, chDash
    ,   chLatin_e, chLatin_x, chLatin_t, chLatin_e, chLatin_r, chLatin_n, chLatin_a, chLatin_l, chDash
    ,   chLatin_d, chLatin_t, chLatin_d, chNull
};

//Xerces: http://apache.org/xml/features/continue-after-fatal-error
const XMLCh XMLUni::fgXercesContinueAfterFatalError[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_c, chLatin_o, chLatin_n,  chLatin_t, chLatin_i, chLatin_n, chLatin_u, chLatin_e, chDash
    ,   chLatin_a, chLatin_f, chLatin_t, chLatin_e, chLatin_r, chDash
    ,   chLatin_f, chLatin_a, chLatin_t, chLatin_a, chLatin_l, chDash
    ,   chLatin_e, chLatin_r, chLatin_r, chLatin_o, chLatin_r, chNull
};

//Xerces: http://apache.org/xml/features/validation-error-as-fatal
const XMLCh XMLUni::fgXercesValidationErrorAsFatal[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d, chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chDash
    ,   chLatin_e, chLatin_r, chLatin_r, chLatin_o, chLatin_r, chDash
    ,   chLatin_a, chLatin_s, chDash
    ,   chLatin_f, chLatin_a, chLatin_t, chLatin_a, chLatin_l, chNull
};

//Xerces: http://apache.org/xml/features/calculate-src-ofs
const XMLCh XMLUni::fgXercesCalculateSrcOfs[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_c, chLatin_a, chLatin_l, chLatin_c, chLatin_u
    ,   chLatin_l, chLatin_a, chLatin_t, chLatin_e, chDash, chLatin_s, chLatin_r
    ,   chLatin_c, chDash, chLatin_o, chLatin_f, chLatin_s, chNull
};

//Xerces: http://apache.org/xml/features/standard-uri-conformant
const XMLCh XMLUni::fgXercesStandardUriConformant[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_s, chLatin_t, chLatin_a, chLatin_n, chLatin_d
    ,   chLatin_a, chLatin_r, chLatin_d, chDash, chLatin_u, chLatin_r, chLatin_i
    ,   chDash, chLatin_c, chLatin_o, chLatin_n, chLatin_f, chLatin_o, chLatin_r
    ,   chLatin_m, chLatin_a, chLatin_n, chLatin_t, chNull
};


//Property
//Xerces: http://apache.org/xml/properties/schema/external-schemaLocation
const XMLCh XMLUni::fgXercesSchemaExternalSchemaLocation[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_p, chLatin_r
    ,   chLatin_o, chLatin_p, chLatin_e, chLatin_r, chLatin_t, chLatin_i
    ,   chLatin_e, chLatin_s, chForwardSlash, chLatin_s, chLatin_c, chLatin_h
    ,   chLatin_e, chLatin_m, chLatin_a, chForwardSlash, chLatin_e, chLatin_x
    ,   chLatin_t, chLatin_e, chLatin_r, chLatin_n, chLatin_a, chLatin_l, chDash
    ,   chLatin_s, chLatin_c, chLatin_h, chLatin_e, chLatin_m, chLatin_a, chLatin_L
    ,   chLatin_o, chLatin_c, chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

//Property
//Xerces: http://apache.org/xml/properties/security-manager
const XMLCh XMLUni::fgXercesSecurityManager[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_p, chLatin_r
    ,   chLatin_o, chLatin_p, chLatin_e, chLatin_r, chLatin_t, chLatin_i
    ,   chLatin_e, chLatin_s, chForwardSlash, chLatin_s, chLatin_e, chLatin_c
    ,   chLatin_u, chLatin_r, chLatin_i, chLatin_t, chLatin_y, chDash
    ,   chLatin_m, chLatin_a, chLatin_n, chLatin_a, chLatin_g, chLatin_e, chLatin_r
    ,   chNull
};

//Property
//Xerces: http://apache.org/xml/properties/schema/external-noNamespaceSchemaLocation
const XMLCh XMLUni::fgXercesSchemaExternalNoNameSpaceSchemaLocation[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_p, chLatin_r
    ,   chLatin_o, chLatin_p, chLatin_e, chLatin_r, chLatin_t, chLatin_i
    ,   chLatin_e, chLatin_s, chForwardSlash, chLatin_s, chLatin_c, chLatin_h
    ,   chLatin_e, chLatin_m, chLatin_a, chForwardSlash, chLatin_e, chLatin_x
    ,   chLatin_t, chLatin_e, chLatin_r, chLatin_n, chLatin_a, chLatin_l, chDash
    ,   chLatin_n, chLatin_o, chLatin_N, chLatin_a, chLatin_m, chLatin_e, chLatin_s
    ,   chLatin_p, chLatin_a, chLatin_c, chLatin_e, chLatin_S, chLatin_c, chLatin_h
    ,   chLatin_e, chLatin_m, chLatin_a, chLatin_L, chLatin_o, chLatin_c, chLatin_a
    ,   chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

//Property
//Xerces: http://apache.org/xml/properties/scannerName
const XMLCh XMLUni::fgXercesScannerName[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_p, chLatin_r
    ,   chLatin_o, chLatin_p, chLatin_e, chLatin_r, chLatin_t, chLatin_i
    ,   chLatin_e, chLatin_s, chForwardSlash, chLatin_s, chLatin_c, chLatin_a
    ,   chLatin_n, chLatin_n, chLatin_e, chLatin_r, chLatin_N, chLatin_a
    ,   chLatin_m, chLatin_e, chNull
};

//Property
//Xerces: http://apache.org/xml/properties/parser-use-DOMDocument-from-Implementation
const XMLCh XMLUni::fgXercesParserUseDocumentFromImplementation[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_p, chLatin_a
    ,   chLatin_r, chLatin_s, chLatin_e, chLatin_r, chDash, chLatin_u, chLatin_s
    ,   chLatin_e, chDash, chLatin_D, chLatin_O, chLatin_M, chLatin_D, chLatin_o
    ,   chLatin_c, chLatin_u, chLatin_m, chLatin_e, chLatin_n, chLatin_t, chDash
    ,   chLatin_f, chLatin_r, chLatin_o, chLatin_m, chDash, chLatin_I, chLatin_m
    ,   chLatin_p, chLatin_l, chLatin_e, chLatin_m, chLatin_e, chLatin_n, chLatin_t
    ,   chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};


//Xerces: http://apache.org/xml/features/dom/user-adopts-DOMDocument
const XMLCh XMLUni::fgXercesUserAdoptsDOMDocument[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_d, chLatin_o, chLatin_m, chForwardSlash
    ,   chLatin_u, chLatin_s, chLatin_e, chLatin_r, chDash
    ,   chLatin_a, chLatin_d, chLatin_o, chLatin_p, chLatin_t, chLatin_s, chDash
    ,   chLatin_D, chLatin_O, chLatin_M
    ,   chLatin_D, chLatin_o, chLatin_c, chLatin_u, chLatin_m, chLatin_e, chLatin_n, chLatin_t, chNull
};

//Xerces: http://apache.org/xml/features/validation/cache-grammarFromParse
const XMLCh XMLUni::fgXercesCacheGrammarFromParse[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d
    ,   chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chForwardSlash
    ,   chLatin_c, chLatin_a, chLatin_c, chLatin_h, chLatin_e, chDash, chLatin_g
    ,   chLatin_r, chLatin_a, chLatin_m, chLatin_m, chLatin_a, chLatin_r
    ,   chLatin_F, chLatin_r, chLatin_o, chLatin_m, chLatin_P, chLatin_a, chLatin_r
    ,   chLatin_s, chLatin_e, chNull
};

//Xerces: http://apache.org/xml/features/validation/use-cachedGrammarInParse
const XMLCh XMLUni::fgXercesUseCachedGrammarInParse[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h
    ,   chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash
    ,   chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e
    ,   chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s
    ,   chForwardSlash, chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d
    ,   chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chForwardSlash
    ,   chLatin_u, chLatin_s, chLatin_e, chDash, chLatin_c, chLatin_a, chLatin_c
    ,   chLatin_h, chLatin_e, chLatin_d, chLatin_G, chLatin_r, chLatin_a, chLatin_m
    ,   chLatin_m, chLatin_a, chLatin_r, chLatin_I, chLatin_n, chLatin_P, chLatin_r
    ,   chLatin_s, chLatin_e, chNull
};


//Introduced in DOM Level 3
const XMLCh XMLUni::fgDOMCanonicalForm[] =
{
        chLatin_c, chLatin_a, chLatin_n, chLatin_o, chLatin_n, chLatin_i, chLatin_c
    ,   chLatin_a, chLatin_l, chDash, chLatin_f, chLatin_o, chLatin_r, chLatin_m, chNull
};

const XMLCh XMLUni::fgDOMCDATASections[] =
{
        chLatin_c, chLatin_d, chLatin_a, chLatin_t, chLatin_a, chDash, chLatin_s
    ,   chLatin_e, chLatin_c, chLatin_t, chLatin_i, chLatin_o, chLatin_n, chLatin_s, chNull
};

const XMLCh XMLUni::fgDOMComments[] =
{
        chLatin_c, chLatin_o, chLatin_m, chLatin_m, chLatin_e, chLatin_n, chLatin_t
    ,   chLatin_s, chNull
};

const XMLCh XMLUni::fgDOMCharsetOverridesXMLEncoding[] =
{
        chLatin_c, chLatin_h, chLatin_a, chLatin_r, chLatin_s, chLatin_e, chLatin_t
    ,   chDash, chLatin_o, chLatin_v, chLatin_e, chLatin_r, chLatin_r, chLatin_i
    ,   chLatin_d, chLatin_e, chLatin_s, chDash, chLatin_x, chLatin_m, chLatin_l
    ,   chDash, chLatin_e, chLatin_n, chLatin_c, chLatin_o, chLatin_d, chLatin_i
    ,   chLatin_n, chLatin_g, chNull
};

const XMLCh XMLUni::fgDOMDatatypeNormalization[] =
{
        chLatin_d, chLatin_a, chLatin_t, chLatin_a, chLatin_t, chLatin_y, chLatin_p
    ,   chLatin_e, chDash, chLatin_n, chLatin_o, chLatin_r, chLatin_m, chLatin_a
    ,   chLatin_l, chLatin_i, chLatin_z, chLatin_a, chLatin_t, chLatin_i, chLatin_o
    ,   chLatin_n, chNull
};

const XMLCh XMLUni::fgDOMEntities[] =
{
        chLatin_e, chLatin_n, chLatin_t, chLatin_i, chLatin_t, chLatin_i, chLatin_e
    ,   chLatin_s, chNull
};

const XMLCh XMLUni::fgDOMInfoset[] =
{
        chLatin_i, chLatin_n, chLatin_f, chLatin_o, chLatin_s, chLatin_e, chLatin_t, chNull
};

const XMLCh XMLUni::fgDOMNamespaces[] =
{
        chLatin_n, chLatin_a, chLatin_m, chLatin_e, chLatin_s, chLatin_p, chLatin_a
    ,   chLatin_c, chLatin_e, chLatin_s, chNull
};

const XMLCh XMLUni::fgDOMNamespaceDeclarations[] =
{
        chLatin_n, chLatin_a, chLatin_m, chLatin_e, chLatin_s, chLatin_p, chLatin_a
    ,   chLatin_c, chLatin_e, chDash, chLatin_d, chLatin_e, chLatin_c, chLatin_l
    ,   chLatin_a, chLatin_r, chLatin_a, chLatin_t, chLatin_i, chLatin_o, chLatin_n
    ,   chLatin_s, chNull
};

const XMLCh XMLUni::fgDOMSupportedMediatypesOnly[] =
{
        chLatin_s, chLatin_u, chLatin_p, chLatin_p, chLatin_o, chLatin_r, chLatin_t
    ,   chLatin_e, chLatin_d, chDash, chLatin_m, chLatin_e, chLatin_d, chLatin_i
    ,   chLatin_a, chLatin_t, chLatin_y, chLatin_p, chLatin_e, chLatin_s, chDash
    ,   chLatin_o, chLatin_n, chLatin_l, chLatin_y, chNull
};

const XMLCh XMLUni::fgDOMValidateIfSchema[] =
{
        chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d, chLatin_a, chLatin_t
    ,   chLatin_e, chDash, chLatin_i, chLatin_f, chDash, chLatin_s, chLatin_c
    ,   chLatin_h, chLatin_e, chLatin_m, chLatin_a, chNull
};

const XMLCh XMLUni::fgDOMValidation[] =
{
        chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d, chLatin_a, chLatin_t
    ,   chLatin_i, chLatin_o, chLatin_n, chNull
};

const XMLCh XMLUni::fgDOMWhitespaceInElementContent[] =
{
        chLatin_w, chLatin_h, chLatin_i, chLatin_t, chLatin_e, chLatin_s, chLatin_p
    ,   chLatin_a, chLatin_c, chLatin_e, chDash, chLatin_i, chLatin_n, chDash
    ,   chLatin_e, chLatin_l, chLatin_e, chLatin_m, chLatin_e, chLatin_n, chLatin_t
    ,   chDash, chLatin_c, chLatin_o, chLatin_n, chLatin_t, chLatin_e, chLatin_n
    ,   chLatin_t, chNull
};

//Introduced in DOM Level 3
//canonical-form
const XMLCh XMLUni::fgDOMWRTCanonicalForm[] =
{
	chLatin_c, chLatin_a, chLatin_n, chLatin_o, chLatin_n, chLatin_i,
    chLatin_c, chLatin_a, chLatin_l, chDash,    chLatin_f, chLatin_o,
	chLatin_r, chLatin_m, chNull
};

//discard-default-content
const XMLCh XMLUni::fgDOMWRTDiscardDefaultContent[] =
{
	chLatin_d, chLatin_i, chLatin_s, chLatin_c, chLatin_a, chLatin_r,
    chLatin_d, chDash,    chLatin_d, chLatin_e, chLatin_f, chLatin_a,
	chLatin_u, chLatin_l, chLatin_l, chLatin_t, chDash,    chLatin_c,
	chLatin_o, chLatin_n, chLatin_t, chLatin_e, chLatin_n, chLatin_t,
	chNull
};

//entities
const XMLCh XMLUni::fgDOMWRTEntities[] =
{
	chLatin_e, chLatin_n, chLatin_t, chLatin_i, chLatin_t, chLatin_i,
	chLatin_e, chLatin_s, chNull
};

//format-pretty-print
const XMLCh XMLUni::fgDOMWRTFormatPrettyPrint[] =
{
	chLatin_f, chLatin_o, chLatin_r, chLatin_m, chLatin_a, chLatin_t,
    chDash,    chLatin_p, chLatin_r, chLatin_e, chLatin_t, chLatin_t,
	chLatin_y, chDash,    chLatin_p, chLatin_r, chLatin_i, chLatin_n,
	chLatin_t, chNull
};

//normalize-characters
const XMLCh XMLUni::fgDOMWRTNormalizeCharacters[] =
{
	chLatin_n, chLatin_o, chLatin_r, chLatin_m, chLatin_a, chLatin_l,
    chLatin_i, chLatin_z, chLatin_e, chDash,    chLatin_c, chLatin_h,
	chLatin_a, chLatin_r, chLatin_a, chLatin_c, chLatin_t, chLatin_e,
	chLatin_r, chLatin_s, chNull
};

//split-cdata-sections
const XMLCh XMLUni::fgDOMWRTSplitCdataSections[] =
{
	chLatin_s, chLatin_p, chLatin_l, chLatin_i, chLatin_t, chDash,
    chLatin_c, chLatin_d, chLatin_a, chLatin_t, chLatin_a, chDash,
	chLatin_s, chLatin_e, chLatin_c, chLatin_t, chLatin_i, chLatin_o,
	chLatin_n, chLatin_s, chNull
};

//validation
const XMLCh XMLUni::fgDOMWRTValidation[] =
{
	chLatin_v, chLatin_a, chLatin_l, chLatin_i, chLatin_d, chLatin_a,
	chLatin_t, chLatin_i, chLatin_o, chLatin_n, chNull
};

//whitespace-in-element-content
const XMLCh XMLUni::fgDOMWRTWhitespaceInElementContent[] =
{
	chLatin_w, chLatin_h, chLatin_i, chLatin_t, chLatin_e, chLatin_s,
    chLatin_p, chLatin_a, chLatin_c, chLatin_e, chDash,    chLatin_i,
	chLatin_n, chDash,    chLatin_e, chLatin_l, chLatin_e, chLatin_m,
	chLatin_e, chLatin_n, chLatin_t, chDash,    chLatin_c, chLatin_o,
	chLatin_n, chLatin_t, chLatin_e, chLatin_n, chLatin_t, chNull
};

//Xerces: http://apache.org/xml/features/dom/byte-order-mark
const XMLCh XMLUni::fgDOMWRTBOM[] =
{
    chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash,
    chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c, chLatin_h,
    chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g, chForwardSlash,
    chLatin_x, chLatin_m, chLatin_l, chForwardSlash, chLatin_f, chLatin_e,
    chLatin_a, chLatin_t, chLatin_u, chLatin_r, chLatin_e, chLatin_s,
    chForwardSlash, chLatin_d, chLatin_o, chLatin_m, chForwardSlash,
    chLatin_b, chLatin_y, chLatin_t, chLatin_e, chDash,
    chLatin_o, chLatin_r, chLatin_d, chLatin_e, chLatin_r, chDash,
    chLatin_m, chLatin_a, chLatin_r, chLatin_k, chNull
};

//xml-declaration
const XMLCh XMLUni::fgDOMXMLDeclaration[] =
{ 
    chLatin_x, chLatin_m, chLatin_l, chDash, chLatin_d, chLatin_e, chLatin_c,
    chLatin_l, chLatin_a, chLatin_r, chLatin_a, chLatin_t, chLatin_i, chLatin_o,
    chLatin_n, chNull 
};

// en_US
const char XMLUni::fgXercescDefaultLocale[] = "en_US";

// DOM Message Domain
const XMLCh XMLUni::fgXMLDOMMsgDomain[] =
{
        chLatin_h, chLatin_t, chLatin_t, chLatin_p, chColon, chForwardSlash
    ,   chForwardSlash, chLatin_a, chLatin_p, chLatin_a, chLatin_c
    ,   chLatin_h, chLatin_e, chPeriod, chLatin_o, chLatin_r, chLatin_g
    ,   chForwardSlash, chLatin_x, chLatin_m, chLatin_l, chForwardSlash
    ,   chLatin_m, chLatin_e, chLatin_s, chLatin_s, chLatin_a, chLatin_g
    ,   chLatin_e, chLatin_s, chForwardSlash, chLatin_X, chLatin_M, chLatin_L
    ,   chLatin_D, chLatin_O, chLatin_M, chLatin_M, chLatin_s, chLatin_g
    ,   chNull
};



XERCES_CPP_NAMESPACE_END

