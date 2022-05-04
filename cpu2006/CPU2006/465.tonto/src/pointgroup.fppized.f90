!-------------------------------------------------------------------------------
!
!  POINTGROUP : for deriving and manipulating pointgroup objects
!
!  Input required is the Schonflies symbol. The data generated are
!  The 3x3 rotation matrices, all the irreducible representations,
!  The character table, the irreducible representation lables,
!  the group multiplication table, and the list of inverse operators
!
! Copyright (C) 1994-1997, Anthony J. Russell
! Copyright (C) 1998, Dylan Jayatilaka
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
! $Id: pointgroup.foo,v 1.13.2.3 2003/11/13 05:35:33 reaper Exp $
!
!-------------------------------------------------------------------------------

module POINTGROUP_MODULE

   use TYPES_MODULE
   use SYSTEM_MODULE

   use REALVEC_MODULE, only: create_

   use INT_MODULE, only: to_str_

   use INTMAT_MODULE, only: create_
   use INTMAT_MODULE, only: create_copy_
   use INTMAT_MODULE, only: destroy_

   use REALMAT3_MODULE, only: gaussian_d_xyz_matrices_
   use REALMAT3_MODULE, only: create_
   use REALMAT3_MODULE, only: gaussian_g_xyz_matrices_
   use REALMAT3_MODULE, only: create_copy_
   use REALMAT3_MODULE, only: gaussian_f_xyz_matrices_
   use REALMAT3_MODULE, only: destroy_

   use INTVEC_MODULE, only: create_
   use INTVEC_MODULE, only: create_copy_
   use INTVEC_MODULE, only: destroy_

   use STR_MODULE, only: to_lower_case_
   use STR_MODULE, only: to_int_

   use TEXTFILE_MODULE, only: stdin
   use TEXTFILE_MODULE, only: stdout
   use TEXTFILE_MODULE, only: set_default_units_
   use TEXTFILE_MODULE, only: put_dash_
   use TEXTFILE_MODULE, only: next_str_
   use TEXTFILE_MODULE, only: skip_next_item_
   use TEXTFILE_MODULE, only: put_text_
   use TEXTFILE_MODULE, only: next_item_
   use TEXTFILE_MODULE, only: show_
   use TEXTFILE_MODULE, only: put_
   use TEXTFILE_MODULE, only: tab_
   use TEXTFILE_MODULE, only: read_
   use TEXTFILE_MODULE, only: flush_
   use TEXTFILE_MODULE, only: reverted_

   use IRREPVEC_MODULE, only: create_
   use IRREPVEC_MODULE, only: create_copy_
   use IRREPVEC_MODULE, only: destroy_

   use REALMAT_MODULE, only: equals_
   use REALMAT_MODULE, only: trace_
   use REALMAT_MODULE, only: create_
   use REALMAT_MODULE, only: to_unit_mat_
   use REALMAT_MODULE, only: to_product_of_
   use REALMAT_MODULE, only: trace_of_product_
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

   private    make_cn_gen_
   interface make_cn_gen_
      module procedure make_cn_gen
   end interface

   private    make_sn_matrices_
   interface make_sn_matrices_
      module procedure make_sn_matrices
   end interface

   public    nullify_ptr_part_
   interface nullify_ptr_part_
      module procedure nullify_ptr_part
   end interface

   private    times_sigma_v_
   interface times_sigma_v_
      module procedure times_sigma_v
   end interface

   public    destroy_ptr_part_
   interface destroy_ptr_part_
      module procedure destroy_ptr_part
   end interface

   private    make_t_matrices_
   interface make_t_matrices_
      module procedure make_t_matrices
   end interface

   public    read_keywords_
   interface read_keywords_
      module procedure read_keywords
   end interface

   private    make_cn_matrices_
   interface make_cn_matrices_
      module procedure make_cn_matrices
   end interface

   public    read_symbol_
   interface read_symbol_
      module procedure read_symbol
   end interface

   private    make_rep_matrices_
   interface make_rep_matrices_
      module procedure make_rep_matrices
   end interface

   private    make_sigma_x_gen_
   interface make_sigma_x_gen_
      module procedure make_sigma_x_gen
   end interface

   private    make_inverse_
   interface make_inverse_
      module procedure make_inverse
   end interface

   public    process_keyword_
   interface process_keyword_
      module procedure process_keyword
   end interface

   public    put_
   interface put_
      module procedure put
   end interface

   public    set_symbol_
   interface set_symbol_
      module procedure set_symbol
   end interface

   private    make_T_type_irreps_
   interface make_T_type_irreps_
      module procedure make_T_type_irreps
   end interface

   private    make_irrep_matrices_
   interface make_irrep_matrices_
      module procedure make_irrep_matrices
   end interface

   private    make_xyz_matrices_
   interface make_xyz_matrices_
      module procedure make_xyz_matrices
   end interface

   private    analyse_symbol_
   interface analyse_symbol_
      module procedure analyse_symbol
   end interface

   public    copy_
   interface copy_
      module procedure copy
   end interface

   public    set_defaults_
   interface set_defaults_
      module procedure set_defaults
   end interface

   public    create_
   interface create_
      module procedure create
   end interface

   public    create_copy_
   interface create_copy_
      module procedure create_copy
   end interface

   private    make_table_
   interface make_table_
      module procedure make_table
   end interface

   private    make_character_table_
   interface make_character_table_
      module procedure make_character_table
   end interface

   public    destroy_
   interface destroy_
      module procedure destroy
   end interface

   public    read_junk_
   interface read_junk_
      module procedure read_junk
   end interface

   private    times_c2x_
   interface times_c2x_
      module procedure times_c2x
   end interface

   private    times_sigma_d_
   interface times_sigma_d_
      module procedure times_sigma_d
   end interface

   public    read_units_
   interface read_units_
      module procedure read_units
   end interface

   private    times_c4z_
   interface times_c4z_
      module procedure times_c4z
   end interface

   private    times_ci_
   interface times_ci_
      module procedure times_ci
   end interface

   private    times_sigma_h_
   interface times_sigma_h_
      module procedure times_sigma_h
   end interface

   private    make_cnh_gen_
   interface make_cnh_gen_
      module procedure make_cnh_gen
   end interface

   private    make_irrep_labels_
   interface make_irrep_labels_
      module procedure make_irrep_labels
   end interface

   private    analyse_
   interface analyse_
      module procedure analyse
   end interface

   private    make_C_type_irreps_
   interface make_C_type_irreps_
      module procedure make_C_type_irreps
   end interface

   public    xyz_matrix_
   interface xyz_matrix_
      module procedure xyz_matrix
   end interface

contains

   subroutine create(self,symbol)
    type(pointgroup_type) :: self
    ! Create a pointgroup object, optionally with Schoenflies "symbol"
      pointer :: self
      character(*), optional :: symbol

      nullify(self)
      allocate(self)

      call nullify_ptr_part_(self)
      if (present(symbol)) then
        call set_symbol_(self,symbol)
        call analyse_(self)
      end if

   end subroutine

   subroutine destroy(self)
    type(pointgroup_type) :: self
    ! Destroy a pointgroup object
      pointer :: self

      if (.not. associated(self)) then;   return; end if
      call destroy_ptr_part_(self)

      deallocate(self)

   end subroutine

!   created result(res)
!   ! Returns true if self has been created
!      self :: pointer
!      res :: logical(kind=kind(.true.))
!      res = associated(self)
!   end

