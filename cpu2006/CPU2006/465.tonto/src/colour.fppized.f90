!---------------------------------------------------------------------
!
! COLOUR:
!
! For converting standard colour names into RGB triples, and vice-versa.
!
! Copyright (C) Dylan Jayatilaka, June 2002
!
! This library is free software; you can redistribute it and/or
! modify it under the terms of the GNU Library General Public
! License as published by the Free Software Foundation; either
! version 2 of the License, or (at your option) any later version.
!
! This library is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
! Library General Public License for more details.
!
! You should have received a copy of the GNU Library General Public
! License along with this library; if not, write to the
! Free Software Foundation, Inc., 59 Temple Place - Suite 330,
! Boston, MA  02111-1307, USA.
!
! $Id: colour.foo,v 1.2.2.5 2003/11/13 05:34:39 reaper Exp $
!
!---------------------------------------------------------------------

module COLOUR_MODULE

   use TYPES_MODULE
   use SYSTEM_MODULE

   use TEXTFILE_MODULE, only: stdin
   use TEXTFILE_MODULE, only: stdout
   use TEXTFILE_MODULE, only: next_str_
   use TEXTFILE_MODULE, only: read_
   use TEXTFILE_MODULE, only: next_item_

   use STR_MODULE, only: is_int_
   use STR_MODULE, only: to_lower_case_
   use STR_MODULE, only: to_real_
   use STR_MODULE, only: to_int_
   use STR_MODULE, only: is_a_true_int_
   use STR_MODULE, only: is_real_

   use INTMAT_MODULE, only: column_norms_
   implicit none

! Macros file
! $Id: macros,v 1.37.2.11 2003/10/14 02:28:29 reaper Exp $

!----------------------------------------------------------------------
! Kind parameters for value types
!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Size parameters for value types
!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Value types ...
!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Memory/Call stack management macros ...
! These define STACK, CHECK, as well as ENSURE, DIE and WARN ...
!----------------------------------------------------------------------

!----------------------------------------------------------------------
! Precondition and Postcodition macros ...
! These define ENSURE as well as DIE and WARN ...
!----------------------------------------------------------------------

!----------------------------------------------------------------------
! Error macros ...
! These define only DIE and WARN ...
!----------------------------------------------------------------------

!####   define pure
!####   define elemental
!----------------------------------------------------------------------
! Profiling macros ...
! These define START_TIMER, STOP_TIMER ...
!----------------------------------------------------------------------

!-------------------------------------------------------------------------------
! Some compilers cannot handle Fortran 95 features ...
!-------------------------------------------------------------------------------

!-------------------------------------------------------------------------------
! Some Fortran 95 compilers can't handle pure routines ...
!-------------------------------------------------------------------------------

!-------------------------------------------------------------------------------
! Some Fortran 95 compilers can't handle default initialisation properly ...
!-------------------------------------------------------------------------------

!----------------------------------------------------------------------
! Convenience macros ...
!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Fundamental constants and conversion factors ...
!----------------------------------------------------------------------

!----------------------------------------------------------------------
! Program constants ...
! The first word identifies the module to which the constant belongs
!----------------------------------------------------------------------

!----------------------------------------------------------------------
! Program default input orders for vectors of derived type
! The first word identifies the module to which the constant belongs
!----------------------------------------------------------------------

!----------------------------------------------------------------------
! Derived non-array types ... (in alphabetical order)
!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Parameterised abstract array types ...
!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Derived array types ...
!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Type sizes ...
!----------------------------------------------------------------------
   private

   public    nearest_colourname_for_
   interface nearest_colourname_for_
      module procedure nearest_colourname_for
   end interface

   public    read_RGB255_
   interface read_RGB255_
      module procedure read_RGB255
   end interface

   public    set_
   interface set_
      module procedure set
      module procedure set_1
   end interface

   public    index_of_colourname_
   interface index_of_colourname_
      module procedure index_of_colourname
      module procedure index_of_colourname_1
   end interface

   public    read_RGB_
   interface read_RGB_
      module procedure read_RGB
   end interface

   public    is_a_known_colourname_
   interface is_a_known_colourname_
      module procedure is_a_known_colourname
      module procedure is_a_known_colourname_1
   end interface

   public    read_
   interface read_
      module procedure read
   end interface

   public    read_name_
   interface read_name_
      module procedure read_name
   end interface

   public    is_a_valid_RGB255_
   interface is_a_valid_RGB255_
      module procedure is_a_valid_RGB255
      module procedure is_a_valid_RGB255_1
   end interface

   public    RGB_
   interface RGB_
      module procedure RGB
   end interface

   public    nearest_colourname_
   interface nearest_colourname_
      module procedure nearest_colourname
   end interface

!  ***************
!  Data Statements
!  ***************

