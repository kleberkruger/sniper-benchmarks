/****************************************************************************
 *                  fnpovfpu.cpp
 *
 * This module implements the the function type used by iso surfaces and
 * the function pattern.
 *
 * This module is inspired by code by D. Skarda, T. Bily and R. Suzuki.
 *
 * from Persistence of Vision(tm) Ray Tracer version 3.6.
 * Copyright 1991-2003 Persistence of Vision Team
 * Copyright 2003-2004 Persistence of Vision Raytracer Pty. Ltd.
 *---------------------------------------------------------------------------
 * NOTICE: This source code file is provided so that users may experiment
 * with enhancements to POV-Ray and to port the software to platforms other
 * than those supported by the POV-Ray developers. There are strict rules
 * regarding how you are permitted to use this file. These rules are contained
 * in the distribution and derivative versions licenses which should have been
 * provided with this file.
 *
 * These licences may be found online, linked from the end-user license
 * agreement that is located at http://www.povray.org/povlegal.html
 *---------------------------------------------------------------------------
 * This program is based on the popular DKB raytracer version 2.12.
 * DKBTrace was originally written by David K. Buck.
 * DKBTrace Ver 2.0-2.12 were written by David K. Buck & Aaron A. Collins.
 *---------------------------------------------------------------------------
 * $File: //depot/povray/3.5/source/fnpovfpu.cpp $
 * $Revision: #65 $
 * $Change: 3010 $
 * $DateTime: 2004/07/27 14:06:43 $
 * $Author: thorsten $
 * $Log$
 *****************************************************************************/