!   destroyed result(res)
!   ! Returns true if self has *not* been created
!      self :: pointer
!      res :: logical(kind=kind(.true.))
!      res = .not. associated(self)
!   end

   subroutine nullify_ptr_part(self)
    type(pointgroup_type) :: self
    ! Nullify the pointer parts of the object

      nullify(self%table)
      nullify(self%mat)
      nullify(self%ptr)
      nullify(self%dtr)
      nullify(self%ftr)
      nullify(self%inverse)
      nullify(self%irrep)

   end subroutine

   subroutine destroy_ptr_part(self)
    type(pointgroup_type) :: self
    ! Destroy the pointer parts of the object

      call destroy_(self%table)
      call destroy_(self%mat)
      nullify( self%ptr )
      call destroy_(self%dtr)
      call destroy_(self%ftr)
      call destroy_(self%inverse)
      call destroy_(self%irrep)

   end subroutine

   subroutine create_copy(self,pg)
    type(pointgroup_type) :: self
    ! Copy the pointgroup "pg"
      pointer :: self
      type(pointgroup_type) :: pg

      call create_(self)
      call copy_(self,pg)

   end subroutine

   subroutine copy(self,pg)
    type(pointgroup_type) :: self
    ! Copy the pointgroup "pg"
      type(pointgroup_type) :: pg

      self = pg
      if (associated(pg%table)) &
         call create_copy_(self%table,pg%table)
      if (associated(pg%mat)) &
         call create_copy_(self%mat,pg%mat)
      self%ptr => self%mat
      if (associated(pg%dtr)) &
         call create_copy_(self%dtr,pg%dtr)
      if (associated(pg%ftr)) &
         call create_copy_(self%ftr,pg%ftr)
      if (associated(pg%inverse)) &
         call create_copy_(self%inverse,pg%inverse)
      if (associated(pg%irrep)) &
         call create_copy_(self%irrep,pg%irrep)

   end subroutine

   subroutine set_symbol(self,symbol)
    type(pointgroup_type) :: self
    ! Set the pointgroup Schonflies symbol
      character(*) :: symbol

      self%symbol = symbol
      self%ID_symbol = symbol
      call to_lower_case_(self%ID_symbol)

   end subroutine

   subroutine set_defaults(self)
    type(pointgroup_type) :: self
    ! Set the default pointgroup, "C1"

      call set_symbol_(self,"C1")
      call analyse_(self)

   end subroutine