!  Standard colours as RGB 255 triples

   integer(kind=kind(1)), dimension(3,650), private :: std_colour_RGB255

   data std_colour_RGB255(1:3,1:30)/ &
      255,250,250, &
 ! Snow
      248,248,255, &
 ! GhostWhite
      245,245,245, &
 ! WhiteSmoke
      220,220,220, &
 ! Gainsboro
      255,250,240, &
 ! FloralWhite
      253,245,230, &
 ! OldLace
      250,240,230, &
 ! Linen
      250,235,215, &
 ! AntiqueWhite
      255,239,213, &
 ! PapayaWhip
      255,235,205, &
 ! BlanchedAlmond
      255,228,196, &
 ! Bisque
      255,218,185, &
 ! PeachPuff
      255,222,173, &
 ! NavajoWhite
      255,228,181, &
 ! Moccasin
      255,248,220, &
 ! Cornsilk
      255,255,240, &
 ! Ivory
      255,250,205, &
 ! LemonChiffon
      255,245,238, &
 ! Seashell
      240,255,240, &
 ! Honeydew
      245,255,250, &
 ! MintCream
      240,255,255, &
 ! Azure
      240,248,255, &
 ! AliceBlue
      230,230,250, &
 ! Lavender
      255,240,245, &
 ! LavenderBlush
      255,228,225, &
 ! MistyRose
      255,255,255, &
 ! White
        0,  0,  0, &
 ! Black
       47, 79, 79, &
 ! DarkSlateGray
       47, 79, 79, &
 ! DarkSlateGrey
      105,105,105/    ! DimGray
   data std_colour_RGB255(1:3,31:60)/ &
      105,105,105, &
 ! DimGrey
      112,128,144, &
 ! SlateGray
      112,128,144, &
 ! SlateGrey
      119,136,153, &
 ! LightSlateGray
      119,136,153, &
 ! LightSlateGrey
      190,190,190, &
 ! Gray
      190,190,190, &
 ! Grey
      211,211,211, &
 ! LightGrey
      211,211,211, &
 ! LightGray
       25, 25,112, &
 ! MidnightBlue
        0,  0,128, &
 ! Navy
        0,  0,128, &
 ! NavyBlue
      100,149,237, &
 ! CornflowerBlue
       72, 61,139, &
 ! DarkSlateBlue
      106, 90,205, &
 ! SlateBlue
      123,104,238, &
 ! MediumSlateBlue
      132,112,255, &
 ! LightSlateBlue
        0,  0,205, &
 ! MediumBlue
       65,105,225, &
 ! RoyalBlue
        0,  0,255, &
 ! Blue
       30,144,255, &
 ! DodgerBlue
        0,191,255, &
 ! DeepSkyBlue
      135,206,235, &
 ! SkyBlue
      135,206,250, &
 ! LightSkyBlue
       70,130,180, &
 ! SteelBlue
      176,196,222, &
 ! LightSteelBlue
      173,216,230, &
 ! LightBlue
      176,224,230, &
 ! PowderBlue
      175,238,238, &
 ! PaleTurquoise
        0,206,209/    ! DarkTurquoise
   data std_colour_RGB255(1:3,61:90)/ &
       72,209,204, &
 ! MediumTurquoise
       64,224,208, &
 ! Turquoise
        0,255,255, &
 ! Cyan
      224,255,255, &
 ! LightCyan
       95,158,160, &
 ! CadetBlue
      102,205,170, &
 ! MediumAquamarine
      127,255,212, &
 ! Aquamarine
        0,100,  0, &
 ! DarkGreen
       85,107, 47, &
 ! DarkOliveGreen
      143,188,143, &
 ! DarkSeaGreen
       46,139, 87, &
 ! SeaGreen
       60,179,113, &
 ! MediumSeaGreen
       32,178,170, &
 ! LightSeaGreen
      152,251,152, &
 ! PaleGreen
        0,255,127, &
 ! SpringGreen
      124,252,  0, &
 ! LawnGreen
        0,255,  0, &
 ! Green
      127,255,  0, &
 ! Chartreuse
        0,250,154, &
 ! MediumSpringGreen
      173,255, 47, &
 ! GreenYellow
       50,205, 50, &
 ! LimeGreen
      154,205, 50, &
 ! YellowGreen
       34,139, 34, &
 ! ForestGreen
      107,142, 35, &
 ! OliveDrab
      189,183,107, &
 ! DarkKhaki
      240,230,140, &
 ! Khaki
      238,232,170, &
 ! PaleGoldenrod
      250,250,210, &
 ! LightGoldenrodYellow
      255,255,224, &
 ! LightYellow
      255,255,  0/    ! Yellow
   data std_colour_RGB255(1:3,91:120)/ &
      255,215,  0, &
 ! Gold
      238,221,130, &
 ! LightGoldenrod
      218,165, 32, &
 ! Goldenrod
      184,134, 11, &
 ! DarkGoldenrod
      188,143,143, &
 ! RosyBrown
      205, 92, 92, &
 ! IndianRed
      139, 69, 19, &
 ! SaddleBrown
      160, 82, 45, &
 ! Sienna
      205,133, 63, &
 ! Peru
      222,184,135, &
 ! Burlywood
      245,245,220, &
 ! Beige
      245,222,179, &
 ! Wheat
      244,164, 96, &
 ! SandyBrown
      210,180,140, &
 ! Tan
      210,105, 30, &
 ! Chocolate
      178, 34, 34, &
 ! Firebrick
      165, 42, 42, &
 ! Brown
      233,150,122, &
 ! DarkSalmon
      250,128,114, &
 ! Salmon
      255,160,122, &
 ! LightSalmon
      255,165,  0, &
 ! Orange
      255,140,  0, &
 ! DarkOrange
      255,127, 80, &
 ! Coral
      240,128,128, &
 ! LightCoral
      255, 99, 71, &
 ! Tomato
      255, 69,  0, &
 ! OrangeRed
      255,  0,  0, &
 ! Red
      255,105,180, &
 ! HotPink
      255, 20,147, &
 ! DeepPink
      255,192,203/    ! Pink
   data std_colour_RGB255(1:3,121:150)/ &
      255,182,193, &
 ! LightPink
      219,112,147, &
 ! PaleVioletRed
      176, 48, 96, &
 ! Maroon
      199, 21,133, &
 ! MediumVioletRed
      208, 32,144, &
 ! VioletRed
      255,  0,255, &
 ! Magenta
      238,130,238, &
 ! Violet
      221,160,221, &
 ! Plum
      218,112,214, &
 ! Orchid
      186, 85,211, &
 ! MediumOrchid
      153, 50,204, &
 ! DarkOrchid
      148,  0,211, &
 ! DarkViolet
      138, 43,226, &
 ! BlueViolet
      160, 32,240, &
 ! Purple
      147,112,219, &
 ! MediumPurple
      216,191,216, &
 ! Thistle
      255,250,250, &
 ! Snow1
      238,233,233, &
 ! Snow2
      205,201,201, &
 ! Snow3
      139,137,137, &
 ! Snow4
      255,245,238, &
 ! Seashell1
      238,229,222, &
 ! Seashell2
      205,197,191, &
 ! Seashell3
      139,134,130, &
 ! Seashell4
      255,239,219, &
 ! AntiqueWhite1
      238,223,204, &
 ! AntiqueWhite2
      205,192,176, &
 ! AntiqueWhite3
      139,131,120, &
 ! AntiqueWhite4
      255,228,196, &
 ! Bisque1
      238,213,183/    ! Bisque2
   data std_colour_RGB255(1:3,151:180)/ &
      205,183,158, &
 ! Bisque3
      139,125,107, &
 ! Bisque4
      255,218,185, &
 ! PeachPuff1
      238,203,173, &
 ! PeachPuff2
      205,175,149, &
 ! PeachPuff3
      139,119,101, &
 ! PeachPuff4
      255,222,173, &
 ! NavajoWhite1
      238,207,161, &
 ! NavajoWhite2
      205,179,139, &
 ! NavajoWhite3
      139,121, 94, &
 ! NavajoWhite4
      255,250,205, &
 ! LemonChiffon1
      238,233,191, &
 ! LemonChiffon2
      205,201,165, &
 ! LemonChiffon3
      139,137,112, &
 ! LemonChiffon4
      255,248,220, &
 ! Cornsilk1
      238,232,205, &
 ! Cornsilk2
      205,200,177, &
 ! Cornsilk3
      139,136,120, &
 ! Cornsilk4
      255,255,240, &
 ! Ivory1
      238,238,224, &
 ! Ivory2
      205,205,193, &
 ! Ivory3
      139,139,131, &
 ! Ivory4
      240,255,240, &
 ! Honeydew1
      224,238,224, &
 ! Honeydew2
      193,205,193, &
 ! Honeydew3
      131,139,131, &
 ! Honeydew4
      255,240,245, &
 ! LavenderBlush1
      238,224,229, &
 ! LavenderBlush2
      205,193,197, &
 ! LavenderBlush3
      139,131,134/    ! LavenderBlush4
   data std_colour_RGB255(1:3,181:210)/ &
      255,228,225, &
 ! MistyRose1
      238,213,210, &
 ! MistyRose2
      205,183,181, &
 ! MistyRose3
      139,125,123, &
 ! MistyRose4
      240,255,255, &
 ! Azure1
      224,238,238, &
 ! Azure2
      193,205,205, &
 ! Azure3
      131,139,139, &
 ! Azure4
      131,111,255, &
 ! SlateBlue1
      122,103,238, &
 ! SlateBlue2
      105, 89,205, &
 ! SlateBlue3
       71, 60,139, &
 ! SlateBlue4
       72,118,255, &
 ! RoyalBlue1
       67,110,238, &
 ! RoyalBlue2
       58, 95,205, &
 ! RoyalBlue3
       39, 64,139, &
 ! RoyalBlue4
        0,  0,255, &
 ! Blue1
        0,  0,238, &
 ! Blue2
        0,  0,205, &
 ! Blue3
        0,  0,139, &
 ! Blue4
       30,144,255, &
 ! DodgerBlue1
       28,134,238, &
 ! DodgerBlue2
       24,116,205, &
 ! DodgerBlue3
       16, 78,139, &
 ! DodgerBlue4
       99,184,255, &
 ! SteelBlue1
       92,172,238, &
 ! SteelBlue2
       79,148,205, &
 ! SteelBlue3
       54,100,139, &
 ! SteelBlue4
        0,191,255, &
 ! DeepSkyBlue1
        0,178,238/    ! DeepSkyBlue2
   data std_colour_RGB255(1:3,211:240)/ &
        0,154,205, &
 ! DeepSkyBlue3
        0,104,139, &
 ! DeepSkyBlue4
      135,206,255, &
 ! SkyBlue1
      126,192,238, &
 ! SkyBlue2
      108,166,205, &
 ! SkyBlue3
       74,112,139, &
 ! SkyBlue4
      176,226,255, &
 ! LightSkyBlue1
      164,211,238, &
 ! LightSkyBlue2
      141,182,205, &
 ! LightSkyBlue3
       96,123,139, &
 ! LightSkyBlue4
      198,226,255, &
 ! SlateGray1
      185,211,238, &
 ! SlateGray2
      159,182,205, &
 ! SlateGray3
      108,123,139, &
 ! SlateGray4
      202,225,255, &
 ! LightSteelBlue1
      188,210,238, &
 ! LightSteelBlue2
      162,181,205, &
 ! LightSteelBlue3
      110,123,139, &
 ! LightSteelBlue4
      191,239,255, &
 ! LightBlue1
      178,223,238, &
 ! LightBlue2
      154,192,205, &
 ! LightBlue3
      104,131,139, &
 ! LightBlue4
      224,255,255, &
 ! LightCyan1
      209,238,238, &
 ! LightCyan2
      180,205,205, &
 ! LightCyan3
      122,139,139, &
 ! LightCyan4
      187,255,255, &
 ! PaleTurquoise1
      174,238,238, &
 ! PaleTurquoise2
      150,205,205, &
 ! PaleTurquoise3
      102,139,139/    ! PaleTurquoise4
   data std_colour_RGB255(1:3,241:270)/ &
      152,245,255, &
 ! CadetBlue1
      142,229,238, &
 ! CadetBlue2
      122,197,205, &
 ! CadetBlue3
       83,134,139, &
 ! CadetBlue4
        0,245,255, &
 ! Turquoise1
        0,229,238, &
 ! Turquoise2
        0,197,205, &
 ! Turquoise3
        0,134,139, &
 ! Turquoise4
        0,255,255, &
 ! Cyan1
        0,238,238, &
 ! Cyan2
        0,205,205, &
 ! Cyan3
        0,139,139, &
 ! Cyan4
      151,255,255, &
 ! DarkSlateGray1
      141,238,238, &
 ! DarkSlateGray2
      121,205,205, &
 ! DarkSlateGray3
       82,139,139, &
 ! DarkSlateGray4
      127,255,212, &
 ! Aquamarine1
      118,238,198, &
 ! Aquamarine2
      102,205,170, &
 ! Aquamarine3
       69,139,116, &
 ! Aquamarine4
      193,255,193, &
 ! DarkSeaGreen1
      180,238,180, &
 ! DarkSeaGreen2
      155,205,155, &
 ! DarkSeaGreen3
      105,139,105, &
 ! DarkSeaGreen4
       84,255,159, &
 ! SeaGreen1
       78,238,148, &
 ! SeaGreen2
       67,205,128, &
 ! SeaGreen3
       46,139, 87, &
 ! SeaGreen4
      154,255,154, &
 ! PaleGreen1
      144,238,144/    ! PaleGreen2
   data std_colour_RGB255(1:3,271:300)/ &
      124,205,124, &
 ! PaleGreen3
       84,139, 84, &
 ! PaleGreen4
        0,255,127, &
 ! SpringGreen1
        0,238,118, &
 ! SpringGreen2
        0,205,102, &
 ! SpringGreen3
        0,139, 69, &
 ! SpringGreen4
        0,255,  0, &
 ! Green1
        0,238,  0, &
 ! Green2
        0,205,  0, &
 ! Green3
        0,139,  0, &
 ! Green4
      127,255,  0, &
 ! Chartreuse1
      118,238,  0, &
 ! Chartreuse2
      102,205,  0, &
 ! Chartreuse3
       69,139,  0, &
 ! Chartreuse4
      192,255, 62, &
 ! OliveDrab1
      179,238, 58, &
 ! OliveDrab2
      154,205, 50, &
 ! OliveDrab3
      105,139, 34, &
 ! OliveDrab4
      202,255,112, &
 ! DarkOliveGreen1
      188,238,104, &
 ! DarkOliveGreen2
      162,205, 90, &
 ! DarkOliveGreen3
      110,139, 61, &
 ! DarkOliveGreen4
      255,246,143, &
 ! Khaki1
      238,230,133, &
 ! Khaki2
      205,198,115, &
 ! Khaki3
      139,134, 78, &
 ! Khaki4
      255,236,139, &
 ! LightGoldenrod1
      238,220,130, &
 ! LightGoldenrod2
      205,190,112, &
 ! LightGoldenrod3
      139,129, 76/    ! LightGoldenrod4
   data std_colour_RGB255(1:3,301:330)/ &
      255,255,224, &
 ! LightYellow1
      238,238,209, &
 ! LightYellow2
      205,205,180, &
 ! LightYellow3
      139,139,122, &
 ! LightYellow4
      255,255,  0, &
 ! Yellow1
      238,238,  0, &
 ! Yellow2
      205,205,  0, &
 ! Yellow3
      139,139,  0, &
 ! Yellow4
      255,215,  0, &
 ! Gold1
      238,201,  0, &
 ! Gold2
      205,173,  0, &
 ! Gold3
      139,117,  0, &
 ! Gold4
      255,193, 37, &
 ! Goldenrod1
      238,180, 34, &
 ! Goldenrod2
      205,155, 29, &
 ! Goldenrod3
      139,105, 20, &
 ! Goldenrod4
      255,185, 15, &
 ! DarkGoldenrod1
      238,173, 14, &
 ! DarkGoldenrod2
      205,149, 12, &
 ! DarkGoldenrod3
      139,101,  8, &
 ! DarkGoldenrod4
      255,193,193, &
 ! RosyBrown1
      238,180,180, &
 ! RosyBrown2
      205,155,155, &
 ! RosyBrown3
      139,105,105, &
 ! RosyBrown4
      255,106,106, &
 ! IndianRed1
      238, 99, 99, &
 ! IndianRed2
      205, 85, 85, &
 ! IndianRed3
      139, 58, 58, &
 ! IndianRed4
      255,130, 71, &
 ! Sienna1
      238,121, 66/    ! Sienna2
   data std_colour_RGB255(1:3,331:360)/ &
      205,104, 57, &
 ! Sienna3
      139, 71, 38, &
 ! Sienna4
      255,211,155, &
 ! Burlywood1
      238,197,145, &
 ! Burlywood2
      205,170,125, &
 ! Burlywood3
      139,115, 85, &
 ! Burlywood4
      255,231,186, &
 ! Wheat1
      238,216,174, &
 ! Wheat2
      205,186,150, &
 ! Wheat3
      139,126,102, &
 ! Wheat4
      255,165, 79, &
 ! Tan1
      238,154, 73, &
 ! Tan2
      205,133, 63, &
 ! Tan3
      139, 90, 43, &
 ! Tan4
      255,127, 36, &
 ! Chocolate1
      238,118, 33, &
 ! Chocolate2
      205,102, 29, &
 ! Chocolate3
      139, 69, 19, &
 ! Chocolate4
      255, 48, 48, &
 ! Firebrick1
      238, 44, 44, &
 ! Firebrick2
      205, 38, 38, &
 ! Firebrick3
      139, 26, 26, &
 ! Firebrick4
      255, 64, 64, &
 ! Brown1
      238, 59, 59, &
 ! Brown2
      205, 51, 51, &
 ! Brown3
      139, 35, 35, &
 ! Brown4
      255,140,105, &
 ! Salmon1
      238,130, 98, &
 ! Salmon2
      205,112, 84, &
 ! Salmon3
      139, 76, 57/    ! Salmon4
   data std_colour_RGB255(1:3,361:390)/ &
      255,160,122, &
 ! LightSalmon1
      238,149,114, &
 ! LightSalmon2
      205,129, 98, &
 ! LightSalmon3
      139, 87, 66, &
 ! LightSalmon4
      255,165,  0, &
 ! Orange1
      238,154,  0, &
 ! Orange2
      205,133,  0, &
 ! Orange3
      139, 90,  0, &
 ! Orange4
      255,127,  0, &
 ! DarkOrange1
      238,118,  0, &
 ! DarkOrange2
      205,102,  0, &
 ! DarkOrange3
      139, 69,  0, &
 ! DarkOrange4
      255,114, 86, &
 ! Coral1
      238,106, 80, &
 ! Coral2
      205, 91, 69, &
 ! Coral3
      139, 62, 47, &
 ! Coral4
      255, 99, 71, &
 ! Tomato1
      238, 92, 66, &
 ! Tomato2
      205, 79, 57, &
 ! Tomato3
      139, 54, 38, &
 ! Tomato4
      255, 69,  0, &
 ! OrangeRed1
      238, 64,  0, &
 ! OrangeRed2
      205, 55,  0, &
 ! OrangeRed3
      139, 37,  0, &
 ! OrangeRed4
      255,  0,  0, &
 ! Red1
      238,  0,  0, &
 ! Red2
      205,  0,  0, &
 ! Red3
      139,  0,  0, &
 ! Red4
      255, 20,147, &
 ! DeepPink1
      238, 18,137/    ! DeepPink2
   data std_colour_RGB255(1:3,391:420)/ &
      205, 16,118, &
 ! DeepPink3
      139, 10, 80, &
 ! DeepPink4
      255,110,180, &
 ! HotPink1
      238,106,167, &
 ! HotPink2
      205, 96,144, &
 ! HotPink3
      139, 58, 98, &
 ! HotPink4
      255,181,197, &
 ! Pink1
      238,169,184, &
 ! Pink2
      205,145,158, &
 ! Pink3
      139, 99,108, &
 ! Pink4
      255,174,185, &
 ! LightPink1
      238,162,173, &
 ! LightPink2
      205,140,149, &
 ! LightPink3
      139, 95,101, &
 ! LightPink4
      255,130,171, &
 ! PaleVioletRed1
      238,121,159, &
 ! PaleVioletRed2
      205,104,137, &
 ! PaleVioletRed3
      139, 71, 93, &
 ! PaleVioletRed4
      255, 52,179, &
 ! Maroon1
      238, 48,167, &
 ! Maroon2
      205, 41,144, &
 ! Maroon3
      139, 28, 98, &
 ! Maroon4
      255, 62,150, &
 ! VioletRed1
      238, 58,140, &
 ! VioletRed2
      205, 50,120, &
 ! VioletRed3
      139, 34, 82, &
 ! VioletRed4
      255,  0,255, &
 ! Magenta1
      238,  0,238, &
 ! Magenta2
      205,  0,205, &
 ! Magenta3
      139,  0,139/    ! Magenta4
   data std_colour_RGB255(1:3,421:450)/ &
      255,131,250, &
 ! Orchid1
      238,122,233, &
 ! Orchid2
      205,105,201, &
 ! Orchid3
      139, 71,137, &
 ! Orchid4
      255,187,255, &
 ! Plum1
      238,174,238, &
 ! Plum2
      205,150,205, &
 ! Plum3
      139,102,139, &
 ! Plum4
      224,102,255, &
 ! MediumOrchid1
      209, 95,238, &
 ! MediumOrchid2
      180, 82,205, &
 ! MediumOrchid3
      122, 55,139, &
 ! MediumOrchid4
      191, 62,255, &
 ! DarkOrchid1
      178, 58,238, &
 ! DarkOrchid2
      154, 50,205, &
 ! DarkOrchid3
      104, 34,139, &
 ! DarkOrchid4
      155, 48,255, &
 ! Purple1
      145, 44,238, &
 ! Purple2
      125, 38,205, &
 ! Purple3
       85, 26,139, &
 ! Purple4
      171,130,255, &
 ! MediumPurple1
      159,121,238, &
 ! MediumPurple2
      137,104,205, &
 ! MediumPurple3
       93, 71,139, &
 ! MediumPurple4
      255,225,255, &
 ! Thistle1
      238,210,238, &
 ! Thistle2
      205,181,205, &
 ! Thistle3
      139,123,139, &
 ! Thistle4
        0,  0,  0, &
 ! Gray0
        0,  0,  0/    ! Grey0
   data std_colour_RGB255(1:3,451:480)/ &
        3,  3,  3, &
 ! Gray1
        3,  3,  3, &
 ! Grey1
        5,  5,  5, &
 ! Gray2
        5,  5,  5, &
 ! Grey2
        8,  8,  8, &
 ! Gray3
        8,  8,  8, &
 ! Grey3
       10, 10, 10, &
 ! Gray4
       10, 10, 10, &
 ! Grey4
       13, 13, 13, &
 ! Gray5
       13, 13, 13, &
 ! Grey5
       15, 15, 15, &
 ! Gray6
       15, 15, 15, &
 ! Grey6
       18, 18, 18, &
 ! Gray7
       18, 18, 18, &
 ! Grey7
       20, 20, 20, &
 ! Gray8
       20, 20, 20, &
 ! Grey8
       23, 23, 23, &
 ! Gray9
       23, 23, 23, &
 ! Grey9
       26, 26, 26, &
 ! Gray10
       26, 26, 26, &
 ! Grey10
       28, 28, 28, &
 ! Gray11
       28, 28, 28, &
 ! Grey11
       31, 31, 31, &
 ! Gray12
       31, 31, 31, &
 ! Grey12
       33, 33, 33, &
 ! Gray13
       33, 33, 33, &
 ! Grey13
       36, 36, 36, &
 ! Gray14
       36, 36, 36, &
 ! Grey14
       38, 38, 38, &
 ! Gray15
       38, 38, 38/    ! Grey15
   data std_colour_RGB255(1:3,481:510)/ &
       41, 41, 41, &
 ! Gray16
       41, 41, 41, &
 ! Grey16
       43, 43, 43, &
 ! Gray17
       43, 43, 43, &
 ! Grey17
       46, 46, 46, &
 ! Gray18
       46, 46, 46, &
 ! Grey18
       48, 48, 48, &
 ! Gray19
       48, 48, 48, &
 ! Grey19
       51, 51, 51, &
 ! Gray20
       51, 51, 51, &
 ! Grey20
       54, 54, 54, &
 ! Gray21
       54, 54, 54, &
 ! Grey21
       56, 56, 56, &
 ! Gray22
       56, 56, 56, &
 ! Grey22
       59, 59, 59, &
 ! Gray23
       59, 59, 59, &
 ! Grey23
       61, 61, 61, &
 ! Gray24
       61, 61, 61, &
 ! Grey24
       64, 64, 64, &
 ! Gray25
       64, 64, 64, &
 ! Grey25
       66, 66, 66, &
 ! Gray26
       66, 66, 66, &
 ! Grey26
       69, 69, 69, &
 ! Gray27
       69, 69, 69, &
 ! Grey27
       71, 71, 71, &
 ! Gray28
       71, 71, 71, &
 ! Grey28
       74, 74, 74, &
 ! Gray29
       74, 74, 74, &
 ! Grey29
       77, 77, 77, &
 ! Gray30
       77, 77, 77/    ! Grey30
   data std_colour_RGB255(1:3,511:540)/ &
       79, 79, 79, &
 ! Gray31
       79, 79, 79, &
 ! Grey31
       82, 82, 82, &
 ! Gray32
       82, 82, 82, &
 ! Grey32
       84, 84, 84, &
 ! Gray33
       84, 84, 84, &
 ! Grey33
       87, 87, 87, &
 ! Gray34
       87, 87, 87, &
 ! Grey34
       89, 89, 89, &
 ! Gray35
       89, 89, 89, &
 ! Grey35
       92, 92, 92, &
 ! Gray36
       92, 92, 92, &
 ! Grey36
       94, 94, 94, &
 ! Gray37
       94, 94, 94, &
 ! Grey37
       97, 97, 97, &
 ! Gray38
       97, 97, 97, &
 ! Grey38
       99, 99, 99, &
 ! Gray39
       99, 99, 99, &
 ! Grey39
      102,102,102, &
 ! Gray40
      102,102,102, &
 ! Grey40
      105,105,105, &
 ! Gray41
      105,105,105, &
 ! Grey41
      107,107,107, &
 ! Gray42
      107,107,107, &
 ! Grey42
      110,110,110, &
 ! Gray43
      110,110,110, &
 ! Grey43
      112,112,112, &
 ! Gray44
      112,112,112, &
 ! Grey44
      115,115,115, &
 ! Gray45
      115,115,115/    ! Grey45
   data std_colour_RGB255(1:3,541:570)/ &
      117,117,117, &
 ! Gray46
      117,117,117, &
 ! Grey46
      120,120,120, &
 ! Gray47
      120,120,120, &
 ! Grey47
      122,122,122, &
 ! Gray48
      122,122,122, &
 ! Grey48
      125,125,125, &
 ! Gray49
      125,125,125, &
 ! Grey49
      127,127,127, &
 ! Gray50
      127,127,127, &
 ! Grey50
      130,130,130, &
 ! Gray51
      130,130,130, &
 ! Grey51
      133,133,133, &
 ! Gray52
      133,133,133, &
 ! Grey52
      135,135,135, &
 ! Gray53
      135,135,135, &
 ! Grey53
      138,138,138, &
 ! Gray54
      138,138,138, &
 ! Grey54
      140,140,140, &
 ! Gray55
      140,140,140, &
 ! Grey55
      143,143,143, &
 ! Gray56
      143,143,143, &
 ! Grey56
      145,145,145, &
 ! Gray57
      145,145,145, &
 ! Grey57
      148,148,148, &
 ! Gray58
      148,148,148, &
 ! Grey58
      150,150,150, &
 ! Gray59
      150,150,150, &
 ! Grey59
      153,153,153, &
 ! Gray60
      153,153,153/    ! Grey60
   data std_colour_RGB255(1:3,571:600)/ &
      156,156,156, &
 ! Gray61
      156,156,156, &
 ! Grey61
      158,158,158, &
 ! Gray62
      158,158,158, &
 ! Grey62
      161,161,161, &
 ! Gray63
      161,161,161, &
 ! Grey63
      163,163,163, &
 ! Gray64
      163,163,163, &
 ! Grey64
      166,166,166, &
 ! Gray65
      166,166,166, &
 ! Grey65
      168,168,168, &
 ! Gray66
      168,168,168, &
 ! Grey66
      171,171,171, &
 ! Gray67
      171,171,171, &
 ! Grey67
      173,173,173, &
 ! Gray68
      173,173,173, &
 ! Grey68
      176,176,176, &
 ! Gray69
      176,176,176, &
 ! Grey69
      179,179,179, &
 ! Gray70
      179,179,179, &
 ! Grey70
      181,181,181, &
 ! Gray71
      181,181,181, &
 ! Grey71
      184,184,184, &
 ! Gray72
      184,184,184, &
 ! Grey72
      186,186,186, &
 ! Gray73
      186,186,186, &
 ! Grey73
      189,189,189, &
 ! Gray74
      189,189,189, &
 ! Grey74
      191,191,191, &
 ! Gray75
      191,191,191/    ! Grey75
   data std_colour_RGB255(1:3,601:630)/ &
      194,194,194, &
 ! Gray76
      194,194,194, &
 ! Grey76
      196,196,196, &
 ! Gray77
      196,196,196, &
 ! Grey77
      199,199,199, &
 ! Gray78
      199,199,199, &
 ! Grey78
      201,201,201, &
 ! Gray79
      201,201,201, &
 ! Grey79
      204,204,204, &
 ! Gray80
      204,204,204, &
 ! Grey80
      207,207,207, &
 ! Gray81
      207,207,207, &
 ! Grey81
      209,209,209, &
 ! Gray82
      209,209,209, &
 ! Grey82
      212,212,212, &
 ! Gray83
      212,212,212, &
 ! Grey83
      214,214,214, &
 ! Gray84
      214,214,214, &
 ! Grey84
      217,217,217, &
 ! Gray85
      217,217,217, &
 ! Grey85
      219,219,219, &
 ! Gray86
      219,219,219, &
 ! Grey86
      222,222,222, &
 ! Gray87
      222,222,222, &
 ! Grey87
      224,224,224, &
 ! Gray88
      224,224,224, &
 ! Grey88
      227,227,227, &
 ! Gray89
      227,227,227, &
 ! Grey89
      229,229,229, &
 ! Gray90
      229,229,229/    ! Grey90
   data std_colour_RGB255(1:3,631:650)/ &
      232,232,232, &
 ! Gray91
      232,232,232, &
 ! Grey91
      235,235,235, &
 ! Gray92
      235,235,235, &
 ! Grey92
      237,237,237, &
 ! Gray93
      237,237,237, &
 ! Grey93
      240,240,240, &
 ! Gray94
      240,240,240, &
 ! Grey94
      242,242,242, &
 ! Gray95
      242,242,242, &
 ! Grey95
      245,245,245, &
 ! Gray96
      245,245,245, &
 ! Grey96
      247,247,247, &
 ! Gray97
      247,247,247, &
 ! Grey97
      250,250,250, &
 ! Gray98
      250,250,250, &
 ! Grey98
      252,252,252, &
 ! Gray99
      252,252,252, &
 ! Grey99
      255,255,255, &
 ! Gray100
      255,255,255/    ! Grey100