/*

# Rs = R0 - R7, one of eight floating-point registers
# Rd = R0 - R7, one of eight floating-point registers
# k = constant, can be DBL or int depending on function
# SP = data stack point
# PSP = program stack pointer
# CC = condition code register
# PC = program counter
# global = global variable data space
# local = local variable data space
# const = const floating-point value data space
# eq = equal
# ne = not equal
# lt = lower
# le = lower or equal
# gt = greater
# ge = greater or equal


R-Type Instructions (9 * 64 = 576)

 Opcode | Source |  Dest  |  k-data  | Instruction      | Operation
 4 bits | 3 bits | 3 bits | 20 bits  |                  |
--------+--------+--------+----------+------------------+--------------------------------
   00   |   Rs   |   Rd   |   0000   | add   Rs, Rd     | Rd + Rs -> Rd
   01   |   Rs   |   Rd   |   0000   | sub   Rs, Rd     | Rd - Rs -> Rd
   02   |   Rs   |   Rd   |   0000   | mul   Rs, Rd     | Rd * Rs -> Rd
   03   |   Rs   |   Rd   |   0000   | div   Rs, Rd     | Rd / Rs -> Rd
   04   |   Rs   |   Rd   |   0000   | mod   Rs, Rd     | Rd % Rs -> Rd
   05   |   Rs   |   Rd   |   0000   | move  Rs, Rd     | Rs -> Rd
   06   |   Rs   |   Rd   |   0000   | cmp   Rs, Rd     | Rd - Rs -> CC
   07   |   Rs   |   Rd   |   0000   | neg   Rs, Rd     | -Rs -> Rd
   08   |   Rs   |   Rd   |   0000   | abs   Rs, Rd     | |Rs| -> Rd


I-Type Instructions (7 * 8 = 56)

 Opcode | Ext.Op |  Dest  |  k-data  | Instruction      | Operation
 4 bits | 3 bits | 3 bits | 16 bits  |                  |
--------+--------+--------+----------+------------------+--------------------------------
   09   |   00   |   Rd   | const(k) | addi  const, Rd  | Rd + const(k) -> Rd
   09   |   01   |   Rd   | const(k) | subi  const, Rd  | Rd - const(k) -> Rd
   09   |   02   |   Rd   | const(k) | muli  const, Rd  | Rd * const(k) -> Rd
   09   |   03   |   Rd   | const(k) | divi  const, Rd  | Rd / const(k) -> Rd
   09   |   04   |   Rd   | const(k) | modi  const, Rd  | Rd % const(k) -> Rd
   09   |   05   |   Rd   | const(k) | loadi const, Rd  | const(k) -> Rd
   09   |   06   |   Rd   | const(k) | cmpi  const, Rd  | Rd - const(k) -> CC


JS-Type Instructions (6 * 8 = 48)

 Opcode | Ext.Op |  Dest  |  k-data  | Instruction      | Operation
 4 bits | 3 bits | 3 bits | 16 bits  |                  |
--------+--------+--------+----------+------------------+--------------------------------
   10   |   00   |   Rd   |   0000   | seq   Rd         | (CC = eq) -> Rd
   10   |   01   |   Rd   |   0000   | sne   Rd         | (CC = ne) -> Rd
   10   |   02   |   Rd   |   0000   | slt   Rd         | (CC = lt) -> Rd
   10   |   03   |   Rd   |   0000   | sle   Rd         | (CC = le) -> Rd
   10   |   04   |   Rd   |   0000   | sgt   Rd         | (CC = gt) -> Rd
   10   |   05   |   Rd   |   0000   | sge   Rd         | (CC = ge) -> Rd
   10   |   06   |   Rd   |   0000   | teq   Rd         | (Rd == 0) -> Rd
   10   |   07   |   Rd   |   0000   | tne   Rd         | (Rd != 0) -> Rd


ML-Type Instructions (6 * 8 = 48)

 Opcode | Ext.Op |  Dest  |  k-data  | Instruction      | Operation
 4 bits | 3 bits | 3 bits | 20 bits  |                  |
--------+--------+--------+----------+------------------+--------------------------------
   11   |   00   |   Rd   |   0000   | load 0(k), Rd    | global(k) -> Rd
   11   |   01   |   Rd   |   0000   | load SP(k), Rd   | local(k) -> Rd
   11   |   02   |   Rd   |   0000   | load 0(k,a), Rd  | global(k + a) -> Rd
   11   |   03   |   Rd   |   0000   | load SP(k,a), Rd | local(k + a) -> Rd
   11   |   04   |   Rd   |   0000   | load 0(k,b), Rd  | global(k + b) -> Rd
   11   |   05   |   Rd   |   0000   | load SP(k,b), Rd | local(k + b) -> Rd


MS-Type Instructions (6 * 8 = 48)

 Opcode | Ext.Op | Source |  k-data  | Instruction      | Operation
 4 bits | 3 bits | 3 bits | 20 bits  |                  |
--------+--------+--------+----------+------------------+--------------------------------
   12   |   00   |   Rs   |   0000   | store Rs, 0(k)   | Rs -> global(k)
   12   |   01   |   Rs   |   0000   | store Rs, SP(k)  | Rs -> local(k)
   12   |   02   |   Rs   |   0000   | store Rs, 0(k,a) | Rs -> global(k + a)
   12   |   03   |   Rs   |   0000   | store Rs, SP(k,a)| Rs -> local(k + a)
   12   |   04   |   Rs   |   0000   | store Rs, 0(k,b) | Rs -> global(k + b)
   12   |   05   |   Rs   |   0000   | store Rs, SP(k,b)| Rs -> local(k + b)


JB-Type Instructions (6)

 Opcode | Ext.Op | Unused |  k-data  | Instruction      | Operation
 4 bits | 3 bits | 3 bits | 20 bits  |                  |
--------+--------+--------+----------+------------------+--------------------------------
   13   |   00   |   00   |  offset  | beq   k          | if (CC = eq) then k -> PC
   13   |   01   |   00   |  offset  | bne   k          | if (CC = ne) then k -> PC
   13   |   02   |   00   |  offset  | blt   k          | if (CC = lt) then k -> PC
   13   |   03   |   00   |  offset  | ble   k          | if (CC = le) then k -> PC
   13   |   04   |   00   |  offset  | bgt   k          | if (CC = gt) then k -> PC
   13   |   05   |   00   |  offset  | bge   k          | if (CC = ge) then k -> PC


XS-Type Instructions (6 * 8 = 48)

 Opcode | Ext.Op | Source |  k-data  | Instruction      | Operation
 4 bits | 3 bits | 3 bits | 20 bits  |                  |
--------+--------+--------+----------+------------------+--------------------------------
   14   |   00   |   Rs   |   0000   | xeq   Rs         | if (Rs == 0) then exception
   14   |   01   |   Rs   |   0000   | xne   Rs         | if (Rs != 0) then exception
   14   |   02   |   Rs   |   0000   | xlt   Rs         | if (Rs < 0) then exception
   14   |   03   |   Rs   |   0000   | xle   Rs         | if (Rs <= 0) then exception
   14   |   04   |   Rs   |   0000   | xgt   Rs         | if (Rs > 0) then exception
   14   |   05   |   Rs   |   0000   | xge   Rs         | if (Rs >= 0) then exception
   14   |   06   |   Rs   |   0000   | xdz   R0, Rs     | if (R0 == 0) && (Rs == 0) then exception


X-Type Instructions (14)

 Opcode | Extended Opcode |  k-data  | Instruction      | Operation
 4 bits |     6 bits      | 20 bits  |                  |
--------+-----------------+----------+------------------+--------------------------------
   15   |       00        |   0000   | jsr   k          | PSP + 1 -> PSP, PC -> (PSP), k -> PC
   15   |       01        |   0000   | jmp   k          | k -> PC
   15   |       02        |   0000   | rts              | (PSP) -> PC, PSP - 1 -> PSP
   15   |       03        |   0000   | call  k          | calls user-defined function k, result will be in R0 or A
   15   |       04        |   0000   | sys1  k          | calls internal function k with one argument, result will be in R0 or A
   15   |       05        |   0000   | sys2  k          | calls internal function k with two arguments, result will be in R0 or A
   15   |       06        |   0000   | trap  k          | calls internal function k with arguments on stack, result will be in R0 or A
   15   |       07        |   0000   | traps k          | calls internal function k with arguments on stack, result will be on the stack
   15   |       08        |   0000   | grow  k          | grow the stack to hold k elements (integer or floating-point numbers)
   15   |       09        |   0000   | push  k          | move the stack pointer k elements forward
   15   |       10        |   0000   | pop   k          | move the stack pointer k elements backward
   15   |       11        |   0000   | iconv            | int(R0) -> A
   15   |       12        |   0000   | fconv            | float(A) -> R0
   15   |       31        |   0000   | nop              | no operation


XI-Type Instructions (4 * 18 = 72)

 Opcode | Ext.Op | Ext.Op |  k-data  | Instruction      | Operation
 4 bits | 6 bits | 2 bits | 20 bits  |                  |
--------+-----------------+----------+------------------+--------------------------------
   15   |   32   |   sd   |   0000   | add   s, d       | d + s -> d
   15   |   33   |   sd   |   0000   | sub   s, d       | d - s -> d
   15   |   34   |   sd   |   0000   | mul   s, d       | d * s -> d
   15   |   35   |   00   |   0000   | div   B, A       | A / B -> A
   15   |   35   |   01   |   0000   | div   A, B       | B / A -> B
   15   |   35   |   02   |   0000   | mod   B, A       | A % B -> A
   15   |   35   |   03   |   0000   | mod   A, B       | B % A -> B
   15   |   36   |   00   |   0000   | cmp   B, A       | A - B -> CC
   15   |   36   |   01   |   0000   | cmp   A, B       | B - A -> CC
   15   |   36   |   02   |   0000   | exg   A, B       | A <-> B
   15   |   36   |   03   |   0000   | clr   A, B       | 0 -> A, 0 -> B
   15   |   37   |   00   |   0000   | clr   A          | 0 -> A
   15   |   37   |   01   |   0000   | clr   B          | 0 -> B
   15   |   37   |   02   |   0000   | move  B, A       | B -> A
   15   |   37   |   03   |   0000   | move  A, B       | A -> B
   15   |   38   |   00   |   0000   | neg   A          | -A -> A
   15   |   38   |   01   |   0000   | neg   B          | -B -> B
   15   |   38   |   02   |   0000   | abs   A          | |A| -> A
   15   |   38   |   03   |   0000   | abs   B          | |B| -> B
   15   |   39   |   00   |   kkkk   | addi  k, A       | A + k -> A
   15   |   39   |   01   |   kkkk   | addi  k, B       | B + k -> B
   15   |   39   |   02   |   kkkk   | subi  k, A       | A - k -> A
   15   |   39   |   03   |   kkkk   | subi  k, B       | B - k -> B
   15   |   40   |   sd   |   0000   | asl   s, d       | d << s -> d (signed)
   15   |   41   |   sd   |   0000   | asr   s, d       | d >> s -> d (signed)
   15   |   42   |   sd   |   0000   | lsl   s, d       | d << s -> d (unsigned)
   15   |   43   |   sd   |   0000   | lsr   s, d       | d >> s -> d (unsigned)
   15   |   44   |   sd   |   0000   | and   s, d       | d & s -> d
   15   |   45   |   sd   |   0000   | or    s, d       | d | s -> d
   15   |   46   |   sd   |   0000   | xor   s, d       | d ^ s -> d
   15   |   47   |   sd   |   0000   | not   s, d       | !s -> d
   15   |   48   |   00   |   kkkk   | loadi A          | k -> A
   15   |   48   |   01   |   kkkk   | loadi B          | k -> B
   15   |   48   |   02   |   kkkk   | ldhi  A          | (A << 16) | k -> A
   15   |   48   |   03   |   kkkk   | ldhi  B          | (B << 16) | k -> B
   15   |   49   |   00   |   kkkk   | max   k, A       | max(k, A) -> A
   15   |   49   |   01   |   kkkk   | max   k, B       | max(k, B) -> B
   15   |   49   |   02   |   kkkk   | min   k, A       | min(k, A) -> A
   15   |   49   |   03   |   kkkk   | min   k, B       | min(k, B) -> B


Total number of defined instructions: 916
Density of instruction set: 916 / 1024 = 0.8945

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#if !defined(SPEC_CPU_WINDOWS_ICL)
#include <math.h>
#else
#include <mathimf.h>
#endif /* SPEC_CPU_WINDOWS_ICL */
#include <algorithm>

#define DEBUG_DEFAULTCPU 0
#define SUPPORT_INTEGER_INSTRUCTIONS 0

#include "frame.h"
#include "povray.h"
#include "fnpovfpu.h"
#include "fnintern.h"
#include "mathutil.h"

BEGIN_POV_NAMESPACE

/*****************************************************************************
* Local preprocessor defines
******************************************************************************/

#define _OP_MATH_ABCOP(a,b,c,op) \
    case (a+b+0): r0 = r0 op c; break; \
    case (a+b+1): r1 = r1 op c; break; \
    case (a+b+2): r2 = r2 op c; break; \
    case (a+b+3): r3 = r3 op c; break; \
    case (a+b+4): r4 = r4 op c; break; \
    case (a+b+5): r5 = r5 op c; break; \
    case (a+b+6): r6 = r6 op c; break; \
    case (a+b+7): r7 = r7 op c; break

#define _OP_ABS_ABC(a,b,c) \
    case (a+b+0): r0 = fabs(c); break; \
    case (a+b+1): r1 = fabs(c); break; \
    case (a+b+2): r2 = fabs(c); break; \
    case (a+b+3): r3 = fabs(c); break; \
    case (a+b+4): r4 = fabs(c); break; \
    case (a+b+5): r5 = fabs(c); break; \
    case (a+b+6): r6 = fabs(c); break; \
    case (a+b+7): r7 = fabs(c); break

