/*=========================================================================

  Program:   KWSys - Kitware System Library
  Module:    $RCSfile: System.h.in,v $

  Copyright (c) Kitware, Inc., Insight Consortium.  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notices for more information.

=========================================================================*/
#ifndef cmsys_System_h
#define cmsys_System_h

#include <cmsys/Configure.h>

/* Redefine all public interface symbol names to be in the proper
   namespace.  These macros are used internally to kwsys only, and are
   not visible to user code.  Use kwsysHeaderDump.pl to reproduce
   these macros after making changes to the interface.  */
#if !defined(KWSYS_NAMESPACE)
# define kwsys_ns(x) cmsys##x
# define kwsysEXPORT cmsys_EXPORT
#endif
#define kwsysSystem_Shell_GetArgumentForWindows      kwsys_ns(System_Shell_GetArgumentForWindows)
#define kwsysSystem_Shell_GetArgumentForUnix         kwsys_ns(System_Shell_GetArgumentForUnix)
#define kwsysSystem_Shell_GetArgumentSizeForWindows  kwsys_ns(System_Shell_GetArgumentSizeForWindows)
#define kwsysSystem_Shell_GetArgumentSizeForUnix     kwsys_ns(System_Shell_GetArgumentSizeForUnix)
#define kwsysSystem_Shell_Flag_e                     kwsys_ns(System_Shell_Flag_e)
#define kwsysSystem_Shell_Flag_Make                  kwsys_ns(System_Shell_Flag_Make)
#define kwsysSystem_Shell_Flag_VSIDE                 kwsys_ns(System_Shell_Flag_VSIDE)
#define kwsysSystem_Shell_Flag_EchoWindows           kwsys_ns(System_Shell_Flag_EchoWindows)
#define kwsysSystem_Shell_Flag_WatcomWMake           kwsys_ns(System_Shell_Flag_WatcomWMake)
#define kwsysSystem_Shell_Flag_MinGWMake             kwsys_ns(System_Shell_Flag_MinGWMake)
#define kwsysSystem_Shell_Flag_NMake                 kwsys_ns(System_Shell_Flag_NMake)
#define kwsysSystem_Shell_Flag_AllowMakeVariables    kwsys_ns(System_Shell_Flag_AllowMakeVariables)

#if defined(__cplusplus)
extern "C"
{
#endif

/**
 * Transform the given command line argument for use in a Windows or
 * Unix shell.  Returns a pointer to the end of the command line
 * argument in the provided output buffer.  Flags may be passed to
 * modify the generated quoting and escape sequences to work under
 * alternative environments.
 */
kwsysEXPORT char* kwsysSystem_Shell_GetArgumentForWindows(const char* in,
                                                          char* out,
                                                          int flags);
kwsysEXPORT char* kwsysSystem_Shell_GetArgumentForUnix(const char* in,
                                                       char* out,
                                                       int flags);

/**
 * Compute the size of the buffer required to store the output from
 * kwsysSystem_Shell_GetArgumentForWindows or
 * kwsysSystem_Shell_GetArgumentForUnix.  The flags passed must be
 * identical between the two calls.
 */
kwsysEXPORT int kwsysSystem_Shell_GetArgumentSizeForWindows(const char* in,
                                                            int flags);
kwsysEXPORT int kwsysSystem_Shell_GetArgumentSizeForUnix(const char* in,
                                                         int flags);

/**
 * Flags to pass to kwsysSystem_Shell_GetArgumentForWindows or
 * kwsysSystem_Shell_GetArgumentForUnix.  These modify the generated
 * quoting and escape sequences to work under alternative
 * environments.
 */
enum kwsysSystem_Shell_Flag_e
{
  /** The target shell is in a makefile.  */
  kwsysSystem_Shell_Flag_Make               = (1<<0),

  /** The target shell is in a VS project file.  Do not use with
      Shell_Flag_Make.  */
  kwsysSystem_Shell_Flag_VSIDE              = (1<<1),

  /** In a windows shell the argument is being passed to "echo".  */
  kwsysSystem_Shell_Flag_EchoWindows        = (1<<2),

  /** The target shell is in a Watcom WMake makefile.  */
  kwsysSystem_Shell_Flag_WatcomWMake        = (1<<3),

  /** The target shell is in a MinGW Make makefile.  */
  kwsysSystem_Shell_Flag_MinGWMake          = (1<<4),

  /** The target shell is in a NMake makefile.  */
  kwsysSystem_Shell_Flag_NMake              = (1<<6),

  /** Make variable reference syntax $(MAKEVAR) should not be escaped
      to allow a build tool to replace it.  Replacement values
      containing spaces, quotes, backslashes, or other
      non-alphanumeric characters that have significance to some makes
      or shells produce undefined behavior.  */
  kwsysSystem_Shell_Flag_AllowMakeVariables = (1<<5)
};

#if defined(__cplusplus)
} /* extern "C" */
#endif

/* If we are building a kwsys .c or .cxx file, let it use these macros.
   Otherwise, undefine them to keep the namespace clean.  */
#if !defined(KWSYS_NAMESPACE)
# undef kwsys_ns
# undef kwsysEXPORT
# undef kwsysSystem_Shell_GetArgumentForWindows
# undef kwsysSystem_Shell_GetArgumentForUnix
# undef kwsysSystem_Shell_GetArgumentSizeForWindows
# undef kwsysSystem_Shell_GetArgumentSizeForUnix
# undef kwsysSystem_Shell_Flag_e
# undef kwsysSystem_Shell_Flag_Make
# undef kwsysSystem_Shell_Flag_VSIDE
# undef kwsysSystem_Shell_Flag_EchoWindows
# undef kwsysSystem_Shell_Flag_WatcomWMake
# undef kwsysSystem_Shell_Flag_MinGWMake
# undef kwsysSystem_Shell_Flag_NMake
# undef kwsysSystem_Shell_Flag_AllowMakeVariables
#endif

#endif