!  *************
!  Input methods
!  *************

   recursive subroutine read_keywords(self)
    type(pointgroup_type) :: self
    ! Read data from "stdin" using keyword style input.
    ! The following code is inherited from OBJECT
     character(128) :: word

     call ensure_(tonto,next_item_(stdin)=="{","POINTGROUP:read_keywords ... expecting open bracket symbol, {")
     call read_(stdin,word)
     do                  ! Loop over input keywords
       call read_(stdin,word)
       call to_lower_case_(word)
       if (word=="}")      exit
       if (reverted_(stdin)) exit
       call process_keyword_(self,word)
     end do

   end subroutine

   subroutine process_keyword(self,keyword)
    type(pointgroup_type) :: self
    ! Process command "keyword". Any required data needed by the "keyword" is
    ! inputted from "stdin".
      character(*) :: keyword
      character(128) :: word

      word = keyword
      call to_lower_case_(word)
      select case (word)
         case ("}                  ")   ! exit case
         case ("put                "); call put_(self)
         case ("schoenflies_symbol="); call read_symbol_(self)
         case ("schonflies_symbol= "); call read_symbol_(self)
         case ("symbol=            "); call read_symbol_(self)
         case default;               allocate(tonto%known_keywords(5))
         tonto%known_keywords(1) = "}                  "
         tonto%known_keywords(2) = "put                "
         tonto%known_keywords(3) = "schoenflies_symbol="
         tonto%known_keywords(4) = "schonflies_symbol= "
         tonto%known_keywords(5) = "symbol=            "
         call unknown_(tonto,word,"POINTGROUP:process_keyword")
         deallocate(tonto%known_keywords)
      end select

   end subroutine

   subroutine read_units(self)
    type(pointgroup_type) :: self
    ! Read a string which describes the units to be used
    ! The following code is inherited from OBJECT

      call set_default_units_(stdin,next_str_(stdin))

   end subroutine

   subroutine read_junk(self)
    type(pointgroup_type) :: self
    ! Read in a junk string, useful for ignoring a field
    ! The following code is inherited from OBJECT

      call skip_next_item_(stdin)

   end subroutine

   subroutine read_symbol(self)
    type(pointgroup_type) :: self
    ! Read the pointgroup Schonflies symbol

      call read_(stdin,self%symbol)
      self%ID_symbol = self%symbol
      select case (self%symbol)
         case("c1   ","cs   ","ci   ")
         case("c2   ","c3   ","c4   ","c5   ","c6   ","c7   ","c8   ","c9   ","c10  ","c11  ","c12  ")
         case("s2   ","s4   ","s6   ","s8   ","s10  ","s12  ")
         case("c2h  ","c3h  ","c4h  ","c5h  ","c6h  ","c7h  ","c8h  ","c9h  ","c10h ","c11h ","c12h ")
         case("c2v  ","c3v  ","c4v  ","c5v  ","c6v  ","c7v  ","c8v  ","c9v  ","c10v ","c11v ","c12v ")
         case("d2   ","d3   ","d4   ","d5   ","d6   ","d7   ","d8   ","d9   ","d10  ","d11  ","d12  ")
         case("d2h  ","d3h  ","d4h  ","d5h  ","d6h  ","d7h  ","d8h  ","d9h  ","d10h ","d11h ","d12h ")
         case("d2d  ","d3d  ","d4d  ","d5d  ","d6d  ","d7d  ","d8d  ","d9d  ","d10d ","d11d ","d12d ")
         case("cinfv","dinfh","t    ","th   ","td   ","o    ","oh   ","i    ","ih   ")
         case default;   allocate(tonto%known_keywords(84))
         tonto%known_keywords(1) = "c1   "
         tonto%known_keywords(2) = "cs   "
         tonto%known_keywords(3) = "ci   "
         tonto%known_keywords(4) = "c2   "
         tonto%known_keywords(5) = "c3   "
         tonto%known_keywords(6) = "c4   "
         tonto%known_keywords(7) = "c5   "
         tonto%known_keywords(8) = "c6   "
         tonto%known_keywords(9) = "c7   "
         tonto%known_keywords(10) = "c8   "
         tonto%known_keywords(11) = "c9   "
         tonto%known_keywords(12) = "c10  "
         tonto%known_keywords(13) = "c11  "
         tonto%known_keywords(14) = "c12  "
         tonto%known_keywords(15) = "s2   "
         tonto%known_keywords(16) = "s4   "
         tonto%known_keywords(17) = "s6   "
         tonto%known_keywords(18) = "s8   "
         tonto%known_keywords(19) = "s10  "
         tonto%known_keywords(20) = "s12  "
         tonto%known_keywords(21) = "c2h  "
         tonto%known_keywords(22) = "c3h  "
         tonto%known_keywords(23) = "c4h  "
         tonto%known_keywords(24) = "c5h  "
         tonto%known_keywords(25) = "c6h  "
         tonto%known_keywords(26) = "c7h  "
         tonto%known_keywords(27) = "c8h  "
         tonto%known_keywords(28) = "c9h  "
         tonto%known_keywords(29) = "c10h "
         tonto%known_keywords(30) = "c11h "
         tonto%known_keywords(31) = "c12h "
         tonto%known_keywords(32) = "c2v  "
         tonto%known_keywords(33) = "c3v  "
         tonto%known_keywords(34) = "c4v  "
         tonto%known_keywords(35) = "c5v  "
         tonto%known_keywords(36) = "c6v  "
         tonto%known_keywords(37) = "c7v  "
         tonto%known_keywords(38) = "c8v  "
         tonto%known_keywords(39) = "c9v  "
         tonto%known_keywords(40) = "c10v "
         tonto%known_keywords(41) = "c11v "
         tonto%known_keywords(42) = "c12v "
         tonto%known_keywords(43) = "d2   "
         tonto%known_keywords(44) = "d3   "
         tonto%known_keywords(45) = "d4   "
         tonto%known_keywords(46) = "d5   "
         tonto%known_keywords(47) = "d6   "
         tonto%known_keywords(48) = "d7   "
         tonto%known_keywords(49) = "d8   "
         tonto%known_keywords(50) = "d9   "
         tonto%known_keywords(51) = "d10  "
         tonto%known_keywords(52) = "d11  "
         tonto%known_keywords(53) = "d12  "
         tonto%known_keywords(54) = "d2h  "
         tonto%known_keywords(55) = "d3h  "
         tonto%known_keywords(56) = "d4h  "
         tonto%known_keywords(57) = "d5h  "
         tonto%known_keywords(58) = "d6h  "
         tonto%known_keywords(59) = "d7h  "
         tonto%known_keywords(60) = "d8h  "
         tonto%known_keywords(61) = "d9h  "
         tonto%known_keywords(62) = "d10h "
         tonto%known_keywords(63) = "d11h "
         tonto%known_keywords(64) = "d12h "
         tonto%known_keywords(65) = "d2d  "
         tonto%known_keywords(66) = "d3d  "
         tonto%known_keywords(67) = "d4d  "
         tonto%known_keywords(68) = "d5d  "
         tonto%known_keywords(69) = "d6d  "
         tonto%known_keywords(70) = "d7d  "
         tonto%known_keywords(71) = "d8d  "
         tonto%known_keywords(72) = "d9d  "
         tonto%known_keywords(73) = "d10d "
         tonto%known_keywords(74) = "d11d "
         tonto%known_keywords(75) = "d12d "
         tonto%known_keywords(76) = "cinfv"
         tonto%known_keywords(77) = "dinfh"
         tonto%known_keywords(78) = "t    "
         tonto%known_keywords(79) = "th   "
         tonto%known_keywords(80) = "td   "
         tonto%known_keywords(81) = "o    "
         tonto%known_keywords(82) = "oh   "
         tonto%known_keywords(83) = "i    "
         tonto%known_keywords(84) = "ih   "
         call unknown_(tonto,self%symbol,"POINTGROUP:read_symbol")
         deallocate(tonto%known_keywords)
      end select
      call analyse_(self)

   end subroutine

   subroutine analyse(self)
    type(pointgroup_type) :: self
    ! Analyse the pointgroup

      call analyse_symbol_(self)
      call make_rep_matrices_(self)
      call make_xyz_matrices_(self)
      call make_inverse_(self)
      call make_table_(self)
      call make_irrep_matrices_(self)
      call make_irrep_labels_(self)
      call make_character_table_(self)

   end subroutine

   subroutine analyse_symbol(self)
    type(pointgroup_type) :: self
    ! Analyse the pointgroup symbol
      character(128) :: axis
       integer(kind=kind(1)) :: n
      logical(kind=kind(.true.)) :: temp_bin

      select case (self%ID_symbol)
         case ("c1");      self%ID_number=1;  self%ID_symbol="c1 "
         case ("cs");      self%ID_number=2;  self%ID_symbol="cs "
         case ("ci");      self%ID_number=3;  self%ID_symbol="ci "
         case ("c2 ","c3 ","c4 ","c5 ","c6 ","c7 ","c8 ","c9 ","c10 ","c11 ","c12 ")
                           self%ID_number=4;  self%ID_symbol="cn "
         case ("s2 ","s4 ","s6 ","s8 ","s10","s12")
                           self%ID_number=5;  self%ID_symbol="s2n"
         case ("c2h","c3h","c4h","c5h","c6h","c7h","c8h","c9h","c10h","c11h","c12h")
                           self%ID_number=6;  self%ID_symbol="cnh"
         case ("c2v","c3v","c4v","c5v","c6v","c7v","c8v","c9v","c10v","c11v","c12v")
                           self%ID_number=7;  self%ID_symbol="cnv"
         case ("d2 ","d3 ","d4 ","d5 ","d6 ","d7 ","d8 ","d9 ","d10 ","d11 ","d12 ")
                           self%ID_number=8;  self%ID_symbol="dn "
         case ("d2h","d3h","d4h","d5h","d6h","d7h","d8h","d9h","d10h","d11h","d12h")
                           self%ID_number=9;  self%ID_symbol="dnh"
         case ("d2d","d3d","d4d","d5d","d6d","d7d","d8d","d9d","d10d","d11d","d12d")
                           self%ID_number=10; self%ID_symbol="dnd"
         case ("cinfv");   self%ID_number=11; self%ID_symbol="cinf"
         case ("dinfh");   self%ID_number=12; self%ID_symbol="dinf"
         case ("t ");      self%ID_number=13; self%ID_symbol="t  "
         case ("th");      self%ID_number=14; self%ID_symbol="th "
         case ("td");      self%ID_number=15; self%ID_symbol="td "
         case ("o ");      self%ID_number=16; self%ID_symbol="o  "
         case ("oh");      self%ID_number=17; self%ID_symbol="oh "
         case ("i ");      self%ID_number=18; self%ID_symbol="i  "
         case ("ih");      self%ID_number=19; self%ID_symbol="ih "
         case default;     self%ID_number=20
      end select
      temp_bin = any(self%ID_symbol==(/"i   ","ih  ","cinf","dinf"/))
      call die_if_(tonto,temp_bin,"POINTGROUP:analyse_symbol ... Group" // trim(self%symbol) // "not implemented")
      call die_if_(tonto,self%ID_number==20,"POINTGROUP:analyse_symbol ... Unknown group symbol: " // trim(self%symbol))
      select case (self%ID_number)
         case (1:3)
            self%axis_order = 1
         case (4:10)
            axis = self%symbol(2:)
            n = verify(axis,"123456789")-1
            axis = axis(1:n)
            self%axis_order = to_int_(axis)
            if (self%ID_number==5) self%axis_order = self%axis_order/2
         case (13:15)
            self%axis_order = 2
         case (16:17)
            self%axis_order = 4
      end select
      select case (self%ID_symbol)
         case ("c1 "); self%order = 1
         case ("cs "); self%order = 2
         case ("ci "); self%order = 2
         case ("cn "); self%order =   self%axis_order
         case ("s2n"); self%order = 2*self%axis_order
         case ("cnh"); self%order = 2*self%axis_order
         case ("cnv"); self%order = 2*self%axis_order
         case ("dn "); self%order = 2*self%axis_order
         case ("dnh"); self%order = 4*self%axis_order
         case ("dnd"); self%order = 4*self%axis_order
         case ("t  "); self%order = 12
         case ("th "); self%order = 24
         case ("td "); self%order = 24
         case ("o  "); self%order = 24
         case ("oh "); self%order = 48
      end select

   end subroutine

   subroutine make_rep_matrices(self)
    type(pointgroup_type) :: self
    ! Make the 3x3 point group representation matrices
       integer(kind=kind(1)) :: n

      n = self%axis_order
      call create_(self%mat,3,3,self%order)
      call to_unit_mat_(self%mat(:,:,1))
      select case (self%ID_symbol)
         case ("c1")                 ! C1
         case ("cs")                 ! Cs  = C1 x sigma-h
            call times_sigma_h_(self,1)
         case ("ci")                 ! Ci  = C1 x Ci
            call times_ci_(self,1)
         case ("cn")                 ! Cn
            call make_cn_matrices_(self)
         case ("s2n")                ! Sn
            call make_cn_matrices_(self)
            call make_sn_matrices_(self,n)
         case ("cnh")                ! Cnh = Cn x sigma-h(xy)
            call make_cn_matrices_(self)
            call times_sigma_h_(self,n)
         case ("cnv")                ! Cnv = Cn x sigma-v(xz)
            call make_cn_matrices_(self)
            call times_sigma_v_(self,n)
         case ("dn")                 ! Dn  = Cn  x C2(x)
            call make_cn_matrices_(self)
            call times_c2x_(self,n)
         case ("dnh")                ! Dnh = Cn x sigma-h(xy) x C2(x)
            call make_cn_matrices_(self)
            call times_sigma_h_(self,n)
            n = 2*n
            call times_c2x_(self,n)
         case ("dnd")                ! Dnd = Cn x C2(x) x sigma-d
            call make_cn_matrices_(self)
            call times_c2x_(self,n)
            n = 2*n
            call times_sigma_d_(self,n)
         case ("t")                  ! T
            call make_t_matrices_(self)
         case ("th")                 ! Th  = T x Ci
            call make_t_matrices_(self)
            call times_ci_(self,12)
         case ("td")                 ! Td  = T x sigma(x=y)
            call make_t_matrices_(self)
            self%mat(:,1,13:24) = self%mat(:,2,1:12)
            self%mat(:,2,13:24) = self%mat(:,1,1:12)
            self%mat(:,3,13:24) = self%mat(:,3,1:12)
         case ("o")                  ! O  = T x C4(z)
            call make_t_matrices_(self)
            call times_c4z_(self,12)
         case ("oh")                 ! Oh = T x C4(z) x Ci
            call make_t_matrices_(self)
            call times_c4z_(self,12)
            call times_ci_(self,24)
      end select

   end subroutine

   subroutine times_ci(self,n)
    type(pointgroup_type) :: self
    ! Direct product with inversion operator
       integer(kind=kind(1)) :: n

      self%mat(1,:,n+1:n+n) = -self%mat(1,:,1:n)
      self%mat(2,:,n+1:n+n) = -self%mat(2,:,1:n)
      self%mat(3,:,n+1:n+n) = -self%mat(3,:,1:n)

   end subroutine

   subroutine times_sigma_h(self,n)
    type(pointgroup_type) :: self
    ! Direct product with sigma-h, which is the xy plane
       integer(kind=kind(1)) :: n

      self%mat(1,:,n+1:n+n) =  self%mat(1,:,1:n)
      self%mat(2,:,n+1:n+n) =  self%mat(2,:,1:n)
      self%mat(3,:,n+1:n+n) = -self%mat(3,:,1:n)

   end subroutine

   subroutine times_sigma_v(self,n)
    type(pointgroup_type) :: self
    ! Direct product with sigma-v, which is the xz plane
       integer(kind=kind(1)) :: n

      self%mat(1,:,n+1:n+n) =  self%mat(1,:,1:n)
      self%mat(2,:,n+1:n+n) = -self%mat(2,:,1:n)
      self%mat(3,:,n+1:n+n) =  self%mat(3,:,1:n)

   end subroutine

   subroutine times_sigma_d(self,n)
    type(pointgroup_type) :: self
    ! Direct product with sigma-d. Equation of sigma-d is sin(alph/4)*x-cos(alph/4)*y=0
       integer(kind=kind(1)) :: n
      real(kind=kind(1.0d0)) :: beta,cosb,sinb

      beta = 3.141592653589793d0/self%axis_order
      cosb = cos(beta)
      sinb = sin(beta)
      self%mat(1,:,n+1:n+n) = cosb*self%mat(1,:,1:n) + sinb*self%mat(2,:,1:n)
      self%mat(2,:,n+1:n+n) = sinb*self%mat(1,:,1:n) - cosb*self%mat(2,:,1:n)
      self%mat(3,:,n+1:n+n) = self%mat(3,:,1:n)

   end subroutine

   subroutine times_c2x(self,n)
    type(pointgroup_type) :: self
    ! Direct product with C2x, for Dn groups
       integer(kind=kind(1)) :: n

      self%mat(1,:,n+1:n+n) =  self%mat(1,:,1:n)
      self%mat(2,:,n+1:n+n) = -self%mat(2,:,1:n)
      self%mat(3,:,n+1:n+n) = -self%mat(3,:,1:n)

   end subroutine

   subroutine times_c4z(self,n)
    type(pointgroup_type) :: self
    ! Direct product with the C4z matrix
       integer(kind=kind(1)) :: n

      self%mat(:,1,n+1:n+n) = -self%mat(:,2,1:n)
      self%mat(:,2,n+1:n+n) =  self%mat(:,1,1:n)
      self%mat(:,3,n+1:n+n) =  self%mat(:,3,1:n)

   end subroutine

   subroutine make_cn_matrices(self)
    type(pointgroup_type) :: self
    ! Make the Cn rotation matrices
      real(kind=kind(1.0d0)) :: alph,alpha,cosa,sina
       integer(kind=kind(1)) :: n

      alph = 2.0d0*3.141592653589793d0/self%axis_order
      alpha = 0.0d0
      do n = 2, self%axis_order
         alpha = alpha + alph
         cosa = cos(alpha)
         sina = sin(alpha)
         self%mat(:,:,n) = reshape((/cosa,-sina, 0.0d0, sina, cosa, 0.0d0, 0.0d0, 0.0d0, 1.0d0/), (/3,3/))
      end do

   end subroutine

   subroutine make_sn_matrices(self,n)
    type(pointgroup_type) :: self
    ! Make the Sn rotation matrices
       integer(kind=kind(1)) :: n
      real(kind=kind(1.0d0)) :: beta,cosb,sinb

      beta = 3.141592653589793d0/self%axis_order
      cosb = cos(beta)
      sinb = sin(beta)
      self%mat(1,:,n+1:n+n) =  cosb*self%mat(1,:,1:n) + sinb*self%mat(2,:,1:n)
      self%mat(2,:,n+1:n+n) = -sinb*self%mat(1,:,1:n) + cosb*self%mat(2,:,1:n)
      self%mat(3,:,n+1:n+n) = -self%mat(3,:,1:n)

   end subroutine

   subroutine make_t_matrices(self)
    type(pointgroup_type) :: self
    ! Make the Tetrahedral group 3x3 representation matrices
       integer(kind=kind(1)) :: n

      n = 1
      self%mat(:,:,2) = reshape((/  1.0d0, 0.0d0, 0.0d0, 0.0d0, -1.0d0, 0.0d0, 0.0d0, 0.0d0, -1.0d0/), (/3,3/))  ! C2x
      self%mat(:,:,3) = reshape((/ -1.0d0, 0.0d0, 0.0d0, 0.0d0,  1.0d0, 0.0d0, 0.0d0, 0.0d0, -1.0d0/), (/3,3/))  ! C2y
      self%mat(:,:,4) = reshape((/ -1.0d0, 0.0d0, 0.0d0, 0.0d0, -1.0d0, 0.0d0, 0.0d0, 0.0d0,  1.0d0/), (/3,3/))  ! C2z
      do n = 5, 12
         self%mat(:,1,n) = self%mat(:,3,n-4)
         self%mat(:,2,n) = self%mat(:,1,n-4)
         self%mat(:,3,n) = self%mat(:,2,n-4)
      end do

   end subroutine

   subroutine make_xyz_matrices(self)
    type(pointgroup_type) :: self
    ! Make the representation matrices for xyz products found in
    ! gaussian shells, i.e. work out matrix R, where the shell row vector
    ! p'(r) = p(S^{-1}r) = p(r)R, and S is the symop.
    ! WARNING: this routine is tied to an explicit ordering of the cartesian
    ! gaussian basis functions in a shell.

      self%ptr => self%mat
      self%dtr => gaussian_d_xyz_matrices_(self%mat)
      self%ftr => gaussian_f_xyz_matrices_(self%mat)
      self%gtr => gaussian_g_xyz_matrices_(self%mat)

   end subroutine

   function xyz_matrix(self,n,l) result(res)
    type(pointgroup_type) :: self
    ! Return the "n"-th representation matrix for xyz product found in
    ! a gaussian shell of angular momentum "l"
      integer(kind=kind(1)) :: n,l
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: res
      integer(kind=kind(1)) :: dim

   call ensure_(tonto,l>=0,"POINTGROUP:xyz_matrix ... l must be non-negative")
   call ensure_(tonto,l<5,"POINTGROUP:xyz_matrix ... l must be less than 5 (no h functions or higher)")
      dim = (l+1)*(l+2)/2
      nullify(res)
      call create_(res,dim,dim)
      select case (l)
         case(0); res = self%irrep(1)%mat(:,:,n)
         case(1); res = self%ptr(1:3 ,1:3 ,n)
         case(2); res = self%dtr(1:6 ,1:6 ,n)
         case(3); res = self%ftr(1:10,1:10,n)
      end select

   end function

   subroutine make_inverse(self)
    type(pointgroup_type) :: self
    ! Make the inverse operator list
      integer(kind=kind(1)) :: m,n
      real(kind=kind(1.0d0)) :: test

      call create_(self%inverse,self%order)
      do m = 1,self%order
         do n = 1,self%order
            test = trace_of_product_(self%mat(:,:,m), self%mat(:,:,n)) - 3.0d0
            if (abs(test)>0.001d0) cycle
            self%inverse(m) = n
            exit
         end do
      end do

   end subroutine

   subroutine make_table(self)
    type(pointgroup_type) :: self
    ! Make the group multiplication table
      integer(kind=kind(1)) :: l,m,n
      logical(kind=kind(.true.)) :: same
      real(kind=kind(1.0d0)), dimension(3,3) :: prod

      call create_(self%table,self%order,self%order)
      do l = 1,self%order
      do m = 1,self%order
         call to_product_of_(prod,self%mat(:,:,l),self%mat(:,:,m))
         do n = 1,self%order
            same = equals_(self%mat(:,:,n),prod)
            if (same) exit
         end do
         self%table(l,m) = n
      end do
      end do

   end subroutine

   subroutine make_irrep_matrices(self)
    type(pointgroup_type) :: self
    ! Make the Irreps for the group

      if (self%ID_number<=10) call make_C_type_irreps_(self)
      if (self%ID_number>=13) call make_T_type_irreps_(self)

   end subroutine

   subroutine make_C_type_irreps(self)
    type(pointgroup_type) :: self
    ! Make irrep matrices for the groups C1, Cs, Ci, Cn, Cnh, Cnv, S2n, Dn, Dnh, Dnd
      logical(kind=kind(.true.)) :: odd_axis
      integer(kind=kind(1)) :: e, i, n, n_max, dim
      real(kind=kind(1.0d0)) :: theta
      real(kind=kind(1.0d0)), dimension(2,2,14), target :: gen1, gen2, gen3 ! generator matrices
      real(kind=kind(1.0d0)), dimension(:,:,:), pointer :: mat
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: g1,g2,g3

      odd_axis = .not. self%axis_order==2*(self%axis_order/2)
      select case (self%ID_symbol)
         case ("c1") !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            self%has_complex_irreps = .false.
            self%n_irrep = 1
            call create_(self%irrep,self%n_irrep)
            self%irrep(1)%dimension = 1
            e = 2
            self%n_gen = 1
            gen1(1,1, 1) =  1.0d0
         case ("cs","ci") !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            self%has_complex_irreps = .false.
            self%n_irrep = 2
            call create_(self%irrep,self%n_irrep)
            self%irrep(1:2)%dimension = 1
            e = 3
            self%n_gen = 1
            gen1(1,1, 1) =  1.0d0
            gen1(1,1, 2) = -1.0d0
         case ("cn") !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            if (self%axis_order>2) self%has_complex_irreps = .true.
            self%n_gen = 1
            gen1(1,1, 1) =  1.0d0
            if (odd_axis) then
               self%n_irrep = (self%axis_order+1)/2
               call create_(self%irrep,self%n_irrep)
               self%irrep(1)%dimension = 1
               e = 2
            else
               self%n_irrep = self%axis_order/2 + 1
               call create_(self%irrep,self%n_irrep)
               self%irrep(1:2)%dimension = 1
               e = 3
               gen1(1,1, 2) = -1.0d0
            end if
            call make_cn_gen_(self,e,gen1,self%axis_order)
         case ("s2n") !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            if (self%axis_order>=2) self%has_complex_irreps = .true.
            self%n_irrep = self%axis_order + 1
            call create_(self%irrep,self%n_irrep)
            self%irrep(1:2)%dimension = 1
            e = 3
            self%n_gen = 2
            gen1(1,1, 1) =  1.0d0
            gen1(1,1, 2) =  1.0d0
            gen2(1,1, 1) =  1.0d0
            gen2(1,1, 2) = -1.0d0
            call make_cn_gen_(self,e,gen2,2*self%axis_order)
            call make_cn_gen_(self,e,gen1,self%axis_order)
         case ("cnh") !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            if (self%axis_order>2) self%has_complex_irreps = .true.
            self%n_gen = 2
            gen1(1,1, 1) =  1.0d0
            gen1(1,1, 2) =  1.0d0
            gen2(1,1, 1) =  1.0d0
            gen2(1,1, 2) = -1.0d0
            if (odd_axis) then
               self%n_irrep = self%axis_order + 1
               call create_(self%irrep,self%n_irrep)
               self%irrep(1:2)%dimension = 1
               e = 3
            else
               self%n_irrep = self%axis_order + 2
               call create_(self%irrep,self%n_irrep)
               self%irrep(1:4)%dimension = 1
               e = 5
               gen1(1,1, 3) = -1.0d0
               gen1(1,1, 4) = -1.0d0
               gen2(1,1, 3) =  1.0d0
               gen2(1,1, 4) = -1.0d0
            end if
            call make_cnh_gen_(self,e,gen1,gen2)
         case ("cnv","dn") !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            self%has_complex_irreps = .false.
            self%n_gen = 2
            gen1(1,1, 1) =  1.0d0
            gen1(1,1, 2) =  1.0d0
            gen2(1,1, 1) =  1.0d0
            gen2(1,1, 2) = -1.0d0
            if (odd_axis) then
               self%n_irrep = (self%axis_order + 3)/2
               call create_(self%irrep,self%n_irrep)
               self%irrep(1:2)%dimension = 1
               e = 3
            else
               self%n_irrep = self%axis_order/2 + 3
               call create_(self%irrep,self%n_irrep)
               self%irrep(1:4)%dimension = 1
               e = 5
               gen1(1,1, 3) = -1.0d0
               gen1(1,1, 4) = -1.0d0
               gen2(1,1, 3) =  1.0d0
               gen2(1,1, 4) = -1.0d0
            end if
            call make_sigma_x_gen_(self,e,gen2)
            call make_cn_gen_(self,e,gen1,self%axis_order)
         case ("dnh") !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            self%has_complex_irreps = .false.
            self%n_gen = 3
            gen1(1,1, 1) =  1.0d0
            gen1(1,1, 2) =  1.0d0
            gen2(1,1, 1) =  1.0d0
            gen2(1,1, 2) = -1.0d0
            gen2(1,1, 3) =  1.0d0
            gen2(1,1, 4) = -1.0d0
            gen3(1,1, 1) =  1.0d0
            gen3(1,1, 2) =  1.0d0
            if (odd_axis) then
               self%n_irrep = self%axis_order + 3
               call create_(self%irrep,self%n_irrep)
               self%irrep(1:4)%dimension = 1
               e = 5
               gen3(1,1, 3) = -1.0d0
               gen3(1,1, 4) = -1.0d0
               gen1(1,1, 3) =  1.0d0  ! Warning, possible error, Changed from gen3
                                    ! to gen1; the first two could be gen1
               gen1(1,1, 4) =  1.0d0  ! Warning, possible error, Changed from gen3
                                    ! to gen1
            else
               self%n_irrep = self%axis_order + 6
               call create_(self%irrep,self%n_irrep)
               self%irrep(1:8)%dimension = 1
               e = 9
               gen1(1,1, 3) = -1.0d0
               gen1(1,1, 4) = -1.0d0
               gen1(1,1, 5) =  1.0d0
               gen1(1,1, 6) =  1.0d0
               gen1(1,1, 7) = -1.0d0
               gen1(1,1, 8) = -1.0d0
               gen2(1,1, 5) =  1.0d0
               gen2(1,1, 6) = -1.0d0
               gen2(1,1, 7) =  1.0d0
               gen2(1,1, 8) = -1.0d0
               gen3(1,1, 3) =  1.0d0
               gen3(1,1, 4) =  1.0d0
               gen3(1,1, 5) = -1.0d0
               gen3(1,1, 6) = -1.0d0
               gen3(1,1, 7) = -1.0d0
               gen3(1,1, 8) = -1.0d0
            end if
            do i = e,self%n_irrep
               gen3(1,1, i) =  1.0d0
               gen3(2,2, i) = -1.0d0
               gen3(2,1, i) = 0.0d0    ! Transposed
               gen3(1,2, i) = 0.0d0
            end do
            call make_cnh_gen_(self,e,gen1,gen2)
         case ("dnd") !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            self%has_complex_irreps = .false.
            self%n_irrep = self%axis_order + 3
            call create_(self%irrep,self%n_irrep)
            self%irrep(1:4)%dimension = 1
            e = 5
            self%n_gen = 3
            gen1(1,1, 1) =  1.0d0
            gen1(1,1, 2) =  1.0d0
            gen1(1,1, 3) =  1.0d0
            gen1(1,1, 4) =  1.0d0
            gen2(1,1, 1) =  1.0d0
            gen2(1,1, 2) = -1.0d0
            gen2(1,1, 3) =  1.0d0
            gen2(1,1, 4) = -1.0d0
            gen3(1,1, 1) =  1.0d0
            gen3(1,1, 2) =  1.0d0
            gen3(1,1, 3) = -1.0d0
            gen3(1,1, 4) = -1.0d0
            do i = e,self%n_irrep
               theta = (i-e+1)*3.141592653589793d0/self%axis_order
               gen3(1,1, i) =  cos(theta)
               gen3(2,2, i) = -cos(theta)
               gen3(2,1, i) =  sin(theta)  ! Transposed
               gen3(1,2, i) =  sin(theta)
            end do
            call make_sigma_x_gen_(self,e,gen2)
            call make_cn_gen_(self,e,gen1,self%axis_order)
      end select
      do i = 1, self%n_irrep
         dim = self%irrep(i)%dimension
         call create_(self%irrep(i)%mat,dim,dim, self%order)
         mat => self%irrep(i)%mat
         g1  => gen1(1:dim,1:dim,i)
         g2  => gen2(1:dim,1:dim,i)
         g3  => gen3(1:dim,1:dim,i)
         call to_unit_mat_(mat(:,:,1))
         n_max = self%axis_order
         if (self%ID_symbol=="c1") cycle
         if (self%ID_symbol=="cs") n_max = 2
         if (self%ID_symbol=="ci") n_max = 2
         do n = 2,n_max
            mat(:,:,n) = matmul(g1,mat(:,:,n-1))
         end do
         if (self%n_gen==1) cycle
         do n = 1,n_max
            mat(:,:,n_max+n) = matmul(g2,mat(:,:,n))
         end do
         if (self%n_gen==2) cycle
         n_max = 2*n_max
         do n = 1,n_max
            mat(:,:,n_max+n) = matmul(g3,mat(:,:,n))
         end do
      end do

   end subroutine

   subroutine make_cnh_gen(self,e,gen1,gen2)
    type(pointgroup_type) :: self
    ! Make the Cnh generator matrices for the irreps
      integer(kind=kind(1)) :: e
      real(kind=kind(1.0d0)), dimension(2,2,14) :: gen1, gen2
      integer(kind=kind(1)) :: i,m
      real(kind=kind(1.0d0)) :: sign,theta

      do i = e,self%n_irrep
         self%irrep(i)%dimension = 2
         m = (i-e+2)/2
         theta = m*2.0d0*3.141592653589793d0/self%axis_order
         gen1(1,1, i) =  cos(theta)
         gen1(2,2, i) =  cos(theta)
         gen1(2,1, i) = -sin(theta)  ! Transposed
         gen1(1,2, i) =  sin(theta)
      end do
      sign = 1.0d0
      do i = e,self%n_irrep
         sign = -sign
         gen2(1,1, i) = sign
         gen2(2,2, i) = sign
         gen2(2,1, i) = 0.0d0  ! Transposed
         gen2(1,2, i) = 0.0d0
      end do

   end subroutine

   subroutine make_sigma_x_gen(self,e,gen2)
    type(pointgroup_type) :: self
    ! Make the sigma-x generator matrices for the irreps
      integer(kind=kind(1)) :: e
      real(kind=kind(1.0d0)), dimension(2,2,14) :: gen2
      integer(kind=kind(1)) :: i

      do i = e,self%n_irrep
         gen2(1,1, i) =  1.0d0
         gen2(2,2, i) = -1.0d0
         gen2(2,1, i) = 0.0d0  ! Transposed
         gen2(1,2, i) = 0.0d0
      end do

   end subroutine

   subroutine make_cn_gen(self,e,gen1,axis_order)
    type(pointgroup_type) :: self
    ! Make the Cn generator matrices for the irreps
      integer(kind=kind(1)) :: e,axis_order
      real(kind=kind(1.0d0)), dimension(2,2,14) :: gen1
      integer(kind=kind(1)) :: i
      real(kind=kind(1.0d0)) :: theta

      do i = e,self%n_irrep
         self%irrep(i)%dimension = 2
         theta = (i-e+1)*2.0d0*3.141592653589793d0/axis_order
         gen1(1,1, i) =  cos(theta)
         gen1(2,2, i) =  cos(theta)
         gen1(2,1, i) = -sin(theta)  ! Transposed
         gen1(1,2, i) =  sin(theta)
      end do

   end subroutine

   subroutine make_T_type_irreps(self)
    type(pointgroup_type) :: self
    ! Make irrep matrices for the groups T, Th, Td, O, and Oh
    ! Must have already generated the 3x3 rep matrices
      integer(kind=kind(1)), dimension(10,5) :: irrep_dimension = reshape( &
 ! Irrep dimensions for T-groups
                         (/ 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, &
 ! T
                            1, 2, 3, 1, 2, 3, 0, 0, 0, 0, &
 ! Th
                            1, 1, 2, 3, 3, 0, 0, 0, 0, 0, &
 ! Td
                            1, 1, 2, 3, 3, 0, 0, 0, 0, 0, &
 ! O
                            1, 1, 2, 3, 3, 1, 1, 2, 3, 3 /), &
 ! Oh
                          (/10,5/))
      integer(kind=kind(1)), dimension(5) :: n_irrep  = (/ 3, 6, 5, 5, 10 /) ! No of irreps
      integer(kind=kind(1)), dimension(5) :: ab_irrep = (/ 0, 4, 2, 2, 2  /) ! A irreps
      integer(kind=kind(1)), dimension(5) :: ea_irrep = (/ 2, 2, 3, 3, 3  /) ! 2.718281828459045d0 irreps
      integer(kind=kind(1)), dimension(5) :: eb_irrep = (/ 0, 5, 0, 0, 8  /) ! 2.718281828459045d0 irreps
      integer(kind=kind(1)), dimension(5) :: fa_irrep = (/ 3, 6, 5, 4, 9  /) ! F irreps
      integer(kind=kind(1)), dimension(5) :: fb_irrep = (/ 0, 0, 4, 5, 10 /) ! F irreps
      integer(kind=kind(1)) :: i, n, id, dim
      integer(kind=kind(1)) :: ab,ea,eb,fa,fb
      real(kind=kind(1.0d0)) :: pt5,r32

      self%has_complex_irreps = .false.
      if (self%ID_symbol=="t" ) self%has_complex_irreps = .true.
      if (self%ID_symbol=="td") self%has_complex_irreps = .true.
      id = self%ID_number - 12
      self%n_irrep = n_irrep(id)
      call create_(self%irrep,self%n_irrep)
      self%irrep(:)%dimension = irrep_dimension(1:self%n_irrep,id)
      do i = 1,self%n_irrep
         dim = self%irrep(i)%dimension
         call create_(self%irrep(i)%mat,dim,dim,self%order)
      end do

      self%irrep(1)%mat(1,1,:) = 1.0d0

      pt5 = 0.50d0
      r32 = sqrt(3.0d0)/2.0d0
      ea = ea_irrep(id)
      self%irrep(ea)%mat(1,1,1:4)  =  1.0d0
      self%irrep(ea)%mat(2,1,1:4)  = 0.0d0
      self%irrep(ea)%mat(1,2,1:4)  = 0.0d0
      self%irrep(ea)%mat(2,2,1:4)  =  1.0d0

      self%irrep(ea)%mat(1,1,5:8)  = -pt5
      self%irrep(ea)%mat(2,1,5:8)  = -r32
      self%irrep(ea)%mat(1,2,5:8)  =  r32
      self%irrep(ea)%mat(2,2,5:8)  = -pt5

      self%irrep(ea)%mat(1,1,9:12) = -pt5
      self%irrep(ea)%mat(2,1,9:12) =  r32
      self%irrep(ea)%mat(1,2,9:12) = -r32
      self%irrep(ea)%mat(2,2,9:12) = -pt5

      fa = fa_irrep(id)
      self%irrep(fa)%mat(:,:,:) = self%mat(:,:,:)

      if (self%ID_symbol=="t") then;   return; end if

      ab = ab_irrep(id)
      self%irrep(ab)%mat(1,1, 1:12) =  1.0d0
      self%irrep(ab)%mat(1,1,13:24) = -1.0d0
      if (self%ID_symbol=="oh") then
         self%irrep(2)%mat(1,1,25:48) =  self%irrep(2)%mat(1,1, 1:24)
         self%irrep(6)%mat(1,1, 1:24) =  1.0d0
         self%irrep(6)%mat(1,1,25:48) = -1.0d0
         self%irrep(7)%mat(1,1, 1:24) =  self%irrep(2)%mat(1,1, 1:24)
         self%irrep(7)%mat(1,1,25:48) = -self%irrep(2)%mat(1,1, 1:24)
      end if

      self%irrep(ea)%mat(:,:,13:24)   =  self%irrep(ea)%mat(:,:,1:12)
      n = self%order/2
      if (self%ID_symbol=="th" .or. self%ID_symbol=="oh") then
         self%irrep(ea)%mat(:,:,n+1:n+n) =  self%irrep(ea)%mat(:,:,1:n)
         eb = eb_irrep(id)
         self%irrep(eb)%mat(:,:,  1:  n) =  self%irrep(ea)%mat(:,:,  1:  n)
         self%irrep(eb)%mat(:,:,n+1:n+n) = -self%irrep(ea)%mat(:,:,n+1:n+n)
      end if

      if (self%ID_symbol=="th") then
         self%irrep(3)%mat(:,:, 1:12) =  self%irrep(6)%mat(:,:, 1:12)
         self%irrep(3)%mat(:,:,13:24) =  self%irrep(6)%mat(:,:, 1:12)
      else
         fb = fb_irrep(id)
         fa = fa_irrep(id)
         self%irrep(fb)%mat(:,:, 1:12) =  self%irrep(fa)%mat(:,:, 1:12)
         self%irrep(fb)%mat(:,:,13:24) = -self%irrep(fa)%mat(:,:,13:24)
         if (self%ID_symbol=="oh") then
            self%irrep(10)%mat(:,:,25:48) = -self%irrep(10)%mat(:,:, 1:24)
            self%irrep(4)%mat(:,:, 1:24)  =  self%irrep(9)%mat(:,:, 1:24)
            self%irrep(5)%mat(:,:, 1:24)  =  self%irrep(10)%mat(:,:, 1:24)
            self%irrep(4)%mat(:,:,25:48)  =  self%irrep(9)%mat(:,:, 1:24)
            self%irrep(5)%mat(:,:,25:48)  =  self%irrep(10)%mat(:,:, 1:24)
         end if
      end if

   end subroutine

   subroutine make_character_table(self)
    type(pointgroup_type) :: self
    ! MAke the character table
      integer(kind=kind(1)) :: n,i

      do i = 1, self%n_irrep
         call create_(self%irrep(i)%character,self%order)
         do n = 1, self%order
            self%irrep(i)%character(n) = trace_(self%irrep(i)%mat(:,:,n))
         end do
      end do

   end subroutine

   subroutine make_irrep_labels(self)
    type(pointgroup_type) :: self
    ! Make the names for the symmetry irreducible representations
    ! The irrep object must already be created and dimensioned correctly.
      character(41) :: warn_str

      warn_str = "can't label irreps for groups larger than"
      call warn_if_(tonto,self%ID_symbol=="cn"  .and. self%axis_order>9,warn_str // " C9")
      call warn_if_(tonto,self%ID_symbol=="s2n" .and. self%axis_order>8,warn_str // " S8")
      call warn_if_(tonto,self%ID_symbol=="cnh" .and. self%axis_order>6,warn_str // " C6h")
      call warn_if_(tonto,self%ID_symbol=="cnv" .and. self%axis_order>6,warn_str // " C6v")
      call warn_if_(tonto,self%ID_symbol=="dn"  .and. self%axis_order>6,warn_str // " D6")
      call warn_if_(tonto,self%ID_symbol=="dnh" .and. self%axis_order>8,warn_str // " D8h")
      call warn_if_(tonto,self%ID_symbol=="dnd" .and. self%axis_order>6,warn_str // " D6d")
      self%irrep(:)%label = "?"
      select case (self%ID_symbol)
         case ("c1")
            self%irrep(:)%label = (/"A   "/)
         case ("cs")
            self%irrep(:)%label = (/"A'  ", "A'' "/)
         case ("ci")
            self%irrep(:)%label = (/"Ag  ", "Au  "/)
         case ("cn")
            select case (self%axis_order)
            case (1)
               self%irrep(:)%label = (/"A   "/)
            case (2)
               self%irrep(:)%label = (/"A   ", "B   "/)
            case (3)
               self%irrep(:)%label = (/"A   ", "E   "/)
            case (4)
               self%irrep(:)%label = (/"A   ", "B   ", "E   "/)
            case (5)
               self%irrep(:)%label = (/"A   ", "E1  ", "E2  "/)
            case (6)
               self%irrep(:)%label = (/"A   ", "B   ", "E1  ", "E2  "/)
            case (7)
               self%irrep(:)%label = (/"A   ", "E1  ", "E2  ", "E3  "/)
            case (8)
               self%irrep(:)%label = (/"A   ", "B   ", "E1  ", "E2  ", "E3  "/)
            case (9)
               self%irrep(:)%label = (/"A   ", "E1  ", "E2  ", "E3  ", "E4  "/)
            end select
         case ("s2n")
            select case (self%axis_order)
            case (1)
               self%irrep(:)%label = (/"Ag  ", "Au  "/)
            case (2)
               self%irrep(:)%label = (/"A   ", "B   ", "E   "/)
            case (3)
               self%irrep(:)%label = (/"Ag  ", "Au  ", "Eu  ", "Eg  "/)
            case (4)
               self%irrep(:)%label = (/"A   ", "B   ", "E1  ", "E2  ", "E3  "/)
            end select
         case ("cnh")
            select case (self%axis_order)
            case (1)
               self%irrep(:)%label = (/"A'  ","A'' "/)
            case (2)
               self%irrep(:)%label = (/"Ag  ","Au  ","Bu  ","Bg  "/)
            case (3)
               self%irrep(:)%label = (/"A'  ","A'' ","E'' ","E'  "/)
            case (4)
               self%irrep(:)%label = (/"Ag  ","Au  ","Bg  ","Bu  ", &
                                   "Eg  ","Eu  "/)
            case (5)
               self%irrep(:)%label = (/"A'  ","A'' ", &
                                   "E1''","E1' ","E2''", "E2' "/)
            case (6)
               self%irrep(:)%label = (/"Ag  ","Au  ","Bu  ","Bg  ", &
                                   "E1g ", "E1u ","E2u ","E2g "/)
            end select
         case ("cnv")
            select case (self%axis_order)
            case (1)
               self%irrep(:)%label = (/"A'  ","A'' "/)
            case (2)
               self%irrep(:)%label = (/"A1  ","A2  ","B1  ","B2  "/)
            case (3)
               self%irrep(:)%label = (/"A1  ","A2  ","E   "/)
            case (4)
               self%irrep(:)%label = (/"A1  ","A2  ","B1  ","B2  ","E   "/)
            case (5)
               self%irrep(:)%label = (/"A1  ","A2  ","E1  ","E2  "/)
            case (6)
               self%irrep(:)%label = (/"A1  ","A2  ","B1  ","B2  ","E1  ","E2  "/)
            end select
         case ("dn")
            select case (self%axis_order)
            case (1)
               self%irrep(:)%label = (/"A1  ","B   "/)
            case (2)
               self%irrep(:)%label = (/"A   ","B1  ","B3  ","B2  "/)
            case (3)
               self%irrep(:)%label = (/"A1  ","A2  ","E   "/)
            case (4)
               self%irrep(:)%label = (/"A1  ","A2  ","B1  ","B2  ","E   "/)
            case (5)
               self%irrep(:)%label = (/"A1  ","A2  ","E1  ","E2  "/)
            case (6)
               self%irrep(:)%label = (/"A1  ","A2  ","B1  ","B2  ","E1  ","E2  "/)
            end select
         case ("dnh")
            select case (self%axis_order)
            case (1)
               self%irrep(:)%label = (/"A1  ","A2  ","B1  ","B2  "/)
            case (2)
               self%irrep(:)%label = (/"Ag  ","Au  ","B3u ","B3g ","B1g ", "B1u ","B2u ","B2g "/)
            case (3)
               self%irrep(:)%label = (/"A1' ","A1''","A2' ","A2''","E'' ", "E'  "/)
            case (4)
               self%irrep(:)%label = (/"A1g ","A1u ","B1g ","B1u ", &
                                   "A2g ","A2u ","B2g ","B2u ", &
                                   "Eg  ","Eu  "/)
            case (5)
               self%irrep(:)%label = (/"A1' ","A1''","A2' ","A2''", &
                                   "E1''","E1' ","E2''","E2' "/)
            case (6)
               self%irrep(:)%label = (/"A1g ","A1u ","B1u ","B1g ", &
                                   "A2g ","A2u ","B2u ","B2g ", &
                                   "E1g ","E1u ","E2u ","E2g "/)
            case (8)
               self%irrep(:)%label = (/"A1g ","A1u ","A2g ","A2u ", &
                                   "B1g ","B1u ","B2g ","B2u ", &
                                   "E1g ","E1u ","E2u ","E2g ","E3g ","E3u "/)
            case (7)
               call die_(tonto,"POINTGROUP:make_irrep_labels ... No such group as d7h")
            end select
         case ("dnd")
            select case (self%axis_order)
            case (1)
               self%irrep(:)%label = (/"Ag  ","Au  ","Bu  ","Bg  "/)
            case (2)
               self%irrep(:)%label = (/"A1  ","B2  ","B1  ","A2  ","E   "/)
            case (3)
               self%irrep(:)%label = (/"A1g ","A2u ","A1u ","A2g ","Eu  ","Eg  "/)
            case (4)
               self%irrep(:)%label = (/"A1  ","A2  ","B1  ","B2  ", &
                                   "E1  ","E2  ","E3  "/)
            case (5)
               self%irrep(:)%label = (/"A1g ","A1u ","A2u ","A2g ", &
                                   "E2u ","E1g ","E1u ","E2g "/)
            case (6)
               self%irrep(:)%label = (/"A1  ","B2  ","B1  ","A2  ", &
                                   "E1  ","E2  ","E3  ","E4  ","E5  "/)
            end select
         case ("t")
            self%irrep(:)%label = (/"A   ","E   ","F   "/)
         case ("th")
            self%irrep(:)%label = (/"Ag  ","Eg  ","Fg  ",  &
                                "Au  ","Eu  ","Fu  "/)
         case ("td")
            self%irrep(:)%label = (/"A1  ","A2  ","E   ","F1  ","F2  "/)
         case ("o")
            self%irrep(:)%label = (/"A1  ","A2  ","E   ","F1  ","F2  "/)
         case ("oh")
            self%irrep(:)%label = (/"A1g ","A2g ","Eg  ","F1g ","F2g ", &
                                "A1u ","A2u ","Eu  ","F1u ","F2u "/)
         case ("i")
            self%irrep(:)%label = (/"A   ","F1  ","F2  ","G   ","H   "/)
         case ("ih")
            self%irrep(:)%label = (/"Ag  ","F1g ","F2g ","Gg  ","Hg  ", &
                                "Au  ","F1u ","F2u ","Gu  ","Hu  "/)
      end select

   end subroutine

   subroutine put(self,out)
    type(pointgroup_type) :: self
    ! Display the pointgroup data to output file "out".
      type(textfile_type), optional, target :: out
      type(textfile_type), pointer :: out1
      integer(kind=kind(1)) :: i,n,dim
      integer(kind=kind(1)) :: block,n_block,f,l

      if (present(out)) then
        out1 => out
      else
        out1 => stdout
      end if
      call flush_(out1)
      call put_text_(out1,"POINTGROUP output:",flush=2)
      call show_(out1,"Symbol                  =",self%symbol, int_width=.true.)
      call show_(out1,"ID_symbol               =",self%ID_symbol, int_width=.true.)
      call show_(out1,"ID_number               =",self%ID_number)
      call show_(out1,"Principal axis order    =",self%axis_order)
      call show_(out1,"Order                   =",self%order)
      call show_(out1,"No. of Irreps           =",self%n_irrep)
      call show_(out1,"No. of Irrep generators =",self%n_gen)
      call show_(out1,"Has complex irreps?     =",self%has_complex_irreps)

      call flush_(out1)
      call put_text_(out1,"List of inverse group elements :",flush=2)
      call put_(out1,self%inverse)

      call flush_(out1)
      call put_text_(out1,"Group multiplication table :",flush=2)
      call put_(out1,self%table)

      call flush_(out1)
      call put_text_(out1,"Character Table :")
      n_block = (self%order-1)/out1%n_fields + 1
      do block = 1,n_block
         f = 1 + (block-1)*out1%n_fields
         l = min(f+out1%n_fields-1,self%order)
         call flush_(out1)                           ! Banner
         call put_dash_(out1,int_fields=1,real_fields=min(out1%n_fields,self%order),flush=1)
         call tab_(out1,int_fields=1)
         do n = f,l
            call put_(out1,n,real_width=.true.)
         end do
         call flush_(out1)
         call put_dash_(out1,int_fields=1,real_fields=min(out1%n_fields,self%order),flush=1)
         do i = 1,self%n_irrep                      ! The actual table
            call put_text_(out1,self%irrep(i)%label,int_width=.true.)
            do n = f,l
               call put_(out1,self%irrep(i)%character(n))
            end do
            call flush_(out1)
         end do
         call put_dash_(out1,int_fields=1,real_fields=min(out1%n_fields,self%order),flush=1)
      end do

      call flush_(out1)
      call put_text_(out1,"3x3 Representation matrices :",flush=1)
      do n = 1,self%order
        call flush_(out1)
        call put_text_(out1,"Matrix number " // to_str_(n) ,flush=1)
        call put_(out1,self%mat(:,:,n))
      end do

      call flush_(out1)
      call put_text_(out1,"Irrep matrices :",flush=1)
      do i = 1,self%n_irrep
        call flush_(out1)
        dim = self%irrep(i)%dimension
        call put_text_(out1,"Irrep " // trim( self%irrep(i)%label) // ", dimension " &
                    // trim( to_str_(dim)) // ":" ,flush=1)
        if (dim==1) then
           call put_(out1,self%irrep(i)%mat(1,1,:))
        else
           do n = 1,self%order
              call put_text_(out1,"Matrix number " // to_str_(n) ,flush=1)
              call put_(out1,self%irrep(i)%mat(:,:,n))
           end do
        end if
      end do

   end subroutine

end