#define OP_MOD_ABC(a,b,c) \
    case ((a*64)+(b*8)+0): r0 = fmod(r0, c); break; \
    case ((a*64)+(b*8)+1): r1 = fmod(r1, c); break; \
    case ((a*64)+(b*8)+2): r2 = fmod(r2, c); break; \
    case ((a*64)+(b*8)+3): r3 = fmod(r3, c); break; \
    case ((a*64)+(b*8)+4): r4 = fmod(r4, c); break; \
    case ((a*64)+(b*8)+5): r5 = fmod(r5, c); break; \
    case ((a*64)+(b*8)+6): r6 = fmod(r6, c); break; \
    case ((a*64)+(b*8)+7): r7 = fmod(r7, c); break

#define OP_MATH_AOP(a,op) \
    _OP_MATH_ABCOP((a*64),(0*8),r0,op); \
    _OP_MATH_ABCOP((a*64),(1*8),r1,op); \
    _OP_MATH_ABCOP((a*64),(2*8),r2,op); \
    _OP_MATH_ABCOP((a*64),(3*8),r3,op); \
    _OP_MATH_ABCOP((a*64),(4*8),r4,op); \
    _OP_MATH_ABCOP((a*64),(5*8),r5,op); \
    _OP_MATH_ABCOP((a*64),(6*8),r6,op); \
    _OP_MATH_ABCOP((a*64),(7*8),r7,op)

#define OP_MOD_A(a) \
    OP_MOD_ABC(a,0,r0); \
    OP_MOD_ABC(a,1,r1); \
    OP_MOD_ABC(a,2,r2); \
    OP_MOD_ABC(a,3,r3); \
    OP_MOD_ABC(a,4,r4); \
    OP_MOD_ABC(a,5,r5); \
    OP_MOD_ABC(a,6,r6); \
    OP_MOD_ABC(a,7,r7)

#define OP_ABS_A(a) \
    _OP_ABS_ABC((a*64),(0*8),r0); \
    _OP_ABS_ABC((a*64),(1*8),r1); \
    _OP_ABS_ABC((a*64),(2*8),r2); \
    _OP_ABS_ABC((a*64),(3*8),r3); \
    _OP_ABS_ABC((a*64),(4*8),r4); \
    _OP_ABS_ABC((a*64),(5*8),r5); \
    _OP_ABS_ABC((a*64),(6*8),r6); \
    _OP_ABS_ABC((a*64),(7*8),r7)

#define OP_XCC_ABOP(a,b,op) \
    case ((a*64)+(b*8)+0): if(r0 op 0.0) POVFPU_Exception(fn); break; \
    case ((a*64)+(b*8)+1): if(r1 op 0.0) POVFPU_Exception(fn); break; \
    case ((a*64)+(b*8)+2): if(r2 op 0.0) POVFPU_Exception(fn); break; \
    case ((a*64)+(b*8)+3): if(r3 op 0.0) POVFPU_Exception(fn); break; \
    case ((a*64)+(b*8)+4): if(r4 op 0.0) POVFPU_Exception(fn); break; \
    case ((a*64)+(b*8)+5): if(r5 op 0.0) POVFPU_Exception(fn); break; \
    case ((a*64)+(b*8)+6): if(r6 op 0.0) POVFPU_Exception(fn); break; \
    case ((a*64)+(b*8)+7): if(r7 op 0.0) POVFPU_Exception(fn); break; \

#define OP_MATH_ABCOP(a,b,c,op) \
    case ((a*64)+(b*8)+0): r0 = (r0 op c); break; \
    case ((a*64)+(b*8)+1): r1 = (r1 op c); break; \
    case ((a*64)+(b*8)+2): r2 = (r2 op c); break; \
    case ((a*64)+(b*8)+3): r3 = (r3 op c); break; \
    case ((a*64)+(b*8)+4): r4 = (r4 op c); break; \
    case ((a*64)+(b*8)+5): r5 = (r5 op c); break; \
    case ((a*64)+(b*8)+6): r6 = (r6 op c); break; \
    case ((a*64)+(b*8)+7): r7 = (r7 op c); break


#define OP_ASSIGN_ABOP(a,b,op) \
    case ((a*64)+(b*8)+0): r0 = op; break; \
    case ((a*64)+(b*8)+1): r1 = op; break; \
    case ((a*64)+(b*8)+2): r2 = op; break; \
    case ((a*64)+(b*8)+3): r3 = op; break; \
    case ((a*64)+(b*8)+4): r4 = op; break; \
    case ((a*64)+(b*8)+5): r5 = op; break; \
    case ((a*64)+(b*8)+6): r6 = op; break; \
    case ((a*64)+(b*8)+7): r7 = op; break

#define OP_REVASSIGN_ABOP(a,b,op) \
    case ((a*64)+(b*8)+0): op = r0; break; \
    case ((a*64)+(b*8)+1): op = r1; break; \
    case ((a*64)+(b*8)+2): op = r2; break; \
    case ((a*64)+(b*8)+3): op = r3; break; \
    case ((a*64)+(b*8)+4): op = r4; break; \
    case ((a*64)+(b*8)+5): op = r5; break; \
    case ((a*64)+(b*8)+6): op = r6; break; \
    case ((a*64)+(b*8)+7): op = r7; break

#define OP_CMP_ABC(a,b,c) \
    case ((a*64)+(b*8)+0): ccr = (((c > r0) & 1) << 1) | ((c == r0) & 1); break; \
    case ((a*64)+(b*8)+1): ccr = (((c > r1) & 1) << 1) | ((c == r1) & 1); break; \
    case ((a*64)+(b*8)+2): ccr = (((c > r2) & 1) << 1) | ((c == r2) & 1); break; \
    case ((a*64)+(b*8)+3): ccr = (((c > r3) & 1) << 1) | ((c == r3) & 1); break; \
    case ((a*64)+(b*8)+4): ccr = (((c > r4) & 1) << 1) | ((c == r4) & 1); break; \
    case ((a*64)+(b*8)+5): ccr = (((c > r5) & 1) << 1) | ((c == r5) & 1); break; \
    case ((a*64)+(b*8)+6): ccr = (((c > r6) & 1) << 1) | ((c == r6) & 1); break; \
    case ((a*64)+(b*8)+7): ccr = (((c > r7) & 1) << 1) | ((c == r7) & 1); break; \

#define OP_SPECIAL(a,b,c,op) \
    case ((a*64)+(b*8)+c): op; break

#define OP_SPECIAL_CASE(a,b,c) \
    case ((a*64)+(b*8)+c):

#define OP_INT_MATH_ABOP(a,b,op) \
    case ((a*64)+(b*4)+0): iA = iA op iA; break; \
    case ((a*64)+(b*4)+1): iA = iA op iB; break; \
    case ((a*64)+(b*4)+2): iB = iB op iA; break; \
    case ((a*64)+(b*4)+3): iB = iB op iB; break

#define OP_INT_MATH_SHIFT_ABOP(a,b,op,c) \
    case ((a*64)+(b*4)+0): iA = (c(iA) op iA); break; \
    case ((a*64)+(b*4)+1): iA = (c(iA) op iB); break; \
    case ((a*64)+(b*4)+2): iB = (c(iB) op iA); break; \
    case ((a*64)+(b*4)+3): iB = (c(iB) op iB); break

#define OP_INT_SPECIAL(a,b,c,op) \
    case ((a*64)+(b*4)+c): op; break

#define OP_INT_SPECIAL_CASE(a,b,c) \
    case ((a*64)+(b*4)+c):

/*****************************************************************************
* Local typedefs
******************************************************************************/


/*****************************************************************************
* Local functions
******************************************************************************/

SYS_MATH_RETURN math_int(SYS_MATH_PARAM i);
SYS_MATH_RETURN math_div(SYS_MATH_PARAM i1, SYS_MATH_PARAM i2);