!  Standard colour names to go with the RGB 255 triples

   character(128), dimension(650), private :: std_colour_names

   data std_colour_names(1:30)/ &
      "Snow                ", &
      "GhostWhite          ", &
      "WhiteSmoke          ", &
      "Gainsboro           ", &
      "FloralWhite         ", &
      "OldLace             ", &
      "Linen               ", &
      "AntiqueWhite        ", &
      "PapayaWhip          ", &
      "BlanchedAlmond      ", &
      "Bisque              ", &
      "PeachPuff           ", &
      "NavajoWhite         ", &
      "Moccasin            ", &
      "Cornsilk            ", &
      "Ivory               ", &
      "LemonChiffon        ", &
      "Seashell            ", &
      "Honeydew            ", &
      "MintCream           ", &
      "Azure               ", &
      "AliceBlue           ", &
      "Lavender            ", &
      "LavenderBlush       ", &
      "MistyRose           ", &
      "White               ", &
      "Black               ", &
      "DarkSlateGray       ", &
      "DarkSlateGrey       ", &
      "DimGray             "/
   data std_colour_names(31:60)/ &
      "DimGrey             ", &
      "SlateGray           ", &
      "SlateGrey           ", &
      "LightSlateGray      ", &
      "LightSlateGrey      ", &
      "Gray                ", &
      "Grey                ", &
      "LightGrey           ", &
      "LightGray           ", &
      "MidnightBlue        ", &
      "Navy                ", &
      "NavyBlue            ", &
      "CornflowerBlue      ", &
      "DarkSlateBlue       ", &
      "SlateBlue           ", &
      "MediumSlateBlue     ", &
      "LightSlateBlue      ", &
      "MediumBlue          ", &
      "RoyalBlue           ", &
      "Blue                ", &
      "DodgerBlue          ", &
      "DeepSkyBlue         ", &
      "SkyBlue             ", &
      "LightSkyBlue        ", &
      "SteelBlue           ", &
      "LightSteelBlue      ", &
      "LightBlue           ", &
      "PowderBlue          ", &
      "PaleTurquoise       ", &
      "DarkTurquoise       "/
   data std_colour_names(61:90)/ &
      "MediumTurquoise     ", &
      "Turquoise           ", &
      "Cyan                ", &
      "LightCyan           ", &
      "CadetBlue           ", &
      "MediumAquamarine    ", &
      "Aquamarine          ", &
      "DarkGreen           ", &
      "DarkOliveGreen      ", &
      "DarkSeaGreen        ", &
      "SeaGreen            ", &
      "MediumSeaGreen      ", &
      "LightSeaGreen       ", &
      "PaleGreen           ", &
      "SpringGreen         ", &
      "LawnGreen           ", &
      "Green               ", &
      "Chartreuse          ", &
      "MediumSpringGreen   ", &
      "GreenYellow         ", &
      "LimeGreen           ", &
      "YellowGreen         ", &
      "ForestGreen         ", &
      "OliveDrab           ", &
      "DarkKhaki           ", &
      "Khaki               ", &
      "PaleGoldenrod       ", &
      "LightGoldenrodYellow", &
      "LightYellow         ", &
      "Yellow              "/
   data std_colour_names(91:120)/ &
      "Gold                ", &
      "LightGoldenrod      ", &
      "Goldenrod           ", &
      "DarkGoldenrod       ", &
      "RosyBrown           ", &
      "IndianRed           ", &
      "SaddleBrown         ", &
      "Sienna              ", &
      "Peru                ", &
      "Burlywood           ", &
      "Beige               ", &
      "Wheat               ", &
      "SandyBrown          ", &
      "Tan                 ", &
      "Chocolate           ", &
      "Firebrick           ", &
      "Brown               ", &
      "DarkSalmon          ", &
      "Salmon              ", &
      "LightSalmon         ", &
      "Orange              ", &
      "DarkOrange          ", &
      "Coral               ", &
      "LightCoral          ", &
      "Tomato              ", &
      "OrangeRed           ", &
      "Red                 ", &
      "HotPink             ", &
      "DeepPink            ", &
      "Pink                "/
   data std_colour_names(121:150)/ &
      "LightPink           ", &
      "PaleVioletRed       ", &
      "Maroon              ", &
      "MediumVioletRed     ", &
      "VioletRed           ", &
      "Magenta             ", &
      "Violet              ", &
      "Plum                ", &
      "Orchid              ", &
      "MediumOrchid        ", &
      "DarkOrchid          ", &
      "DarkViolet          ", &
      "BlueViolet          ", &
      "Purple              ", &
      "MediumPurple        ", &
      "Thistle             ", &
      "Snow1               ", &
      "Snow2               ", &
      "Snow3               ", &
      "Snow4               ", &
      "Seashell1           ", &
      "Seashell2           ", &
      "Seashell3           ", &
      "Seashell4           ", &
      "AntiqueWhite1       ", &
      "AntiqueWhite2       ", &
      "AntiqueWhite3       ", &
      "AntiqueWhite4       ", &
      "Bisque1             ", &
      "Bisque2             "/
   data std_colour_names(151:180)/ &
      "Bisque3             ", &
      "Bisque4             ", &
      "PeachPuff1          ", &
      "PeachPuff2          ", &
      "PeachPuff3          ", &
      "PeachPuff4          ", &
      "NavajoWhite1        ", &
      "NavajoWhite2        ", &
      "NavajoWhite3        ", &
      "NavajoWhite4        ", &
      "LemonChiffon1       ", &
      "LemonChiffon2       ", &
      "LemonChiffon3       ", &
      "LemonChiffon4       ", &
      "Cornsilk1           ", &
      "Cornsilk2           ", &
      "Cornsilk3           ", &
      "Cornsilk4           ", &
      "Ivory1              ", &
      "Ivory2              ", &
      "Ivory3              ", &
      "Ivory4              ", &
      "Honeydew1           ", &
      "Honeydew2           ", &
      "Honeydew3           ", &
      "Honeydew4           ", &
      "LavenderBlush1      ", &
      "LavenderBlush2      ", &
      "LavenderBlush3      ", &
      "LavenderBlush4      "/
   data std_colour_names(181:210)/ &
      "MistyRose1          ", &
      "MistyRose2          ", &
      "MistyRose3          ", &
      "MistyRose4          ", &
      "Azure1              ", &
      "Azure2              ", &
      "Azure3              ", &
      "Azure4              ", &
      "SlateBlue1          ", &
      "SlateBlue2          ", &
      "SlateBlue3          ", &
      "SlateBlue4          ", &
      "RoyalBlue1          ", &
      "RoyalBlue2          ", &
      "RoyalBlue3          ", &
      "RoyalBlue4          ", &
      "Blue1               ", &
      "Blue2               ", &
      "Blue3               ", &
      "Blue4               ", &
      "DodgerBlue1         ", &
      "DodgerBlue2         ", &
      "DodgerBlue3         ", &
      "DodgerBlue4         ", &
      "SteelBlue1          ", &
      "SteelBlue2          ", &
      "SteelBlue3          ", &
      "SteelBlue4          ", &
      "DeepSkyBlue1        ", &
      "DeepSkyBlue2        "/
   data std_colour_names(211:240)/ &
      "DeepSkyBlue3        ", &
      "DeepSkyBlue4        ", &
      "SkyBlue1            ", &
      "SkyBlue2            ", &
      "SkyBlue3            ", &
      "SkyBlue4            ", &
      "LightSkyBlue1       ", &
      "LightSkyBlue2       ", &
      "LightSkyBlue3       ", &
      "LightSkyBlue4       ", &
      "SlateGray1          ", &
      "SlateGray2          ", &
      "SlateGray3          ", &
      "SlateGray4          ", &
      "LightSteelBlue1     ", &
      "LightSteelBlue2     ", &
      "LightSteelBlue3     ", &
      "LightSteelBlue4     ", &
      "LightBlue1          ", &
      "LightBlue2          ", &
      "LightBlue3          ", &
      "LightBlue4          ", &
      "LightCyan1          ", &
      "LightCyan2          ", &
      "LightCyan3          ", &
      "LightCyan4          ", &
      "PaleTurquoise1      ", &
      "PaleTurquoise2      ", &
      "PaleTurquoise3      ", &
      "PaleTurquoise4      "/
   data std_colour_names(241:270)/ &
      "CadetBlue1          ", &
      "CadetBlue2          ", &
      "CadetBlue3          ", &
      "CadetBlue4          ", &
      "Turquoise1          ", &
      "Turquoise2          ", &
      "Turquoise3          ", &
      "Turquoise4          ", &
      "Cyan1               ", &
      "Cyan2               ", &
      "Cyan3               ", &
      "Cyan4               ", &
      "DarkSlateGray1      ", &
      "DarkSlateGray2      ", &
      "DarkSlateGray3      ", &
      "DarkSlateGray4      ", &
      "Aquamarine1         ", &
      "Aquamarine2         ", &
      "Aquamarine3         ", &
      "Aquamarine4         ", &
      "DarkSeaGreen1       ", &
      "DarkSeaGreen2       ", &
      "DarkSeaGreen3       ", &
      "DarkSeaGreen4       ", &
      "SeaGreen1           ", &
      "SeaGreen2           ", &
      "SeaGreen3           ", &
      "SeaGreen4           ", &
      "PaleGreen1          ", &
      "PaleGreen2          "/
   data std_colour_names(271:300)/ &
      "PaleGreen3          ", &
      "PaleGreen4          ", &
      "SpringGreen1        ", &
      "SpringGreen2        ", &
      "SpringGreen3        ", &
      "SpringGreen4        ", &
      "Green1              ", &
      "Green2              ", &
      "Green3              ", &
      "Green4              ", &
      "Chartreuse1         ", &
      "Chartreuse2         ", &
      "Chartreuse3         ", &
      "Chartreuse4         ", &
      "OliveDrab1          ", &
      "OliveDrab2          ", &
      "OliveDrab3          ", &
      "OliveDrab4          ", &
      "DarkOliveGreen1     ", &
      "DarkOliveGreen2     ", &
      "DarkOliveGreen3     ", &
      "DarkOliveGreen4     ", &
      "Khaki1              ", &
      "Khaki2              ", &
      "Khaki3              ", &
      "Khaki4              ", &
      "LightGoldenrod1     ", &
      "LightGoldenrod2     ", &
      "LightGoldenrod3     ", &
      "LightGoldenrod4     "/
   data std_colour_names(301:330)/ &
      "LightYellow1        ", &
      "LightYellow2        ", &
      "LightYellow3        ", &
      "LightYellow4        ", &
      "Yellow1             ", &
      "Yellow2             ", &
      "Yellow3             ", &
      "Yellow4             ", &
      "Gold1               ", &
      "Gold2               ", &
      "Gold3               ", &
      "Gold4               ", &
      "Goldenrod1          ", &
      "Goldenrod2          ", &
      "Goldenrod3          ", &
      "Goldenrod4          ", &
      "DarkGoldenrod1      ", &
      "DarkGoldenrod2      ", &
      "DarkGoldenrod3      ", &
      "DarkGoldenrod4      ", &
      "RosyBrown1          ", &
      "RosyBrown2          ", &
      "RosyBrown3          ", &
      "RosyBrown4          ", &
      "IndianRed1          ", &
      "IndianRed2          ", &
      "IndianRed3          ", &
      "IndianRed4          ", &
      "Sienna1             ", &
      "Sienna2             "/
   data std_colour_names(331:360)/ &
      "Sienna3             ", &
      "Sienna4             ", &
      "Burlywood1          ", &
      "Burlywood2          ", &
      "Burlywood3          ", &
      "Burlywood4          ", &
      "Wheat1              ", &
      "Wheat2              ", &
      "Wheat3              ", &
      "Wheat4              ", &
      "Tan1                ", &
      "Tan2                ", &
      "Tan3                ", &
      "Tan4                ", &
      "Chocolate1          ", &
      "Chocolate2          ", &
      "Chocolate3          ", &
      "Chocolate4          ", &
      "Firebrick1          ", &
      "Firebrick2          ", &
      "Firebrick3          ", &
      "Firebrick4          ", &
      "Brown1              ", &
      "Brown2              ", &
      "Brown3              ", &
      "Brown4              ", &
      "Salmon1             ", &
      "Salmon2             ", &
      "Salmon3             ", &
      "Salmon4             "/
   data std_colour_names(361:390)/ &
      "LightSalmon1        ", &
      "LightSalmon2        ", &
      "LightSalmon3        ", &
      "LightSalmon4        ", &
      "Orange1             ", &
      "Orange2             ", &
      "Orange3             ", &
      "Orange4             ", &
      "DarkOrange1         ", &
      "DarkOrange2         ", &
      "DarkOrange3         ", &
      "DarkOrange4         ", &
      "Coral1              ", &
      "Coral2              ", &
      "Coral3              ", &
      "Coral4              ", &
      "Tomato1             ", &
      "Tomato2             ", &
      "Tomato3             ", &
      "Tomato4             ", &
      "OrangeRed1          ", &
      "OrangeRed2          ", &
      "OrangeRed3          ", &
      "OrangeRed4          ", &
      "Red1                ", &
      "Red2                ", &
      "Red3                ", &
      "Red4                ", &
      "DeepPink1           ", &
      "DeepPink2           "/
   data std_colour_names(391:420)/ &
      "DeepPink3           ", &
      "DeepPink4           ", &
      "HotPink1            ", &
      "HotPink2            ", &
      "HotPink3            ", &
      "HotPink4            ", &
      "Pink1               ", &
      "Pink2               ", &
      "Pink3               ", &
      "Pink4               ", &
      "LightPink1          ", &
      "LightPink2          ", &
      "LightPink3          ", &
      "LightPink4          ", &
      "PaleVioletRed1      ", &
      "PaleVioletRed2      ", &
      "PaleVioletRed3      ", &
      "PaleVioletRed4      ", &
      "Maroon1             ", &
      "Maroon2             ", &
      "Maroon3             ", &
      "Maroon4             ", &
      "VioletRed1          ", &
      "VioletRed2          ", &
      "VioletRed3          ", &
      "VioletRed4          ", &
      "Magenta1            ", &
      "Magenta2            ", &
      "Magenta3            ", &
      "Magenta4            "/
   data std_colour_names(421:450)/ &
      "Orchid1             ", &
      "Orchid2             ", &
      "Orchid3             ", &
      "Orchid4             ", &
      "Plum1               ", &
      "Plum2               ", &
      "Plum3               ", &
      "Plum4               ", &
      "MediumOrchid1       ", &
      "MediumOrchid2       ", &
      "MediumOrchid3       ", &
      "MediumOrchid4       ", &
      "DarkOrchid1         ", &
      "DarkOrchid2         ", &
      "DarkOrchid3         ", &
      "DarkOrchid4         ", &
      "Purple1             ", &
      "Purple2             ", &
      "Purple3             ", &
      "Purple4             ", &
      "MediumPurple1       ", &
      "MediumPurple2       ", &
      "MediumPurple3       ", &
      "MediumPurple4       ", &
      "Thistle1            ", &
      "Thistle2            ", &
      "Thistle3            ", &
      "Thistle4            ", &
      "Gray0               ", &
      "Grey0               "/
   data std_colour_names(451:480)/ &
      "Gray1               ", &
      "Grey1               ", &
      "Gray2               ", &
      "Grey2               ", &
      "Gray3               ", &
      "Grey3               ", &
      "Gray4               ", &
      "Grey4               ", &
      "Gray5               ", &
      "Grey5               ", &
      "Gray6               ", &
      "Grey6               ", &
      "Gray7               ", &
      "Grey7               ", &
      "Gray8               ", &
      "Grey8               ", &
      "Gray9               ", &
      "Grey9               ", &
      "Gray10              ", &
      "Grey10              ", &
      "Gray11              ", &
      "Grey11              ", &
      "Gray12              ", &
      "Grey12              ", &
      "Gray13              ", &
      "Grey13              ", &
      "Gray14              ", &
      "Grey14              ", &
      "Gray15              ", &
      "Grey15              "/
   data std_colour_names(481:510)/ &
      "Gray16              ", &
      "Grey16              ", &
      "Gray17              ", &
      "Grey17              ", &
      "Gray18              ", &
      "Grey18              ", &
      "Gray19              ", &
      "Grey19              ", &
      "Gray20              ", &
      "Grey20              ", &
      "Gray21              ", &
      "Grey21              ", &
      "Gray22              ", &
      "Grey22              ", &
      "Gray23              ", &
      "Grey23              ", &
      "Gray24              ", &
      "Grey24              ", &
      "Gray25              ", &
      "Grey25              ", &
      "Gray26              ", &
      "Grey26              ", &
      "Gray27              ", &
      "Grey27              ", &
      "Gray28              ", &
      "Grey28              ", &
      "Gray29              ", &
      "Grey29              ", &
      "Gray30              ", &
      "Grey30              "/
   data std_colour_names(511:540)/ &
      "Gray31              ", &
      "Grey31              ", &
      "Gray32              ", &
      "Grey32              ", &
      "Gray33              ", &
      "Grey33              ", &
      "Gray34              ", &
      "Grey34              ", &
      "Gray35              ", &
      "Grey35              ", &
      "Gray36              ", &
      "Grey36              ", &
      "Gray37              ", &
      "Grey37              ", &
      "Gray38              ", &
      "Grey38              ", &
      "Gray39              ", &
      "Grey39              ", &
      "Gray40              ", &
      "Grey40              ", &
      "Gray41              ", &
      "Grey41              ", &
      "Gray42              ", &
      "Grey42              ", &
      "Gray43              ", &
      "Grey43              ", &
      "Gray44              ", &
      "Grey44              ", &
      "Gray45              ", &
      "Grey45              "/
   data std_colour_names(541:570)/ &
      "Gray46              ", &
      "Grey46              ", &
      "Gray47              ", &
      "Grey47              ", &
      "Gray48              ", &
      "Grey48              ", &
      "Gray49              ", &
      "Grey49              ", &
      "Gray50              ", &
      "Grey50              ", &
      "Gray51              ", &
      "Grey51              ", &
      "Gray52              ", &
      "Grey52              ", &
      "Gray53              ", &
      "Grey53              ", &
      "Gray54              ", &
      "Grey54              ", &
      "Gray55              ", &
      "Grey55              ", &
      "Gray56              ", &
      "Grey56              ", &
      "Gray57              ", &
      "Grey57              ", &
      "Gray58              ", &
      "Grey58              ", &
      "Gray59              ", &
      "Grey59              ", &
      "Gray60              ", &
      "Grey60              "/
   data std_colour_names(571:600)/ &
      "Gray61              ", &
      "Grey61              ", &
      "Gray62              ", &
      "Grey62              ", &
      "Gray63              ", &
      "Grey63              ", &
      "Gray64              ", &
      "Grey64              ", &
      "Gray65              ", &
      "Grey65              ", &
      "Gray66              ", &
      "Grey66              ", &
      "Gray67              ", &
      "Grey67              ", &
      "Gray68              ", &
      "Grey68              ", &
      "Gray69              ", &
      "Grey69              ", &
      "Gray70              ", &
      "Grey70              ", &
      "Gray71              ", &
      "Grey71              ", &
      "Gray72              ", &
      "Grey72              ", &
      "Gray73              ", &
      "Grey73              ", &
      "Gray74              ", &
      "Grey74              ", &
      "Gray75              ", &
      "Grey75              "/
   data std_colour_names(601:630)/ &
      "Gray76              ", &
      "Grey76              ", &
      "Gray77              ", &
      "Grey77              ", &
      "Gray78              ", &
      "Grey78              ", &
      "Gray79              ", &
      "Grey79              ", &
      "Gray80              ", &
      "Grey80              ", &
      "Gray81              ", &
      "Grey81              ", &
      "Gray82              ", &
      "Grey82              ", &
      "Gray83              ", &
      "Grey83              ", &
      "Gray84              ", &
      "Grey84              ", &
      "Gray85              ", &
      "Grey85              ", &
      "Gray86              ", &
      "Grey86              ", &
      "Gray87              ", &
      "Grey87              ", &
      "Gray88              ", &
      "Grey88              ", &
      "Gray89              ", &
      "Grey89              ", &
      "Gray90              ", &
      "Grey90              "/
   data std_colour_names(631:650)/ &
      "Gray91              ", &
      "Grey91              ", &
      "Gray92              ", &
      "Grey92              ", &
      "Gray93              ", &
      "Grey93              ", &
      "Gray94              ", &
      "Grey94              ", &
      "Gray95              ", &
      "Grey95              ", &
      "Gray96              ", &
      "Grey96              ", &
      "Gray97              ", &
      "Grey97              ", &
      "Gray98              ", &
      "Grey98              ", &
      "Gray99              ", &
      "Grey99              ", &
      "Gray100             ", &
      "Grey100             "/