/*****************************************************************************
* Global variables
******************************************************************************/

const Opcode POVFPU_Opcodes[] =
{
	{ "add",   OPCODE_ADD,    ITYPE_R },
	{ "sub",   OPCODE_SUB,    ITYPE_R },
	{ "mul",   OPCODE_MUL,    ITYPE_R },
	{ "div",   OPCODE_DIV,    ITYPE_R },
	{ "mod",   OPCODE_MOD,    ITYPE_R },
	{ "move",  OPCODE_MOVE,   ITYPE_R },
	{ "cmp",   OPCODE_CMP,    ITYPE_R },
	{ "neg",   OPCODE_NEG,    ITYPE_R },
	{ "abs",   OPCODE_ABS,    ITYPE_R },
	{ "addi",  OPCODE_ADDI,   ITYPE_I },
	{ "subi",  OPCODE_SUBI,   ITYPE_I },
	{ "muli",  OPCODE_MULI,   ITYPE_I },
	{ "divi",  OPCODE_DIVI,   ITYPE_I },
	{ "modi",  OPCODE_MODI,   ITYPE_I },
	{ "loadi", OPCODE_LOADI,  ITYPE_I },
	{ "cmpi",  OPCODE_CMPI,   ITYPE_I },
	{ "seq",   OPCODE_SEQ,    ITYPE_S },
	{ "sne",   OPCODE_SNE,    ITYPE_S },
	{ "slt",   OPCODE_SLT,    ITYPE_S },
	{ "sle",   OPCODE_SLE,    ITYPE_S },
	{ "sgt",   OPCODE_SGT,    ITYPE_S },
	{ "sge",   OPCODE_SGE,    ITYPE_S },
	{ "teq",   OPCODE_TEQ,    ITYPE_S },
	{ "tne",   OPCODE_TNE,    ITYPE_S },
	{ "load",  OPCODE_LOAD,   ITYPE_M },
	{ "store", OPCODE_STORE,  ITYPE_M },
	{ "xeq",   OPCODE_XEQ,    ITYPE_S },
	{ "xne",   OPCODE_XNE,    ITYPE_S },
	{ "xlt",   OPCODE_XLT,    ITYPE_S },
	{ "xle",   OPCODE_XLE,    ITYPE_S },
	{ "xgt",   OPCODE_XGT,    ITYPE_S },
	{ "xge",   OPCODE_XGE,    ITYPE_S },
	{ "xdz",   OPCODE_XDZ,    ITYPE_S },
	{ "beq",   OPCODE_BEQ,    ITYPE_J },
	{ "bne",   OPCODE_BNE,    ITYPE_J },
	{ "blt",   OPCODE_BLT,    ITYPE_J },
	{ "ble",   OPCODE_BLE,    ITYPE_J },
	{ "bgt",   OPCODE_BGT,    ITYPE_J },
	{ "bge",   OPCODE_BGE,    ITYPE_J },
	{ "jsr",   OPCODE_JSR,    ITYPE_J },
	{ "jmp",   OPCODE_JMP,    ITYPE_J },
	{ "rts",   OPCODE_RTS,    ITYPE_X },
	{ "call",  OPCODE_CALL,   ITYPE_J },
	{ "sys1",  OPCODE_SYS1,   ITYPE_J },
	{ "sys2",  OPCODE_SYS2,   ITYPE_J },
	{ "trap",  OPCODE_TRAP,   ITYPE_J },
	{ "traps", OPCODE_TRAPS,  ITYPE_J },
	{ "grow",  OPCODE_GROW,   ITYPE_J },
	{ "push",  OPCODE_PUSH,   ITYPE_J },
	{ "pop",   OPCODE_POP,    ITYPE_J },
	{ "nop",   OPCODE_NOP,    ITYPE_X },
	{ NULL,    0, 0 }
};

const Sys1 POVFPU_Sys1Table[] =
{
	sin,            // 0
	cos,            // 1
	tan,            // 2
	asin,           // 3
	acos,           // 4
	atan,           // 5
	sinh,           // 6
	cosh,           // 7
	tanh,           // 8
	asinh,          // 9
	acosh,          // 10
	atanh,          // 11
	floor,          // 12
	ceil,           // 13
	sqrt,           // 14
	exp,            // 15
	log,            // 16
	log10,          // 17
	math_int,       // 18
	NULL
};

const Sys2 POVFPU_Sys2Table[] =
{
	pow,            // 0
	atan2,          // 1
	fmod,           // 2
	math_div,       // 3
	NULL
};


const unsigned int POVFPU_Sys1TableSize = 19;
const unsigned int POVFPU_Sys2TableSize = 4;

DBL *POVFPU_Globals = NULL; // GLOBAL VARIABLE
DBL *POVFPU_Consts = NULL; // GLOBAL VARIABLE
unsigned int POVFPU_GlobalCnt = 0; // GLOBAL VARIABLE
unsigned int POVFPU_ConstCnt = 0; // GLOBAL VARIABLE

FunctionEntry *POVFPU_Functions = NULL; // GLOBAL VARIABLE
unsigned int POVFPU_FunctionCnt = 0; // GLOBAL VARIABLE

FPUContext *POVFPU_Context_Root = NULL; // GLOBAL VARIABLE
FPUContext *POVFPU_Current_Context = NULL; // GLOBAL VARIABLE


/*****************************************************************************
*
* FUNCTION
*
*   math_int
*
* INPUT
*   
* OUTPUT
*   
* RETURNS
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Misc. math utility functions.
*
* CHANGES
*
*   -
*
******************************************************************************/

SYS_MATH_RETURN math_int(SYS_MATH_PARAM i)
{
	return (SYS_MATH_RETURN)((int)(i));
}


/*****************************************************************************
*
* FUNCTION
*
*   math_div
*
* INPUT
*   
* OUTPUT
*   
* RETURNS
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Misc. math utility functions.
*
* CHANGES
*
*   -
*
******************************************************************************/

SYS_MATH_RETURN math_div(SYS_MATH_PARAM i1, SYS_MATH_PARAM i2)
{
	return (SYS_MATH_RETURN)((int)(i1/i2));
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_Init
*
* INPUT
*   
* OUTPUT
*   
* RETURNS
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Init the virtual machine.
*
* CHANGES
*
*   -
*
******************************************************************************/

void POVFPU_Init()
{
	POVFPU_Globals = NULL;
	POVFPU_Consts = NULL;
	POVFPU_GlobalCnt = 0;
	POVFPU_ConstCnt = 0;

	POVFPU_Functions = NULL;
	POVFPU_FunctionCnt = 0;

	POVFPU_Context_Root = NULL;
	POVFPU_Current_Context = POVFPU_NewContext();

	// default constants are 0 and 1
	POVFPU_AddConstant(0.0);
	POVFPU_AddConstant(1.0);

	SYS_INIT_FUNCTIONS();
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_Terminate
*
* INPUT
*   
* OUTPUT
*   
* RETURNS
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Terminate the virtual machine.  Automatically performs a reset.
*
* CHANGES
*
*   -
*
******************************************************************************/

void POVFPU_Terminate()
{
	// if terminated before first use, do nothing
	if(POVFPU_Context_Root == NULL)
		return;

	SYS_TERM_FUNCTIONS();

	POVFPU_Reset();

	while(POVFPU_Context_Root != NULL)
	{
		POV_FREE(POVFPU_Context_Root->dblstackbase);
		POV_FREE(POVFPU_Context_Root->pstackbase);
		POVFPU_Current_Context = POVFPU_Context_Root;
		POVFPU_Context_Root = POVFPU_Context_Root->next;
		POV_FREE(POVFPU_Current_Context);
	}
	POVFPU_Current_Context = NULL;
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_Reset
*
* INPUT
*   
* OUTPUT
*   
* RETURNS
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Reset the virtual machine.  This clears all global variables, constants
*   and functions.
*
* CHANGES
*
*   -
*
******************************************************************************/

void POVFPU_Reset()
{
	SYS_RESET_FUNCTIONS();

	if(POVFPU_Globals != NULL)
	{
		POV_FREE(POVFPU_Globals);
		POVFPU_Globals = NULL;
		POVFPU_GlobalCnt = 0;
	}
	if(POVFPU_Consts != NULL)
	{
		POV_FREE(POVFPU_Consts);
		POVFPU_Consts = NULL;
		POVFPU_ConstCnt = 0;
	}
	if(POVFPU_Functions != NULL)
	{
		for(int i = 0; i < POVFPU_FunctionCnt; i++)
		{
			if(POVFPU_Functions[i].reference_count > 0) // ignore the reference count [trf]
			{
				SYS_DELETE_FUNCTION(&(POVFPU_Functions[i]));
				FNCode_Delete(&(POVFPU_Functions[i].fn));
				POVFPU_Functions[i].reference_count = 0;
			}
		}
		POV_FREE(POVFPU_Functions);
		POVFPU_Functions = NULL;
		POVFPU_FunctionCnt = 0;
	}

	while(POVFPU_Context_Root != NULL)
	{
		POV_FREE(POVFPU_Context_Root->dblstackbase);
		POV_FREE(POVFPU_Context_Root->pstackbase);
		POVFPU_Current_Context = POVFPU_Context_Root;
		POVFPU_Context_Root = POVFPU_Context_Root->next;
		POV_FREE(POVFPU_Current_Context);
	}

	POVFPU_Current_Context = POVFPU_NewContext();
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_SetLocal
*
* INPUT
*
*   k - stack offset
*   v - floating-point value
*   
* OUTPUT
*   
* RETURNS
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Set a floating-point value on the stack position. Grow the stack if
*   necessary.
*
* CHANGES
*
*   -
*
******************************************************************************/

void POVFPU_SetLocal(unsigned int k, DBL v)
{
	if(k >= POVFPU_Current_Context->maxdblstacksize)
	{
		#if (SYS_FUNCTIONS == 1)
		unsigned long diff = ((unsigned long)(POVFPU_Current_Context->dblstack)) - ((unsigned long)(POVFPU_Current_Context->dblstackbase));
		#endif

		POVFPU_Current_Context->maxdblstacksize = max(k + 1, (unsigned int)256);
		POVFPU_Current_Context->dblstackbase = (DBL *)POV_REALLOC(POVFPU_Current_Context->dblstackbase, sizeof(DBL) * POVFPU_Current_Context->maxdblstacksize, "fn: stack");

		#if (SYS_FUNCTIONS == 1)
		POVFPU_Current_Context->dblstack = (DBL *)(((unsigned long)(POVFPU_Current_Context->dblstackbase)) + diff);
		#endif
	}

	POVFPU_Current_Context->dblstackbase[k] = v;
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_GetLocal
*
* INPUT
*
*   k - stack offset
*   
* OUTPUT
*   
* RETURNS
*
*   DBL value at stack position k
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Get a floating-point value from the stack position.
*
* CHANGES
*
*   -
*
******************************************************************************/

DBL POVFPU_GetLocal(unsigned int k)
{
	if(k >= POVFPU_Current_Context->maxdblstacksize)
		return 0.0;

	return POVFPU_Current_Context->dblstackbase[k];
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_SetGlobal
*
* INPUT
*
*   k - global variable reference number
*   v - floating-point number
*   
* OUTPUT
*   
* RETURNS
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Set the global variable's value.
*
* CHANGES
*
*   -
*
******************************************************************************/

void POVFPU_SetGlobal(unsigned int k, DBL v)
{
	if(POVFPU_Globals == NULL)
	{
		POVFPU_GlobalCnt = k + 1;
		POVFPU_Globals = (DBL *)POV_MALLOC(sizeof(DBL) * POVFPU_GlobalCnt, "fn: globals");
	}
	else if(POVFPU_GlobalCnt < k + 1)
	{
		POVFPU_GlobalCnt = k + 1;
		POVFPU_Globals = (DBL *)POV_REALLOC(POVFPU_Globals, sizeof(DBL) * POVFPU_GlobalCnt, "fn: globals");
	}

	POVFPU_Globals[k] = v;
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_GetGlobal
*
* INPUT
*
*   k - global variable reference number
*   
* OUTPUT
*   
* RETURNS
*
*   DBL value of global variable k
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Get the global variable's value.
*
* CHANGES
*
*   -
*
******************************************************************************/

DBL POVFPU_GetGlobal(unsigned int k)
{
	if(k >= POVFPU_GlobalCnt)
		return 0.0;

	return POVFPU_Globals[k];
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_GetFunction
*
* INPUT
*
*   k - function reference number
*   
* OUTPUT
*   
* RETURNS
*
*   FunctionCode - pointer to function code
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Access the FunctionCode of a function by its reference number.
*
* CHANGES
*
*   -
*
******************************************************************************/

FunctionCode *POVFPU_GetFunction(FUNCTION k)
{
	if(k >= POVFPU_FunctionCnt)
		Error("Unknown user defined function.");

	return &(POVFPU_Functions[k].fn);
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_GetFunctionAndReference
*
* INPUT
*
*   k - function reference number
*   
* OUTPUT
*   
* RETURNS
*
*   FunctionCode - pointer to function code
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Access the FunctionCode of a function by its reference number and
*	increase the function reference count by 1.
*
* CHANGES
*
*   -
*
******************************************************************************/

FunctionCode *POVFPU_GetFunctionAndReference(FUNCTION k)
{
	if(k >= POVFPU_FunctionCnt)
		Error("Unknown user defined function.");

	POVFPU_Functions[k].reference_count++;

	return &(POVFPU_Functions[k].fn);
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_AddConstant
*
* INPUT
*
*   v - floating-point constant value
*   
* OUTPUT
*   
* RETURNS
*
*   unsigned int - floating-point constant reference number
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Add a floating-point constant to the table of constants.
*
* CHANGES
*
*   -
*
******************************************************************************/

FUNCTION POVFPU_AddConstant(DBL v)
{
	unsigned int i;

	if(POVFPU_Consts == NULL)
	{
		POVFPU_Consts = (DBL *)POV_MALLOC(sizeof(DBL), "fn: constant floats");
		POVFPU_Consts[0] = v;
		POVFPU_ConstCnt = 1;
		return 0;
	}

	for(i = 0; i < POVFPU_ConstCnt; i++)
	{
		if(POVFPU_Consts[i] == v)
			return (unsigned int)i;
	}

	if(POVFPU_ConstCnt == MAX_K)
		Error("More than %d constants in all functions are not supported.", (int)MAX_K);

	POVFPU_ConstCnt++;
	POVFPU_Consts = (DBL *)POV_REALLOC(POVFPU_Consts, sizeof(DBL) * POVFPU_ConstCnt, "fn: constant floats");
	POVFPU_Consts[POVFPU_ConstCnt - 1] = v;

	return POVFPU_ConstCnt - 1;
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_AddFunction
*
* INPUT
*
*   f - function to work on
*   
* OUTPUT
*   
* RETURNS
*
*   unsigned int - function reference number
*   
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Add a function to the virtual machine memory.  Note that using
*   POV_REALLOC here is very inefficient, but functions have to be
*   stored in one array for fastest access!
*
* CHANGES
*
*   -
*
******************************************************************************/

FUNCTION POVFPU_AddFunction(FunctionCode *f)
{
	FUNCTION fn = 0;

	if(POVFPU_Functions == NULL)
	{
		POVFPU_Functions = (FunctionEntry *)POV_MALLOC(sizeof(FunctionEntry), "fn: FunctionEntry");
		POVFPU_Functions[0].fn = *f;
		POVFPU_Functions[0].reference_count = 1;
		SYS_ADD_FUNCTION(fn);
		POVFPU_FunctionCnt = 1;

		return 0;
	}

	if(POVFPU_FunctionCnt == MAX_FN)
	{
		for(fn = 0; fn < MAX_FN; fn++)
		{
			if(POVFPU_Functions[fn].reference_count == 0)
				break;
		}

		if(fn == MAX_K)
			Error("Maximum number (%d) of functions per scene reached.", MAX_FN);
	}
	else
	{
		fn = POVFPU_FunctionCnt;
		POVFPU_FunctionCnt++;
	}

	POVFPU_Functions = (FunctionEntry *)POV_REALLOC(POVFPU_Functions, sizeof(FunctionEntry) * POVFPU_FunctionCnt, "fn: FunctionEntry");
	POVFPU_Functions[fn].fn = *f;
	POVFPU_Functions[fn].reference_count = 1;
	SYS_ADD_FUNCTION(fn);

	return fn;
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_RemoveFunction
*
* INPUT
*
*   fn - function reference number
*   
* OUTPUT
*   
* RETURNS
*   
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Removes a function from the virtual machine memory.  It also removes
*	all functions that are no longer used.
*
* CHANGES
*
*   -
*
******************************************************************************/

void POVFPU_RemoveFunction(FUNCTION fn)
{
	if((POVFPU_Functions == NULL) || (fn >= POVFPU_FunctionCnt))
		return;

	if(POVFPU_Functions[fn].reference_count > 0) // necessary to prevent any recursion
	{
		POVFPU_Functions[fn].reference_count--;

		if(POVFPU_Functions[fn].reference_count == 0)
		{
			// The copying is necessary because recursive POVFPU_RemoveFunction
			// calls may shrink the POVFPU_Functions array and remove the data
			// before we are done with it here! [trf]
			FunctionEntry f = POVFPU_Functions[fn];
			unsigned int i = 0;

			SYS_DELETE_FUNCTION(&f);
			for(i = 0; i < f.fn.program_size; i++)
			{
				if(GET_OP(f.fn.program[i]) == OPCODE_CALL)
					POVFPU_RemoveFunction(GET_K(f.fn.program[i]));
			}
			FNCode_Delete(&(f.fn));

			for(i = POVFPU_FunctionCnt - 1; i > 0; i--)
			{
				if(POVFPU_Functions[i].reference_count == 0)
					POVFPU_FunctionCnt--;
				else
					break;
			}

			if(POVFPU_FunctionCnt == 0)
			{
				POV_FREE(POVFPU_Functions);
				POVFPU_Functions = NULL;
			}
			else
				POVFPU_Functions = (FunctionEntry *)POV_REALLOC(POVFPU_Functions, sizeof(FunctionEntry) * POVFPU_FunctionCnt, "fn: FunctionEntry");
		}
	}
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_Exception
*
* INPUT
*
*   fn - function reference number
*   
* OUTPUT
*   
* RETURNS
*   
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Shows a floating-point exception error message.
*
* CHANGES
*
*   -
*
******************************************************************************/

void POVFPU_Exception(FUNCTION fn, const char *msg)
{
	if(POVFPU_Functions[fn].fn.name != NULL)
	{
		if(msg != NULL)
			ErrorAt(POVFPU_Functions[fn].fn.filename, POVFPU_Functions[fn].fn.filepos.lineno, POVFPU_Functions[fn].fn.filepos.offset,
			        "Runtime error detected in function '%s'. %s", POVFPU_Functions[fn].fn.name, msg);
		else
			ErrorAt(POVFPU_Functions[fn].fn.filename, POVFPU_Functions[fn].fn.filepos.lineno, POVFPU_Functions[fn].fn.filepos.offset,
			        "Floating-point exception detected in function '%s'. "
			        "Your function either attempted a division by zero, used a function outside its "
			        "domain or called an internal function with invalid parameters.",
			        POVFPU_Functions[fn].fn.name);
	}
	else
	{
		if(msg != NULL)
			ErrorAt(POVFPU_Functions[fn].fn.filename, POVFPU_Functions[fn].fn.filepos.lineno, POVFPU_Functions[fn].fn.filepos.offset,
			        "Runtime error detected in function. %s", msg);
		else
			ErrorAt(POVFPU_Functions[fn].fn.filename, POVFPU_Functions[fn].fn.filepos.lineno, POVFPU_Functions[fn].fn.filepos.offset,
			        "Floating-point exception detected in unnamed function. "
			        "Your function either attempted a division by zero, used a function outside its "
			        "domain or called an internal function with invalid parameters.");
	}
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_NewContext
*
* INPUT
*   
* OUTPUT
*   
* RETURNS
*
*   FPUContext - the created context
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Create a new context.
*
* CHANGES
*
*   -
*
******************************************************************************/

FPUContext *POVFPU_NewContext()
{
	FPUContext *context = (FPUContext *)POV_MALLOC(sizeof(FPUContext), "fn: context");

	context->next = POVFPU_Context_Root;
	context->maxdblstacksize = 256;
	context->dblstackbase = (DBL *)POV_MALLOC(sizeof(DBL) * context->maxdblstacksize, "fn: dblstack");
	context->pstackbase = (StackFrame *)POV_MALLOC(sizeof(StackFrame) * MAX_CALL_STACK_SIZE, "fn: pstack");

	#if (SYS_FUNCTIONS == 1)
	context->dblstack = context->dblstackbase;
	#endif

	POVFPU_Context_Root = context;

	return context;
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_SwitchContext
*
* INPUT
*
*   context - the context to switch to
*   
* OUTPUT
*   
* RETURNS
*
*   FPUContext - the previous context
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Switch the context.  Allows to make recursive calls to POVFPU_Run from
*   within internal functions.
*
* CHANGES
*
*   -
*
******************************************************************************/

FPUContext *POVFPU_SwitchContext(FPUContext *context)
{
	FPUContext *previous = POVFPU_Current_Context;

	POVFPU_Current_Context = context;

	return previous;
}


/*****************************************************************************
*
* FUNCTION
*
*   POVFPU_RunDefault
*
* INPUT
*
*   fn - function reference number
*   
* OUTPUT
*   
* RETURNS
*
*   DBL - result found in R0
*
* AUTHOR
*
*   Thorsten Froehlich
*   
* DESCRIPTION
*
*   Execute a compiled function.
*
* CHANGES
*
*   -
*
******************************************************************************/

DBL POVFPU_RunDefault(FUNCTION fn)
{
	StackFrame *pstack = POVFPU_Current_Context->pstackbase;
	DBL *dblstack = POVFPU_Current_Context->dblstackbase;
	unsigned int maxdblstacksize = POVFPU_Current_Context->maxdblstacksize;
	DBL r0, r1, r2, r3, r4, r5, r6, r7;
	Instruction *program = NULL;
	unsigned int k = 0;
	unsigned int pc = 0;
	unsigned int ccr = 0;
	unsigned int sp = 0;
	unsigned int psp = 0;

#if (SUPPORT_INTEGER_INSTRUCTIONS == 1)
	POV_LONG iA, iB, itemp;
#endif

#if (DEBUG_DEFAULTCPU == 1)
	COUNTER instr;
	Long_To_Counter(POVFPU_Functions[fn].fn.program_size, instr);
	Add_Counter(stats[Ray_Function_VM_Instruction_Est], stats[Ray_Function_VM_Instruction_Est], instr);
#endif

	Increase_Counter(stats[Ray_Function_VM_Calls]);

	program = POVFPU_Functions[fn].fn.program;

	while(true)
	{
		k = GET_K(program[pc]);
		switch(GET_OP(program[pc]))
		{
			OP_MATH_AOP(0,+);           // add   Rs, Rd
			OP_MATH_AOP(1,-);           // sub   Rs, Rd
			OP_MATH_AOP(2,*);           // mul   Rs, Rd
			OP_MATH_AOP(3,/);           // div   Rs, Rd
			OP_MOD_A(4);                // mod   Rs, Rd

			OP_ASSIGN_ABOP(5,0,r0);     // move  R0, Rd
			OP_ASSIGN_ABOP(5,1,r1);     // move  R1, Rd
			OP_ASSIGN_ABOP(5,2,r2);     // move  R2, Rd
			OP_ASSIGN_ABOP(5,3,r3);     // move  R3, Rd
			OP_ASSIGN_ABOP(5,4,r4);     // move  R4, Rd
			OP_ASSIGN_ABOP(5,5,r5);     // move  R5, Rd
			OP_ASSIGN_ABOP(5,6,r6);     // move  R6, Rd
			OP_ASSIGN_ABOP(5,7,r7);     // move  R7, Rd

			OP_CMP_ABC(6,0,r0);         // cmp   R0, Rd
			OP_CMP_ABC(6,1,r1);         // cmp   R1, Rd
			OP_CMP_ABC(6,2,r2);         // cmp   R2, Rd
			OP_CMP_ABC(6,3,r3);         // cmp   R3, Rd
			OP_CMP_ABC(6,4,r4);         // cmp   R4, Rd
			OP_CMP_ABC(6,5,r5);         // cmp   R5, Rd
			OP_CMP_ABC(6,6,r6);         // cmp   R6, Rd
			OP_CMP_ABC(6,7,r7);         // cmp   R7, Rd

			OP_ASSIGN_ABOP(7,0,-r0);    // neg   R0, Rd
			OP_ASSIGN_ABOP(7,1,-r1);    // neg   R1, Rd
			OP_ASSIGN_ABOP(7,2,-r2);    // neg   R2, Rd
			OP_ASSIGN_ABOP(7,3,-r3);    // neg   R3, Rd
			OP_ASSIGN_ABOP(7,4,-r4);    // neg   R4, Rd
			OP_ASSIGN_ABOP(7,5,-r5);    // neg   R5, Rd
			OP_ASSIGN_ABOP(7,6,-r6);    // neg   R6, Rd
			OP_ASSIGN_ABOP(7,7,-r7);    // neg   R7, Rd

			OP_ABS_A(8);                // abs   Rs, Rd

			OP_MATH_ABCOP(9,0,POVFPU_Consts[k],+);      // addi  k, Rd
			OP_MATH_ABCOP(9,1,POVFPU_Consts[k],-);      // subi  k, Rd
			OP_MATH_ABCOP(9,2,POVFPU_Consts[k],*);      // muli  k, Rd
			OP_MATH_ABCOP(9,3,POVFPU_Consts[k],/);      // divi  k, Rd
			OP_MOD_ABC(9,4,POVFPU_Consts[k]);           // modi  k, Rd
			OP_ASSIGN_ABOP(9,5,POVFPU_Consts[k]);       // loadi k, Rd

			OP_CMP_ABC(9,6,POVFPU_Consts[k]);           // cmpi  k, Rs

			OP_ASSIGN_ABOP(10,0,ccr == 1);              // seq   Rd
			OP_ASSIGN_ABOP(10,1,ccr != 1);              // sne   Rd
			OP_ASSIGN_ABOP(10,2,ccr == 2);              // slt   Rd
			OP_ASSIGN_ABOP(10,3,ccr >= 1);              // sle   Rd
			OP_ASSIGN_ABOP(10,4,ccr == 0);              // sgt   Rd
			OP_ASSIGN_ABOP(10,5,ccr <= 1);              // sge   Rd
			OP_MATH_ABCOP(10,6,0.0,==);                 // teq   Rd
			OP_MATH_ABCOP(10,7,0.0,!=);                 // tne   Rd

			OP_ASSIGN_ABOP(11,0,POVFPU_Globals[k]);     // load  0(k), Rd
			OP_ASSIGN_ABOP(11,1,dblstack[sp+k]);        // load  SP(k), Rd

			OP_REVASSIGN_ABOP(12,0,POVFPU_Globals[k]);  // store Rs, 0(k)
			OP_REVASSIGN_ABOP(12,1,dblstack[sp+k]);     // store Rs, SP(k)

			OP_SPECIAL(13,0,0,if(ccr == 1) pc = k - 1); // beq   k
			OP_SPECIAL(13,1,0,if(ccr != 1) pc = k - 1); // bne   k
			OP_SPECIAL(13,2,0,if(ccr == 2) pc = k - 1); // blt   k
			OP_SPECIAL(13,3,0,if(ccr >= 1) pc = k - 1); // ble   k
			OP_SPECIAL(13,4,0,if(ccr == 0) pc = k - 1); // bgt   k
			OP_SPECIAL(13,5,0,if(ccr <= 1) pc = k - 1); // bge   k

			OP_XCC_ABOP(14,0,==);                       // xeq   Rd
			OP_XCC_ABOP(14,1,!=);                       // xne   Rd
			OP_XCC_ABOP(14,2,<);                        // xlt   Rd
			OP_XCC_ABOP(14,3,<=);                       // xle   Rd
			OP_XCC_ABOP(14,4,>);                        // xgt   Rd
			OP_XCC_ABOP(14,5,>=);                       // xge   Rd

			OP_SPECIAL(14,6,0,if((r0 == 0.0) && (r0 == 0.0)) POVFPU_Exception(fn)); // xdz   R0, R0
			OP_SPECIAL(14,6,1,if((r0 == 0.0) && (r1 == 0.0)) POVFPU_Exception(fn)); // xdz   R0, R1
			OP_SPECIAL(14,6,2,if((r0 == 0.0) && (r2 == 0.0)) POVFPU_Exception(fn)); // xdz   R0, R2
			OP_SPECIAL(14,6,3,if((r0 == 0.0) && (r3 == 0.0)) POVFPU_Exception(fn)); // xdz   R0, R3
			OP_SPECIAL(14,6,4,if((r0 == 0.0) && (r4 == 0.0)) POVFPU_Exception(fn)); // xdz   R0, R4
			OP_SPECIAL(14,6,5,if((r0 == 0.0) && (r5 == 0.0)) POVFPU_Exception(fn)); // xdz   R0, R5
			OP_SPECIAL(14,6,6,if((r0 == 0.0) && (r6 == 0.0)) POVFPU_Exception(fn)); // xdz   R0, R6
			OP_SPECIAL(14,6,7,if((r0 == 0.0) && (r7 == 0.0)) POVFPU_Exception(fn)); // xdz   R0, R7

			OP_SPECIAL_CASE(15,0,0)                     // jsr   k
				pstack[psp].pc = pc;
				pstack[psp].fn = fn;
				psp++;
				if(psp >= MAX_CALL_STACK_SIZE)
					POVFPU_Exception(fn, "Maximum function evaluation recursion level reached.");
				pc = k;
				continue; // prevent increment of pc
			OP_SPECIAL_CASE(15,0,1)                     // jmp   k
				pc = k;
				continue; // prevent increment of pc
			OP_SPECIAL_CASE(15,0,2)                     // rts
				if(psp == 0)
					return r0;
				psp--;
				pc = pstack[psp].pc; // old position, will be incremented
				fn = pstack[psp].fn;
				program = POVFPU_Functions[fn].fn.program;
				break;
			OP_SPECIAL_CASE(15,0,3)                     // call  k
				pstack[psp].pc = pc;
				pstack[psp].fn = fn;
				psp++;
				if(psp >= MAX_CALL_STACK_SIZE)
					POVFPU_Exception(fn, "Maximum function evaluation recursion level reached.");
				fn = k;
				program = POVFPU_Functions[fn].fn.program;
				pc = 0;
				continue; // prevent increment of pc

			OP_SPECIAL_CASE(15,0,4)                     // sys1  k
				r0 = POVFPU_Sys1Table[k](r0);
				break;
			OP_SPECIAL_CASE(15,0,5)                     // sys2  k
				r0 = POVFPU_Sys2Table[k](r0,r1);
				break;
			OP_SPECIAL_CASE(15,0,6)                     // trap  k
				r0 = POVFPU_TrapTable[k].fn(&dblstack[sp], fn);
				maxdblstacksize = POVFPU_Current_Context->maxdblstacksize;
				dblstack = POVFPU_Current_Context->dblstackbase;
				break;
			OP_SPECIAL_CASE(15,0,7)                     // traps k
				POVFPU_TrapSTable[k].fn(&dblstack[sp], fn, sp);
				maxdblstacksize = POVFPU_Current_Context->maxdblstacksize;
				dblstack = POVFPU_Current_Context->dblstackbase;
				break;

			OP_SPECIAL_CASE(15,1,0)                     // grow  k
				if((unsigned int)((unsigned int)sp + (unsigned int)k) >= (unsigned int)MAX_K)
				{
					POVFPU_Exception(fn, "Stack full. Possible infinite recursive function call.");
				}
				else if(sp + k >= maxdblstacksize)
				{
					maxdblstacksize = POVFPU_Current_Context->maxdblstacksize = POVFPU_Current_Context->maxdblstacksize + max(k + 1, (unsigned int)256);
					dblstack = POVFPU_Current_Context->dblstackbase = (DBL *)POV_REALLOC(dblstack, sizeof(DBL) * maxdblstacksize, "fn: stack");
				}
				break;
			OP_SPECIAL_CASE(15,1,1)                     // push  k
				if(sp + k >= maxdblstacksize)
					POVFPU_Exception(fn, "Function evaluation stack overflow.");
				sp += k;
				break;
			OP_SPECIAL_CASE(15,1,2)                     // pop   k
				if(k > sp)
					POVFPU_Exception(fn, "Function evaluation stack underflow.");
				sp -= k;
				break;
#if (SUPPORT_INTEGER_INSTRUCTIONS == 1)
			OP_SPECIAL_CASE(15,1,3)                     // iconv
				iA = POV_LONG(r0);
				break;
			OP_SPECIAL_CASE(15,1,4)                     // fconv
				r0 = DBL(iA);
				break;

			OP_SPECIAL_CASE(15,1,5)                     // reserved
				POVFPU_Exception(fn, "Internal error - reserved function VM opcode found!");
				break;

			OP_INT_MATH_ABOP(15,32,+);                  // add   s, d
			OP_INT_MATH_ABOP(15,33,-);                  // sub   s, d
			OP_INT_MATH_ABOP(15,34,*);                  // mul   s, d
			OP_INT_SPECIAL(15,35,0,iA = iA / iB);       // div   B, A
			OP_INT_SPECIAL(15,35,1,iB = iB / iA);       // div   A, B
			OP_INT_SPECIAL(15,35,2,iA = iA % iB);       // mod   B, A
			OP_INT_SPECIAL(15,35,3,iB = iB % iA);       // mod   A, B

			OP_INT_SPECIAL(15,36,0,ccr = (((iB > iA) & 1) << 1) | ((iB == iA) & 1)); // cmp   B, A
			OP_INT_SPECIAL(15,36,1,ccr = (((iA > iB) & 1) << 1) | ((iA == iB) & 1)); // cmp   A, B

			OP_INT_SPECIAL(15,36,2,itemp = iA; iA = iB; iB = itemp); // exg   A, B

			OP_INT_SPECIAL(15,36,3,iA = iB = 0);        // clr   A, B
			OP_INT_SPECIAL(15,37,0,iA = 0);             // clr   A
			OP_INT_SPECIAL(15,37,1,iB = 0);             // clr   B

			OP_INT_SPECIAL(15,37,2,iA = iB);            // move  B, A
			OP_INT_SPECIAL(15,37,3,iB = iA);            // move  A, B

			OP_INT_SPECIAL(15,38,0,iA = -iA);           // neg   A
			OP_INT_SPECIAL(15,38,1,iB = -iB);           // neg   B

			OP_INT_SPECIAL(15,38,2,iA = abs(iA));       // abs   A
			OP_INT_SPECIAL(15,38,3,iB = abs(iB));       // abs   B

			OP_INT_SPECIAL(15,39,0,iA = iA + k);        // addi  k, A
			OP_INT_SPECIAL(15,39,1,iB = iB + k);        // addi  k, B
			OP_INT_SPECIAL(15,39,2,iA = iA - k);        // subi  k, A
			OP_INT_SPECIAL(15,39,3,iB = iB - k);        // subi  k, B

			OP_INT_MATH_SHIFT_ABOP(15,40,<<,POV_LONG);     // asl   s, d
			OP_INT_MATH_SHIFT_ABOP(15,41,>>,POV_LONG);     // asr   s, d
			OP_INT_MATH_SHIFT_ABOP(15,42,<<,POV_ULONG);    // lsl   s, d
			OP_INT_MATH_SHIFT_ABOP(15,43,>>,POV_ULONG);    // lsr   s, d

			OP_INT_MATH_ABOP(15,44,&);                  // and   s, d
			OP_INT_MATH_ABOP(15,45,|);                  // or    s, d
			OP_INT_MATH_ABOP(15,46,^);                  // xor   s, d
			OP_INT_SPECIAL(15,47,0,iA = !iA);           // not   A, A
			OP_INT_SPECIAL(15,47,1,iA = !iB);           // not   B, A
			OP_INT_SPECIAL(15,47,2,iB = !iA);           // not   A, B
			OP_INT_SPECIAL(15,47,3,iB = !iB);           // not   B, B

			OP_INT_SPECIAL(15,48,0,iA = k);             // loadi A
			OP_INT_SPECIAL(15,48,1,iB = k);             // loadi B
			OP_INT_SPECIAL(15,48,2,iA = (iA << 16) | k);// ldhi  A
			OP_INT_SPECIAL(15,48,3,iB = (iB << 16) | k);// ldhi  B

			OP_INT_SPECIAL(15,49,0,iA = max(POV_LONG(k), iA)); // max   k, A
			OP_INT_SPECIAL(15,49,1,iB = max(POV_LONG(k), iB)); // max   k, B
			OP_INT_SPECIAL(15,49,2,iA = min(POV_LONG(k), iA)); // min   k, A
			OP_INT_SPECIAL(15,49,3,iB = min(POV_LONG(k), iB)); // min   k, B

			OP_INT_SPECIAL(15,50,0,iA = (POV_LONG(iA) << k));  // asl   k, A
			OP_INT_SPECIAL(15,50,1,iB = (POV_LONG(iB) >> k));  // asr   k, B
			OP_INT_SPECIAL(15,50,2,iA = (POV_ULONG(iA) << k)); // lsl   k, A
			OP_INT_SPECIAL(15,50,3,iB = (POV_ULONG(iB) >> k)); // lsr   k, B
#endif
			default:                                    // nop
				break;
		}

		pc++;
	}

#if (DEBUG_DEFAULTCPU == 1)
	printf("Registers\n");
	printf("=========\n");
	printf("PC = %d\n", (int)pc);
	printf("CCR = %x\n", (int)ccr);
	printf("R0 = %8f   R4 = %8f\n", (float)r0, (float)r4);
	printf("R1 = %8f   R5 = %8f\n", (float)r1, (float)r5);
	printf("R2 = %8f   R6 = %8f\n", (float)r2, (float)r6);
	printf("R3 = %8f   R7 = %8f\n", (float)r3, (float)r7);
#endif
}

END_POV_NAMESPACE