contains

   function RGB(self) result(res)
    type(colour_type) :: self
    ! Return the real-valued RGB triple
     real(kind=kind(1.0d0)), dimension(3) :: res

   call ensure_(tonto,is_a_valid_RGB255_(self),"COLOUR:RGB ... invalid RGB 255 colour triple")
     res = self%RGB255/255.0d0

   end function

   subroutine set(self,RGB255)
    type(colour_type) :: self
    ! Set the RGB255 triple. It must be valid.
     integer(kind=kind(1)), dimension(3) :: RGB255

   call ensure_(tonto,is_a_valid_RGB255_(self,RGB255),"COLOUR:set ... invalid RGB 255 colour triple")
     self%RGB255 = RGB255
     self%name = nearest_colourname_for_(self,RGB255)

   end subroutine

   subroutine set_1(self,name)
    type(colour_type) :: self
    ! Set name of the colour. It must be known.
     character(*) :: name

   call ensure_(tonto,is_a_known_colourname_(self,name),"COLOUR:set_1 ... unknown colourname, "//trim(name))
     self%name = name
     self%RGB255 = std_colour_RGB255(:,index_of_colourname_(self))

   end subroutine

   function is_a_valid_RGB255(self) result(res)
    type(colour_type) :: self
    ! Return .true. if ".RGB255" is a valid RGB 255 colour triple.
      logical(kind=kind(.true.)) :: res

      res = .true.
      if (minval(self%RGB255)<0)   res = .false.
      if (maxval(self%RGB255)>255) res = .false.

   end function

   function is_a_valid_RGB255_1(self,RGB255) result(res)
    type(colour_type) :: self
    ! Return .true. if "RGB255" is a valid RGB 255 colour triple.
      integer(kind=kind(1)), dimension(3) :: RGB255
      logical(kind=kind(.true.)) :: res

      res = .true.
      if (minval(RGB255)<0)   res = .false.
      if (maxval(RGB255)>255) res = .false.

   end function

   function is_a_known_colourname(self,index) result(res)
    type(colour_type) :: self
    ! Return .true. if ".name" is a known colour name
      integer(kind=kind(1)), intent(out), optional :: index
      logical(kind=kind(.true.)) :: res

      res = is_a_known_colourname_(self,self%name,index)

   end function

   function is_a_known_colourname_1(self,name,index) result(res)
    type(colour_type) :: self
    ! Return .true. if "name" is a known colour name
      character(*) :: name
      integer(kind=kind(1)), intent(out), optional :: index
      logical(kind=kind(.true.)) :: res
      character(128) :: the_name,std_name
      integer(kind=kind(1)) :: i

      the_name = name
      call to_lower_case_(the_name)
      res = .false.
      do i = 1,size(std_colour_names)
         std_name = std_colour_names(i)
         if (the_name/=std_name) cycle
         res = .true.
         if (present(index)) index = i
         exit
      end do

   end function

   function index_of_colourname(self) result(res)
    type(colour_type) :: self
    ! Return the standard index of a colourname
      integer(kind=kind(1)) :: res
      character(128) :: the_name,std_name
      integer(kind=kind(1)) :: i

   call ensure_(tonto,is_a_known_colourname_(self),"COLOUR:index_of_colourname ... unknown colourname, "//trim(self%name))
      the_name = self%name
      call to_lower_case_(the_name)
      do i = 1,size(std_colour_names)
         std_name = std_colour_names(i)
         if (the_name/=std_name) cycle
         res = i
         exit
      end do

   end function

   function index_of_colourname_1(self,name) result(res)
    type(colour_type) :: self
    ! Return the standard index of a colourname
      character(*) :: name
      integer(kind=kind(1)) :: res
      character(128) :: the_name,std_name
      integer(kind=kind(1)) :: i

   call ensure_(tonto,is_a_known_colourname_(self,name),"COLOUR:index_of_colourname_1 ... unknown colourname, "//trim(name))
      the_name = name
      call to_lower_case_(the_name)
      do i = 1,size(std_colour_names)
         std_name = std_colour_names(i)
         if (the_name/=std_name) cycle
         res = i
         exit
      end do

   end function

   function nearest_colourname(self) result(res)
    type(colour_type) :: self
    ! Return the nearest colourname to the given "RGB255" triple.
      character(128) :: res

      res = nearest_colourname_for_(self,self%RGB255)

   end function

   function nearest_colourname_for(self,RGB255,index) result(res)
    type(colour_type) :: self
    ! Return the nearest colourname to the given "RGB255" triple.
      integer(kind=kind(1)), dimension(3) :: RGB255
      integer(kind=kind(1)), intent(out), optional :: index
      character(128) :: res
      integer(kind=kind(1)), dimension(3,size(std_colour_names)) :: diff
      integer(kind=kind(1)) :: ind

      call ensure_(tonto,is_a_valid_RGB255_(self,RGB255),"COLOUR:nearest_colourname_for ... invalid RGB 255 colour triple")
      diff = std_colour_RGB255 - spread(RGB255,2,size(std_colour_names))
      ind = minval(minloc(column_norms_(diff)))
      res = std_colour_names(ind)
      if (present(index)) index = ind

   end function

   subroutine read(self)
    type(colour_type) :: self
    ! Read in a colour from stdin. Can take either a colourname, an RGB255 triple
    ! or a real RGB triple.
      character(128) :: word

      word = next_item_(stdin)
      if      (is_a_true_int_(word)) then; call read_RGB255_(self)
      else if (is_real_(word)) then; call read_RGB_(self)
      else;                       call read_name_(self)    ! must be a colourname
      end if

   end subroutine

   subroutine read_RGB255(self)
    type(colour_type) :: self
    ! Read in and set an RGB255 triple
      integer(kind=kind(1)), dimension(3) :: RGB255
      character(128) :: word

      call read_(stdin,word)
      call ensure_(tonto,is_int_(word),"COLOUR:read_RGB255 ... not an RGB255 triple")
      RGB255(1) = to_int_(word)
      call read_(stdin,RGB255(2))
      call read_(stdin,RGB255(3))
      call set_(self,RGB255)

   end subroutine

   subroutine read_RGB(self)
    type(colour_type) :: self
    ! Read in a real RGB triple.
      real(kind=kind(1.0d0)), dimension(3) :: RGB
      integer(kind=kind(1)), dimension(3) :: RGB255
      character(128) :: word

      call read_(stdin,word)
      call ensure_(tonto,is_real_(word),"COLOUR:read_RGB ... not a real RGB number")
      RGB(1) = to_real_(word)
      call read_(stdin,RGB(2))
      call read_(stdin,RGB(3))
      RGB255 = RGB*255
      call set_(self,RGB255)

   end subroutine

   subroutine read_name(self)
    type(colour_type) :: self
    ! Read in a colour name from stdin

      call set_(self,next_str_(stdin))

   end subroutine

end
