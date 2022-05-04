!---------------------------------------------------------------------------
!
!  GAUSSIAN2 : Pairs of gaussian functions
!
! Copyright (C) Dylan Jayatilaka, 1998
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
! $Id: gaussian2.foo,v 1.21.2.3 2004/04/21 12:45:01 reaper Exp $
!---------------------------------------------------------------------------

module GAUSSIAN2_MODULE

   use TYPES_MODULE
   use SYSTEM_MODULE

   use REALVEC_MODULE, only: normalising_factors_
   use REALVEC_MODULE, only: create_
   use REALVEC_MODULE, only: destroy_

   use RYS_MODULE, only: create_
   use RYS_MODULE, only: weight_
   use RYS_MODULE, only: get_weights_and_u_roots_
   use RYS_MODULE, only: root_
   use RYS_MODULE, only: destroy_

   use INT_MODULE, only: n_comp_
   use INT_MODULE, only: make_gaussian_xyz_indices_
   use INT_MODULE, only: make_gaussian_xyz_powers_

   use GAUSSIAN_MODULE, only: n_comp_

   use INTMAT_MODULE, only: create_
   use INTMAT_MODULE, only: destroy_

   use REALMAT3_MODULE, only: create_
   use REALMAT3_MODULE, only: destroy_

   use INTVEC_MODULE, only: create_
   use INTVEC_MODULE, only: destroy_

   use TEXTFILE_MODULE, only: stdin
   use TEXTFILE_MODULE, only: stdout
   use TEXTFILE_MODULE, only: put_
   use TEXTFILE_MODULE, only: text_
   use TEXTFILE_MODULE, only: put_dash_
   use TEXTFILE_MODULE, only: put_text_
   use TEXTFILE_MODULE, only: flush_
   use TEXTFILE_MODULE, only: show_

   use REALMAT_MODULE, only: create_
   use REALMAT_MODULE, only: destroy_

   use CPXMAT3_MODULE, only: create_
   use CPXMAT3_MODULE, only: destroy_

   use CPXVEC_MODULE, only: create_
   use CPXVEC_MODULE, only: destroy_
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

   public    make_nuclear_attraction_ints_
   interface make_nuclear_attraction_ints_
      module procedure make_nuclear_attraction_ints
      module procedure make_nuclear_attraction_ints_1
   end interface

   public    make_T_1st_deriv_ints_
   interface make_T_1st_deriv_ints_
      module procedure make_T_1st_deriv_ints
   end interface

   public    make_e_coeff_
   interface make_e_coeff_
      module procedure make_e_coeff
   end interface

   public    make_solenoidal_jd_ints_
   interface make_solenoidal_jd_ints_
      module procedure make_solenoidal_jd_ints
   end interface

   public    make_ft_dab_
   interface make_ft_dab_
      module procedure make_ft_dab
   end interface

   public    differentiate_
   interface differentiate_
      module procedure differentiate
   end interface

   private    make_ft_general_
   interface make_ft_general_
      module procedure make_ft_general
   end interface

   public    make_E_field_ints_
   interface make_E_field_ints_
      module procedure make_E_field_ints
      module procedure make_E_field_ints_1
   end interface

   private    make_e_coeff_derivative_
   interface make_e_coeff_derivative_
      module procedure make_e_coeff_derivative
   end interface

   private    make_ft_00_
   interface make_ft_00_
      module procedure make_ft_00
   end interface

   public    put_
   interface put_
      module procedure put
   end interface

   public    make_kinetic_ints_
   interface make_kinetic_ints_
      module procedure make_kinetic_ints
   end interface

   public    put_e_coeff_
   interface put_e_coeff_
      module procedure put_e_coeff
   end interface

   public    normalise_
   interface normalise_
      module procedure normalise
   end interface

   public    make_solenoidal_jp_ints_
   interface make_solenoidal_jp_ints_
      module procedure make_solenoidal_jp_ints
   end interface

   public    make_E_gradient_ints_
   interface make_E_gradient_ints_
      module procedure make_E_gradient_ints
      module procedure make_E_gradient_ints_1
   end interface

   public    make_quadrupole_ints_
   interface make_quadrupole_ints_
      module procedure make_quadrupole_ints
      module procedure make_quadrupole_ints_1
   end interface

   public    make_ft_nabla_
   interface make_ft_nabla_
      module procedure make_ft_nabla
   end interface

   public    copy_
   interface copy_
      module procedure copy
   end interface

   public    set_
   interface set_
      module procedure set
      module procedure set_1
      module procedure set_2
   end interface

   public    create_
   interface create_
      module procedure create
      module procedure create_1
   end interface

   public    make_ft_r_
   interface make_ft_r_
      module procedure make_ft_r
   end interface

   public    create_copy_
   interface create_copy_
      module procedure create_copy
   end interface

   public    make_NA_1st_deriv_ints_
   interface make_NA_1st_deriv_ints_
      module procedure make_NA_1st_deriv_ints
   end interface

   public    make_dipole_ints_
   interface make_dipole_ints_
      module procedure make_dipole_ints
      module procedure make_dipole_ints_1
   end interface

   public    make_overlap_ints_
   interface make_overlap_ints_
      module procedure make_overlap_ints
      module procedure make_overlap_ints_1
   end interface

   public    make_q_field_ints_
   interface make_q_field_ints_
      module procedure make_q_field_ints
   end interface

   public    make_magnetic_jp_ints_
   interface make_magnetic_jp_ints_
      module procedure make_magnetic_jp_ints
   end interface

   public    make_irrotational_jd_ints_
   interface make_irrotational_jd_ints_
      module procedure make_irrotational_jd_ints
   end interface

   public    make_spin_orbit_B_ints_
   interface make_spin_orbit_B_ints_
      module procedure make_spin_orbit_B_ints
   end interface

   public    make_L_ints_
   interface make_L_ints_
      module procedure make_L_ints
   end interface

   public    make_magnetic_S_ints_
   interface make_magnetic_S_ints_
      module procedure make_magnetic_S_ints
      module procedure make_magnetic_S_ints_1
   end interface

   public    make_ft_component_
   interface make_ft_component_
      module procedure make_ft_component
   end interface

   public    destroy_
   interface destroy_
      module procedure destroy
   end interface

   public    make_irrotational_jp_ints_
   interface make_irrotational_jp_ints_
      module procedure make_irrotational_jp_ints
   end interface

   public    make_spin_orbit_ints_
   interface make_spin_orbit_ints_
      module procedure make_spin_orbit_ints
   end interface

   public    make_octupole_ints_
   interface make_octupole_ints_
      module procedure make_octupole_ints
      module procedure make_octupole_ints_1
   end interface

   public    make_S_1st_deriv_ints_
   interface make_S_1st_deriv_ints_
      module procedure make_S_1st_deriv_ints
   end interface

   private    make_ft_dab_component_
   interface make_ft_dab_component_
      module procedure make_ft_dab_component
   end interface

   public    make_ft_
   interface make_ft_
      module procedure make_ft
      module procedure make_ft_1
   end interface

   real(kind=kind(1.0d0)), private :: pi212  = 1.1283791670955d+0

!  The i-th point and weight for n-point Gauss-Hermite quadrature

   integer(kind=kind(1)), dimension(9), private :: first_pt = (/ 1,2,4, 7,11,16,22,29,37 /)
   integer(kind=kind(1)), dimension(9), private :: last_pt = (/ 1,3,6,10,15,21,28,36,45 /)

   real(kind=kind(1.0d0)), dimension(45), private :: gauss_hermite_pt

   data gauss_hermite_pt/                                                                      &
       0.000000000000000e+0,                                                                   &
 ! H_11
      -0.707106781186548e+0, 0.707106781186548e+0,                                             &
 ! H_12 H_22
      -1.224744871391590e+0, 0.000000000000000e+0, 1.224744871391590e+0,                       &
 ! H_13 H_23 H_33
      -1.650680123885780e+0,-0.524647623275290e+0, 0.524647623275290e+0, 1.650680123885780e+0, &
 ! H_*4
      -2.020182870456090e+0,-0.958572464613819e+0, 0.000000000000000e+0, 0.958572464613819e+0, &
 ! H_*5
       2.020182870456090e+0,                                                                   &
      -2.350604973674000e+0,-1.335849074014000e+0,-0.436077411928000e+0, 0.436077411928000e+0, &
 ! H_*6
       1.335849074014000e+0, 2.350604973674000e+0,                                             &
      -2.651961356835233e+0,-1.673551628767471e+0,-0.816287882858965e+0, 0.000000000000000e+0, &
 ! H_*7
       0.816287882858965e+0, 1.673551628767471e+0, 2.651961356835233e+0,                       &
      -2.930637420257244e+0,-1.981656756695843e+0,-1.157193712446780e+0,-0.381186990207322e+0, &
 ! H_*8
       0.381186990207322e+0, 1.157193712446780e+0, 1.981656756695843e+0, 2.930637420257244e+0, &
      -3.190993201781528e+0,-2.266580584531843e+0,-1.468553289216668e+0,-0.723551018752838e+0, &
 ! H_*9
       0.000000000000000e+0, 0.723551018752838e+0, 1.468553289216668e+0, 2.266580584531843e+0, &
       3.190993201781528e+0/

   real(kind=kind(1.0d0)), dimension(45), private :: gauss_hermite_wt

   data gauss_hermite_wt/                                                                      &
       1.772453850905520e+0,                                                                   &
 ! W_11
       0.886226925452800e+0, 0.886226925452800e+0,                                             &
 ! W_12 W_22
       0.295408975150900e+0, 1.181635900604000e+0, 0.295408975150900e+0,                       &
 ! W_13 W_23 W_33
       8.131283544725000e-2, 8.049140900055000e-1, 8.049140900055000e-1, 8.131283544725000e-2, &
 ! W_*4
       1.995324205905000e-2, 3.936193231522000e-1, 9.453087204829000e-1, 3.936193231522000e-1, &
 ! W_*5
       1.995324205905000e-2,                                                                   &
       4.530009905509000e-3, 1.570673203229000e-1, 7.246295952244000e-1, 7.246295952244000e-1, &
 ! W_*6
       1.570673203229000e-1, 4.530009905509000e-3,                                             &
       9.717812450995000e-4, 5.451558281913000e-2, 4.256072526101000e-1, 8.102646175568000e-1, &
 ! W_*7
       4.256072526101000e-1, 5.451558281913000e-2, 9.717812450995000e-4,                       &
       1.996040722114000e-4, 1.707798300741000e-2, 2.078023258149000e-1, 6.611470125582000e-1, &
 ! W_*8
       6.611470125582000e-1, 2.078023258149000e-1, 1.707798300741000e-2, 1.996040722114000e-4, &
       3.960697726326000e-5, 4.943624275537000e-3, 8.847452739438000e-2, 4.326515590026000e-1, &
 ! W_*9
       7.202352156061000e-1, 4.326515590026000e-1, 8.847452739438000e-2, 4.943624275537000e-3, &
       3.960697726326000e-5/

contains

   subroutine create(self)
    type(gaussian2_type) :: self
    ! Create a gaussian pair
      pointer :: self

      nullify(self)
      allocate(self)

   end subroutine

   subroutine create_1(self,Ga,Gb)
    type(gaussian2_type) :: self
    ! Create a gaussian pair, and optionally set it to "Ga" and "Gb"
      pointer :: self
      type(gaussian_type) :: Ga,Gb

      nullify(self)
      allocate(self)

      call set_(self,Ga,Gb)

   end subroutine

   subroutine destroy(self)
    type(gaussian2_type) :: self
    ! Destroy a guassian pair
      pointer :: self

      if (.not. associated(self)) then;   return; end if

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

   subroutine create_copy(self,G)
    type(gaussian2_type) :: self
    ! Create a copy of "G"
      pointer :: self
       type(gaussian2_type) :: G

      call create_(self)
      call copy_(self,G)

   end subroutine

   subroutine copy(self,G)
    type(gaussian2_type) :: self
    ! Set the gaussian pair object to "G"
      type(gaussian2_type) :: G

      self = G

   end subroutine

   subroutine set(self,Ga,Gb)
    type(gaussian2_type) :: self
    ! Set the gaissian pair object to "Ga" and "Gb"
      type(gaussian_type) :: Ga,Gb

      self%a%l   = Ga%l
      self%a%pos = Ga%pos
      self%a%ex  = Ga%ex
      self%b%l   = Gb%l
      self%b%pos = Gb%pos
      self%b%ex  = Gb%ex

   end subroutine

   subroutine set_1(self,l_a,pos_a,ex_a,l_b,pos_b,ex_b)
    type(gaussian2_type) :: self
    ! Set a gaussian object
      integer(kind=kind(1)) :: l_a,l_b
      real(kind=kind(1.0d0)), dimension(3) :: pos_a,pos_b
      real(kind=kind(1.0d0)) :: ex_a,ex_b

      self%a%l   = l_a
      self%a%pos = pos_a
      self%a%ex  = ex_a
      self%b%l   = l_b
      self%b%pos = pos_b
      self%b%ex  = ex_b

   end subroutine

   subroutine set_2(self,ex_a,ex_b)
    type(gaussian2_type) :: self
    ! Set the exponents of the pair
      real(kind=kind(1.0d0)), optional :: ex_a,ex_b

      if (present(ex_a)) self%a%ex = ex_a
      if (present(ex_b)) self%b%ex = ex_b

   end subroutine

   pure subroutine make_e_coeff(self,e,comp)
    type(gaussian2_type) :: self
    ! Return the McMurchie-Davidson "e" coefficients for component "comp"
    ! (c) dylan jayatilaka, april 1995
    ! Checked using mathematica, may 1995
      intent(in) :: self
      integer(kind=kind(1)), intent(in) :: comp
      real(kind=kind(1.0d0)), dimension(0:,0:,0:), intent(out) :: e ! Generic e coefficient table
      integer(kind=kind(1)) :: t,a,b,ap,am,bp,bm,abp,ab,abm,max,l_a,l_b
      real(kind=kind(1.0d0)) :: R,gamma,g1,g2,a1,b1,e000
      l_a = self%a%l
      l_b = self%b%l
      max = l_a+l_b
      R = self%a%pos(comp)-self%b%pos(comp)
      gamma = self%a%ex + self%b%ex
      g1 = 1/gamma
      b1 = self%b%ex*g1*R
      e000 = exp(-self%a%ex*b1*R)
      e(0,0,0) = e000
      if (max==0) then;  return; end if ! Return for e000
      g2 = 0.50d0*g1
      a1 = self%a%ex*g1*R
      if (l_a>=1) then
         e(1,1,0) =  g2*e000
         e(0,1,0) = -b1*e000
      end if
      if (l_b>=1) then
         e(1,0,1) =  g2*e000
         e(0,0,1) =  a1*e000
      end if
      if (max==1) then;  return; end if ! Return for eXX1
      do a = 1,l_a-1                    ! Consider case b=0
         ap = a + 1
         am = a - 1
         e(ap,ap,0) =  g2*e( a,a,0)
         e( a,ap,0) =  g2*e(am,a,0) - b1*e(a,a,0)
         e( 0,ap,0) = -b1*e( 0,a,0) +    e(1,a,0)
         do t = 1,am
            e(t,ap,0) = g2*e(t-1,a,0) - b1*e(t,a,0) + (t+1)*e(t+1,a,0)
         end do
      end do
      do b = 1,l_b-1                    ! Consider case a=0
         bp = b + 1
         bm = b - 1
         e(bp,0,bp) =  g2*e( b,0,b)
         e( b,0,bp) =  g2*e(bm,0,b) + a1*e(b,0,b)
         e( 0,0,bp) =  a1*e( 0,0,b) +    e(1,0,b)
         do t = 1,bm
            e(t,0,bp) = g2*e(t-1,0,b) + a1*e(t,0,b) + (t+1)*e(t+1,0,b)
         end do
      end do
      do b = 1,l_b                      ! Now do the rest, a/=0 & b/=0
         do a = 0,l_a-1
            ab  = a + b
            ap  = a + 1
            abp = ab + 1
            abm = ab - 1
            e(abp,ap,b) =  g2*e( ab,a,b)
            e( ab,ap,b) =  g2*e(abm,a,b) - b1*e(ab,a,b)
            e(  0,ap,b) = -b1*e(  0,a,b) +    e( 1,a,b)
            do t = 1,abm
               e(t,ap,b) = g2*e(t-1,a,b) - b1*e(t,a,b) + (t+1)*e(t+1,a,b)
            end do
         end do
      end do

   end subroutine

   pure subroutine make_e_coeff_derivative(self,e1,comp,e0)
    type(gaussian2_type) :: self
    ! Return the derivative McMurchie-Davidson "e1" coefficients for
    ! component "comp" with repect to R = .a.pos - .b.pos. The zero order
    ! derivative 2.718281828459045d0 coefficients "e0" for the same component must be supplied.
    ! This routine is based on Helgaker & Taylor, TCA 83, p. 177 (1992)
    ! (c) dylan jayatilaka, may 1998
      intent(in) :: self
      integer(kind=kind(1)), intent(in) :: comp
      real(kind=kind(1.0d0)), dimension(0:,0:,0:), intent(in) :: e0
      real(kind=kind(1.0d0)), dimension(0:,0:,0:), intent(out) :: e1 ! Generic e coefficient table
      integer(kind=kind(1)) :: t,a,b,ap,am,bp,bm,abp,ab,abm,max
      real(kind=kind(1.0d0)) :: R,gamma,g1,g2,a0,a1,b0,b1,e0000,e1000
      max = self%a%l+self%b%l
      R = self%a%pos(comp)-self%b%pos(comp)
      gamma = self%a%ex + self%b%ex
      g1 = 1/gamma
      b0 = self%b%ex*g1
      b1 = b0*R
      e0000  = e0(0,0,0)
      e1000 = -2*self%a%ex*b1*e0000
      e1(0,0,0) = e1000
      if (max==0) then;  return; end if ! Return for e000
      a0 = self%a%ex*g1
      a1 = a0*R
      g2 = 0.50d0*g1
      if (self%a%l>=1) then
         e1(1,1,0) =  g2*e1000
         e1(0,1,0) = -b1*e1000 - b0*e0000
      end if
      if (self%b%l>=1) then
         e1(1,0,1) =  g2*e1000
         e1(0,0,1) =  a1*e1000 + a0*e0000
      end if
      if (max==1) then;  return; end if ! Return for eXX1
      do a = 1,self%a%l-1                    ! Consider case b=0
         ap = a + 1
         am = a - 1
         e1(ap,ap,0) =  g2*e1( a,a,0)
         e1( a,ap,0) =  g2*e1(am,a,0) - b1*e1(a,a,0) - b0*e0(a,a,0)
         e1( 0,ap,0) = -b1*e1( 0,a,0) - b0*e0(0,a,0) +    e1(1,a,0)
         do t = 1,am
            e1(t,ap,0) = g2*e1(t-1,a,0) - b1*e1(t,a,0) - b0*e0(t,a,0) + (t+1)*e1(t+1,a,0)
         end do
      end do
      do b = 1,self%b%l-1                    ! Consider case a=0
         bp = b + 1
         bm = b - 1
         e1(bp,0,bp) =  g2*e1( b,0,b)
         e1( b,0,bp) =  g2*e1(bm,0,b) + a1*e1(b,0,b) + a0*e0(b,0,b)
         e1( 0,0,bp) =  a1*e1( 0,0,b) + a0*e0(0,0,b) +    e1(1,0,b)
         do t = 1,bm
            e1(t,0,bp) = g2*e1(t-1,0,b) + a1*e1(t,0,b) + a0*e0(t,0,b) + (t+1)*e1(t+1,0,b)
         end do
      end do
      do b = 1,self%b%l                      ! Now do the rest, a/=0 & b/=0
         do a = 0,self%a%l-1
            ab  = a + b
            ap  = a + 1
            abp = ab + 1
            abm = ab - 1
            e1(abp,ap,b) =  g2*e1( ab,a,b)
            e1( ab,ap,b) =  g2*e1(abm,a,b) - b1*e1(ab,a,b) - b0*e0(ab,a,b)
            e1(  0,ap,b) = -b1*e1(  0,a,b) - b0*e0( 0,a,b) +    e1( 1,a,b)
            do t = 1,abm
               e1(t,ap,b) = g2*e1(t-1,a,b) - b1*e1(t,a,b) - b0*e0(t,a,b) + (t+1)*e1(t+1,a,b)
            end do
         end do
      end do

   end subroutine

   subroutine make_ft_component(self,res,comp,k_pts,k_max)
    type(gaussian2_type) :: self
    ! Do the Fourier transform of component "comp" of the guassian pair
    ! evaluated at the points "k_pts"
      intent(in) :: self
      integer(kind=kind(1)), intent(in) :: comp,k_max
      real(kind=kind(1.0d0)), dimension(:), intent(in) :: k_pts
      complex(kind=kind((1.0d0,1.0d0))), dimension(1:,0:,0:), intent(out) :: res
      real(kind=kind(1.0d0)) :: kn,kn_t
      integer(kind=kind(1)) :: a,b,t,t_max,n
      real(kind=kind(1.0d0)), dimension(:,:,:), pointer :: e
      real(kind=kind(1.0d0)), dimension(:), pointer :: val1,val2,k2 ! Local variables
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: k1

      t_max = self%a%l+self%b%l
      call create_(e,(/0,t_max/),(/0,self%a%l/),(/0,self%b%l/))
      call make_e_coeff_(self,e,comp)
      select case (t_max)
        case (0)
          res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
        case (1)
          if (self%a%l==1) then  ! ps
            res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
            res(:,1,0) = cmplx(e(0,1,0),e(1,1,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
          else  !              sp
            res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
            res(:,0,1) = cmplx(e(0,0,1),e(1,0,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
          end if
        case (2)
          select case (self%a%l)
            case (0)  ! sd
              res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
              res(:,0,1) = cmplx(e(0,0,1),e(1,0,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,0,2) = cmplx(e(0,0,2)-e(2,0,2)*k_pts(:)*k_pts(:),e(1,0,2)*k_pts(:),kind=kind((1.0d0,1.0d0)))
            case (1)  ! pp
              res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
              res(:,0,1) = cmplx(e(0,0,1),e(1,0,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,1,0) = cmplx(e(0,1,0),e(1,1,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,1,1) = cmplx(e(0,1,1)-e(2,1,1)*k_pts(:)*k_pts(:),e(1,1,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
            case (2)  ! ds
              res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
              res(:,1,0) = cmplx(e(0,1,0),e(1,1,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,2,0) = cmplx(e(0,2,0)-e(2,2,0)*k_pts(:)*k_pts(:),e(1,2,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
          end select
        case (3)
          select case (self%a%l)
            case (0)  ! sf
              call create_(k2,k_max)
              k2(:) = k_pts(:)*k_pts(:)
              res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
              res(:,0,1) = cmplx(e(0,0,1),e(1,0,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,0,2) = cmplx(e(0,0,2)-e(2,0,2)*k2(:),e(1,0,2)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,0,3) = cmplx(e(0,0,3)-e(2,0,3)*k2(:),(e(1,0,3)-e(3,0,3)*k2(:))*k_pts(:),kind=kind((1.0d0,1.0d0)))
              call destroy_(k2)
            case (1)  ! pd
              call create_(k2,k_max)
              k2(:) = k_pts(:)*k_pts(:)
              res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
              res(:,0,1) = cmplx(e(0,0,1),e(1,0,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,1,0) = cmplx(e(0,1,0),e(1,1,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,0,2) = cmplx(e(0,0,2)-e(2,0,2)*k2(:),e(1,0,2)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,1,1) = cmplx(e(0,1,1)-e(2,1,1)*k2(:),e(1,1,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,1,2) = cmplx(e(0,1,2)-e(2,1,2)*k2(:),(e(1,1,2)-e(3,1,2)*k2(:))*k_pts(:),kind=kind((1.0d0,1.0d0)))
              call destroy_(k2)
            case (2)  ! dp
              call create_(k2,k_max)
              k2(:) = k_pts(:)*k_pts(:)
              res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
              res(:,0,1) = cmplx(e(0,0,1),e(1,0,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,1,0) = cmplx(e(0,1,0),e(1,1,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,1,1) = cmplx(e(0,1,1)-e(2,1,1)*k2(:),e(1,1,1)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,2,0) = cmplx(e(0,2,0)-e(2,2,0)*k2(:),e(1,2,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,2,1) = cmplx(e(0,2,1)-e(2,2,1)*k2(:),(e(1,2,1)-e(3,2,1)*k2(:))*k_pts(:),kind=kind((1.0d0,1.0d0)))
              call destroy_(k2)
            case (3)  ! fs
              call create_(k2,k_max)
              k2(:) = k_pts(:)*k_pts(:)
              res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
              res(:,1,0) = cmplx(e(0,1,0),e(1,1,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,2,0) = cmplx(e(0,2,0)-e(2,2,0)*k2(:),e(1,2,0)*k_pts(:),kind=kind((1.0d0,1.0d0)))
              res(:,3,0) = cmplx(e(0,3,0)-e(2,3,0)*k2(:),(e(1,3,0)-e(3,3,0)*k2(:))*k_pts(:),kind=kind((1.0d0,1.0d0)))
              call destroy_(k2)
          end select
        case default                             ! general routine
          call create_(k1,(/1,k_max/),(/0,t_max/))     ! Define k1 array containing
          do n = 1,k_max                         ! powers k^n of k_pts
            kn = k_pts(n)
            kn_t = kn           ! t=0 is 1, has been optimised out below.
            do t = 2,t_max      ! t=1 is k_pts(n), explicity written below.
              kn_t = kn_t * kn
              k1(n,t) = kn_t
            end do
          end do
          call create_(val1,k_max)    ! val1 is real part
          call create_(val2,k_max)    ! val2 is imaginary part
          do a = 0,self%a%l
            do b = 0,self%b%l
              t_max = a+b
              select case (t_max)
                case (0)
                  res(:,0,0) = cmplx(e(0,0,0),0.0d0,kind=kind((1.0d0,1.0d0)))
                case (1)
                  res(:,a,b) = cmplx(e(0,a,b),e(1,a,b)*k_pts(:),kind=kind((1.0d0,1.0d0)))
                case (2)
                  val1(:) = e(0,a,b) - e(2,a,b)*k1(:,2)
                  val2(:) = e(1,a,b)*k_pts(:)
                  res(:,a,b) = cmplx(val1(:),val2(:),kind=kind((1.0d0,1.0d0)))
                case default
                  val1(:) = e(0,a,b)          - e(2,a,b)*k1(:,2)
                  val2(:) = e(1,a,b)*k_pts(:) - e(3,a,b)*k1(:,3)
                  do t = 3,t_max-3,4
                    val1(:) = val1(:) + e(t,a,b)  *k1(:,t)  - e(t+2,a,b)*k1(:,t+2)
                    val2(:) = val2(:) + e(t+1,a,b)*k1(:,t+1)- e(t+3,a,b)*k1(:,t+3)
                  end do
                  select case (mod(t_max+1,4))
                    case (0)
                    case (1)
                      val1(:) = val1(:) + e(t_max,a,b)*k1(:,t_max)
                    case (2)
                      val1(:) = val1(:) + e(t_max-1,a,b)*k1(:,t_max-1)
                      val2(:) = val2(:) + e(t_max,a,b)  *k1(:,t_max)
                    case (3)
                      val1(:) = val1(:) + e(t_max-2,a,b)*k1(:,t_max-2) - &
                                          e(t_max,a,b)  *k1(:,t_max)
                      val2(:) = val2(:) + e(t_max-1,a,b)*k1(:,t_max-1)
                  end select
                  res(:,a,b) = cmplx(val1(:),val2(:),kind=kind((1.0d0,1.0d0)))
              end select
            end do
          end do
          call destroy_(val2)
          call destroy_(val1)
          call destroy_(k1)
      end select
      call destroy_(e)

   end subroutine

   subroutine make_ft_dab_component(self,res,comp,k_pts,k_max)
    type(gaussian2_type) :: self
    ! Do the Fourier transform of the derivative of component a minus b
    ! of a a pair of gaussians, for component "comp" of the guassian
    ! product pair, evaliated for the points "k_pts".
    ! Dimensions of res are [[1,size(k_pts)],[0,.a.l],[0,.b.l]].
      intent(in) :: self
      integer(kind=kind(1)), intent(in) :: comp,k_max
      real(kind=kind(1.0d0)), dimension(:), intent(in) :: k_pts
      complex(kind=kind((1.0d0,1.0d0))), dimension(1:,0:,0:) :: res
      real(kind=kind(1.0d0)) :: kn,fac
      integer(kind=kind(1)) :: a,b,t,t_max,n
      real(kind=kind(1.0d0)), dimension(:,:,:), pointer :: e0,e1
      real(kind=kind(1.0d0)), dimension(:), pointer :: val ! Local variables
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: k1

      t_max = self%a%l+self%b%l
      call create_(k1,(/1,k_max/),(/0,t_max+1/))  ! Define k1 array containing
      do n = 1,k_max                        ! powers k^n of k_pts
         k1(n,0) = 1.0d0
         kn = k_pts(n)
         do t = 1,t_max+1
            k1(n,t) = k1(n,t-1)*kn
         end do
      end do
      call create_(val,k_max)        ! Now evaluate; use real arithmetic where possible
      call create_(e0,(/0,self%a%l+self%b%l/),(/0,self%a%l/),(/0,self%b%l/))
      call make_e_coeff_(self,e0,comp)
      call create_(e1,(/0, self%a%l+self%b%l /),(/0, self%a%l /),(/0, self%b%l /))
      call make_e_coeff_derivative_(self,e1,comp,e0)
      do a = 0,self%a%l
         do b = 0,self%b%l
            t_max = a+b
            val = 0.0d0                          ! Do the real part first ...
            do t = 0,t_max,4
               val(:) = val(:) + e1(t,a,b)*k1(:,t)
            end do
            do t = 2,t_max,4
               val(:) = val(:) - e1(t,a,b)*k1(:,t)
            end do
            val = 2.0d0*val
            res(:,a,b) = cmplx(val(:),0.0d0,kind=kind((1.0d0,1.0d0)))
            val = 0.0d0                          ! Now do imaginary part ...
            do t = 1,t_max,4
               val(:) = val(:) + e1(t,a,b)*k1(:,t)
            end do
            do t = 3,t_max,4
               val(:) = val(:) - e1(t,a,b)*k1(:,t)
            end do
            val = 2.0d0*val
            res(:,a,b) = res(:,a,b) + cmplx(0.0d0,val(:),kind=kind((1.0d0,1.0d0)))
         end do
      end do
      fac = (self%a%ex-self%b%ex)/(self%a%ex+self%b%ex)
      do a = 0,self%a%l
         do b = 0,self%b%l
            t_max = a+b
            val = 0.0d0                          ! Do the imaginary part first ...
            do t = 0,t_max,4
               val(:) = val(:) + e0(t,a,b)*k1(:,t+1)
            end do
            do t = 2,t_max,4
               val(:) = val(:) - e0(t,a,b)*k1(:,t+1)
            end do
            val = fac*val
            res(:,a,b) = res(:,a,b) + cmplx(0.0d0,val(:),kind=kind((1.0d0,1.0d0)))
            val = 0.0d0                          ! Now do real part ...
            do t = 1,t_max,4
               val(:) = val(:) - e0(t,a,b)*k1(:,t+1)
            end do
            do t = 3,t_max,4
               val(:) = val(:) + e0(t,a,b)*k1(:,t+1)
            end do
            val = fac*val
            res(:,a,b) = res(:,a,b) + cmplx(val(:),0.0d0,kind=kind((1.0d0,1.0d0)))
         end do
      end do
      call destroy_(e1)
      call destroy_(e0)
      call destroy_(val)
      call destroy_(k1)

   end subroutine

   subroutine make_ft_dab(self,res,ft)
    type(gaussian2_type) :: self
    ! Form the Fourier transform of the derivative of the product
    ! of two gaussians w.r.t. coordinates in shell b, from the zeroth
    ! derivative Fourier transform.  Dimensions of res are
    ! [[1,size(k_pts)],[0,l_a],[0,l_b]].
      intent(in) :: self
      complex(kind=kind((1.0d0,1.0d0))), dimension(1:,0:,0:), intent(in) :: ft
      complex(kind=kind((1.0d0,1.0d0))), dimension(1:,0:,0:) :: res
      integer(kind=kind(1)) :: a,b,l_a,l_b

      l_a = ubound(ft,2)-1
      l_b = ubound(ft,3)-1
      res = 0.0d0
      do a = 0,l_a
         do b = 0,l_b
            res(:,a,b) = res(:,a,b) - 2.0d0*self%b%ex*ft(:,a,b+1)
            res(:,a,b) = res(:,a,b) + 2.0d0*self%a%ex*ft(:,a+1,b)
            if (b>0) res(:,a,b) = res(:,a,b) + b*ft(:,a,b-1)
            if (a>0) res(:,a,b) = res(:,a,b) - a*ft(:,a-1,b)
         end do
      end do

   end subroutine

   subroutine make_ft(self,ft,k_pts)
    type(gaussian2_type) :: self
    ! Calculates the Fourier transform for a product of two primitive
    ! gaussian functions, evaluated at a series of k points "k_pts".
    ! This routine is based on formula (9) in Jayatilaka, CPL 230, p. 228 (1995)
     intent(in) :: self
     real(kind=kind(1.0d0)), dimension(:,:), intent(in) :: k_pts
     complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:), intent(out) :: ft
     complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:), pointer :: ft_x,ft_y,ft_z
     complex(kind=kind((1.0d0,1.0d0))), dimension(:), pointer :: prefac
     integer(kind=kind(1)) :: k_max

     select case (self%a%l + self%b%l)
       case (0);       call make_ft_00_(self,ft(:,1,1),k_pts)
       case default
         k_max = size(k_pts,1)
         call create_(ft_x,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
         call create_(ft_y,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
         call create_(ft_z,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
         call create_(prefac,k_max)
         call make_ft_general_(self,ft,k_pts,ft_x,ft_y,ft_z,prefac)
         call destroy_(prefac)
         call destroy_(ft_z)
         call destroy_(ft_y)
         call destroy_(ft_x)
     end select

   end subroutine

   subroutine make_ft_1(self,ft,k_pts,ft_x,ft_y,ft_z,prefac)
    type(gaussian2_type) :: self
    ! Calculates the Fourier transform for a product of two primitive
    ! gaussian functions, evaluated at a series of k points "k_pts".
    ! This routine is based on formula (9) in Jayatilaka, CPL 230, p. 228 (1995)
     intent(in) :: self
     real(kind=kind(1.0d0)), dimension(:,:), intent(in) :: k_pts
     complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:), intent(out) :: ft
     complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:), pointer :: ft_x,ft_y,ft_z
     complex(kind=kind((1.0d0,1.0d0))), dimension(:), intent(out) :: prefac

     select case (self%a%l + self%b%l)
       case (0);       call make_ft_00_(self,ft(:,1,1),k_pts)
       case default;   call make_ft_general_(self,ft,k_pts,ft_x,ft_y,ft_z,prefac)
     end select

   end subroutine

   subroutine make_ft_00(self,ft,k_pts)
    type(gaussian2_type) :: self
    ! Calculates the Fourier transform for a product of two primitive
    ! gaussian functions, evaluated at a series of k points "k_pts".
    ! This routine is based on formula (9) in Jayatilaka, CPL 230, p. 228 (1995)
    ! Specialised routine for .a.l=0 and .b.l=0.
     intent(in) :: self
     real(kind=kind(1.0d0)), dimension(:,:), target :: k_pts
     complex(kind=kind((1.0d0,1.0d0))), dimension(:), intent(out) :: ft
     real(kind=kind(1.0d0)), dimension(3) :: pos
     real(kind=kind(1.0d0)), dimension(:), pointer :: k_x,k_y,k_z
     real(kind=kind(1.0d0)) :: g1_exa,g1_exb,e00,fac
     real(kind=kind(1.0d0)) :: pifac,g1,g4,dot1,dot2,k1,k2,k3,P1,P2,P3,PI_on_gamma
     integer(kind=kind(1)) :: k

     g1 = 1.0d0/(self%a%ex+self%b%ex)
     g4 = 0.25d0*g1
     PI_on_gamma = 3.141592653589793d0*g1
     pifac = sqrt(PI_on_gamma) * PI_on_gamma
     g1_exa = g1*self%a%ex
     g1_exb = g1*self%b%ex
     P1 = g1_exa*self%a%pos(1) + g1_exb*self%b%pos(1)
     P2 = g1_exa*self%a%pos(2) + g1_exb*self%b%pos(2)
     P3 = g1_exa*self%a%pos(3) + g1_exb*self%b%pos(3)
     k_x => k_pts(:,1)
     k_y => k_pts(:,2)
     k_z => k_pts(:,3)
     pos = self%a%pos - self%b%pos
     e00 = exp(-self%a%ex*self%b%ex*dot_product(pos,pos)/(self%a%ex + self%b%ex))
     fac=cmplx(pifac*e00,0.0d0,kind=kind((1.0d0,1.0d0)))
     do k = 1, size(k_pts,1)
       k1 = k_x(k);    k2 = k_y(k);    k3 = k_z(k)
       dot1 = k1*P1+k2*P2+k3*P3
       dot2 = -g4 * (k1*k1+k2*k2+k3*k3)
       ft(k) = fac*exp(cmplx(dot2,dot1,kind=kind((1.0d0,1.0d0))))
     end do

   end subroutine

   subroutine make_ft_general(self,ft,k_pts,ft_x,ft_y,ft_z,prefac)
    type(gaussian2_type) :: self
    ! Calculates the Fourier transform for a product of two primitive
    ! gaussian functions, evaluated at a series of k points "k_pts".
    ! This routine is based on formula (9) in Jayatilaka, CPL 230, p. 228 (1995)
    ! This version of the routine requires the three matrices ft_x,ft_y,ft_z and
    ! vector prefac to be already allocated, to save on allocation time when
    ! called inside loops.
      intent(in) :: self
      real(kind=kind(1.0d0)), dimension(:,:), target :: k_pts
      complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:), pointer :: ft_x,ft_y,ft_z
      complex(kind=kind((1.0d0,1.0d0))), dimension(:), intent(out) :: prefac
      complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:) :: ft
      integer(kind=kind(1)), dimension(:,:), pointer :: la,lb
      complex(kind=kind((1.0d0,1.0d0))), dimension(:), pointer :: ft_xb,ft_yb,ft_zb
      complex(kind=kind((1.0d0,1.0d0))), dimension(:,:), pointer :: ft_xbx,ft_yby,ft_zbz
      real(kind=kind(1.0d0)), dimension(:), pointer :: k_x,k_y,k_z
      real(kind=kind(1.0d0)) :: g1_exa,g1_exb
      real(kind=kind(1.0d0)) :: pifac,gamma,g1,g4,dot1,dot2,k1,k2,k3,P1,P2,P3,PI_on_gamma
      integer(kind=kind(1)) :: k_max,n_a,n_b,a,b,k,ax,ay,az,bx,by,bz,bxlast,bylast,bzlast

      k_max = size(k_pts,1)
      n_a = n_comp_(self%a%l)
      n_b = n_comp_(self%b%l)
      gamma = self%a%ex+self%b%ex
      g1 = 1.0d0/gamma
      g4 = 0.25d0*g1
      PI_on_gamma = 3.141592653589793d0*g1
      pifac = sqrt(PI_on_gamma) * PI_on_gamma
      g1_exa = g1*self%a%ex
      g1_exb = g1*self%b%ex
      P1 = g1_exa*self%a%pos(1) + g1_exb*self%b%pos(1)
      P2 = g1_exa*self%a%pos(2) + g1_exb*self%b%pos(2)
      P3 = g1_exa*self%a%pos(3) + g1_exb*self%b%pos(3)
      k_x => k_pts(:,1)
      k_y => k_pts(:,2)
      k_z => k_pts(:,3)
      call make_ft_component_(self,ft_x,1,k_x,k_max)         ! Get the Fourier transforms
      call make_ft_component_(self,ft_y,2,k_y,k_max)         ! of each component.
      call make_ft_component_(self,ft_z,3,k_z,k_max)
      do k = 1,k_max
        k1 = k_x(k);    k2 = k_y(k);    k3 = k_z(k)
        dot1 = k1*P1+k2*P2+k3*P3
        dot2 = -g4 * (k1*k1+k2*k2+k3*k3)
        prefac(k) = pifac*exp(cmplx(dot2,dot1,kind=kind((1.0d0,1.0d0))))
      end do

      select case (self%a%l)
        case (0)
          select case(self%b%l)
            case (0)
              ft(:,1,1) = ft_x(:,0,0)*ft_y(:,0,0)*ft_z(:,0,0)*prefac(:)
            case (1)
              ft(:,1,1) = ft_x(:,0,1)*ft_y(:,0,0)*ft_z(:,0,0)*prefac(:)
              ft(:,1,2) = ft_x(:,0,0)*ft_y(:,0,1)*ft_z(:,0,0)*prefac(:)
              ft(:,1,3) = ft_x(:,0,0)*ft_y(:,0,0)*ft_z(:,0,1)*prefac(:)
            case default
              do b=0,self%b%l  ! incorporate prefac into ft_z
                ft_z(:,0,b) = ft_z(:,0,b) * prefac(:)
              end do
              call create_(lb,3,n_b);   call make_gaussian_xyz_powers_(self%b%l,lb)
              bxlast = lb(1,1)
              bylast = lb(2,1)
              bzlast = lb(3,1)
              ft_xb => ft_x(:,0,bxlast)
              ft_yb => ft_y(:,0,bylast)
              ft_zb => ft_z(:,0,bzlast)
              do b = 1,n_b           ! Loop over all elements and multiply prefactor
                bx = lb(1,b)
                by = lb(2,b)
                bz = lb(3,b)
                if (bxlast/=bx) then
                  ft_xb => ft_x(:,0,bx)
                  bxlast = bx
                end if
                if (bylast/=by) then
                  ft_yb=> ft_y(:,0,by)
                  bylast = by
                end if
                if (bzlast/=bz) then
                  ft_zb=> ft_z(:,0,bz)
                  bzlast = bz
                end if
                ft(:,1,b) = ft_xb(:)*ft_yb(:)*ft_zb(:)
              end do
              call destroy_(lb)
          end select
        case (1)
          select case (self%b%l)
            case (0)
              ft(:,1,1) = ft_x(:,1,0)*ft_y(:,0,0)*ft_z(:,0,0)*prefac(:)
              ft(:,2,1) = ft_x(:,0,0)*ft_y(:,1,0)*ft_z(:,0,0)*prefac(:)
              ft(:,3,1) = ft_x(:,0,0)*ft_y(:,0,0)*ft_z(:,1,0)*prefac(:)
            case (1)
              ft_z(:,0,0) = ft_z(:,0,0) * prefac(:)
              ft(:,1,1) = ft_x(:,1,1)*ft_y(:,0,0)*ft_z(:,0,0)
              ft(:,2,1) = ft_x(:,0,1)*ft_y(:,1,0)*ft_z(:,0,0)
              ft(:,3,1) = ft_x(:,0,1)*ft_y(:,0,0)*ft_z(:,1,0)*prefac(:)
              ft(:,1,2) = ft_x(:,1,0)*ft_y(:,0,1)*ft_z(:,0,0)
              ft(:,2,2) = ft_x(:,0,0)*ft_y(:,1,1)*ft_z(:,0,0)
               ! don't change the order.
              ft_x(:,0,0) = ft_x(:,0,0) * prefac(:)
              ft(:,3,2) = ft_x(:,0,0)*ft_y(:,0,1)*ft_z(:,1,0)
              ft(:,1,3) = ft_x(:,1,0)*ft_y(:,0,0)*ft_z(:,0,1)*prefac(:)
              ft(:,2,3) = ft_x(:,0,0)*ft_y(:,1,0)*ft_z(:,0,1)
              ft(:,3,3) = ft_x(:,0,0)*ft_y(:,0,0)*ft_z(:,1,1)
            case default
              call create_(lb,3,n_b);   call make_gaussian_xyz_powers_(self%b%l,lb)
              do b=0,self%b%l
                ft_z(:,0,b) = ft_z(:,0,b) * prefac(:)
              end do
              do b = 1,n_b           ! Loop over all elements and multiply prefactor
                bx = lb(1,b)
                by = lb(2,b)
                bz = lb(3,b)
                ft_xb => ft_x(:,0,bx)
                ft_yb => ft_y(:,0,by)
                ft_zb => ft_z(:,0,bz)
                ft(:,1,b) = ft_x(:,1,bx)*ft_yb*ft_zb
                ft(:,2,b) = ft_xb*ft_y(:,1,by)*ft_zb
                ft(:,3,b) = ft_xb*ft_yb*ft_z(:,1,bz) * prefac(:)
              end do
              call destroy_(lb)
          end select
        case default
          select case (self%b%l)
            case (0)
              do a=0,self%a%l
                ft_z(:,a,0) = ft_z(:,a,0) * prefac(:)
              end do
              call create_(la,3,n_a);   call make_gaussian_xyz_powers_(self%a%l,la)
              do a = 1,n_a
                ax = la(1,a)
                ay = la(2,a)
                az = la(3,a)
                ft(:,a,1) = ft_x(:,ax,0)*ft_y(:,ay,0)*ft_z(:,az,0)
              end do
              call destroy_(la)
            case (1)
              do a=0,self%a%l  ! incorporate prefac into ft_z
                ft_z(:,a,0) = ft_z(:,a,0) * prefac(:)
                ft_z(:,a,1) = ft_z(:,a,1) * prefac(:)
              end do
              call create_(la,3,n_a);   call make_gaussian_xyz_powers_(self%a%l,la)
              do a = 1,n_a
                ax = la(1,a)
                ay = la(2,a)
                az = la(3,a)
                ft(:,a,1) = ft_x(:,ax,1)*ft_y(:,ay,0)*ft_z(:,az,0)
                ft(:,a,2) = ft_x(:,ax,0)*ft_y(:,ay,1)*ft_z(:,az,0)
                ft(:,a,3) = ft_x(:,ax,0)*ft_y(:,ay,0)*ft_z(:,az,1)
              end do
              call destroy_(la)
            case default
     ! This is the general routine.  It includes reduced multiplication, and use
     ! of pointers to minimise array finding.
              do b=0,self%b%l  ! incorporate prefac into ft_z
                do a=0,self%a%l
                  ft_z(:,a,b) = ft_z(:,a,b) * prefac(:)
                end do
              end do
              call create_(la,3,n_a);   call make_gaussian_xyz_powers_(self%a%l,la)
              call create_(lb,3,n_b);   call make_gaussian_xyz_powers_(self%b%l,lb)
              bxlast = lb(1,1)
              bylast = lb(2,1)
              bzlast = lb(3,1)
              ft_xbx => ft_x(:,:,bxlast)
              ft_yby => ft_y(:,:,bylast)
              ft_zbz => ft_z(:,:,bzlast)
              do b = 1,n_b           ! Loop over all elements and multiply prefactor
                bx = lb(1,b)
                by = lb(2,b)
                bz = lb(3,b)
                if (bxlast/=bx) then
                  ft_xbx => ft_x(:,:,bx)
                  bxlast = bx
                end if
                if (bylast/=by) then
                  ft_yby=> ft_y(:,:,by)
                  bylast = by
                end if
                if (bzlast/=bz) then
                  ft_zbz=> ft_z(:,:,bz)
                  bzlast = bz
                end if
                do a = 1,n_a
                  ax = la(1,a)
                  ay = la(2,a)
                  az = la(3,a)
                  ft(:,a,b) = ft_xbx(:,ax+1)*ft_yby(:,ay+1)*ft_zbz(:,az+1)
                end do
              end do
              call destroy_(lb)
              call destroy_(la)
          end select
      end select

   end subroutine

   subroutine make_ft_nabla(self,ft,k_pts)
    type(gaussian2_type) :: self
    ! Calculates the Fourier transform of the current integrals for the product
    ! of two primitive gaussian functions, evaluated at a series of points
    ! "k_pts".
    ! This routine is based on formula (9) in Jayatilaka, CPL 230, p. 228 (1995)
    ! size of "ft" is [k_max],[.a.l.n_comp],[.b.l.n_comp],[3
      intent(in) :: self
      real(kind=kind(1.0d0)), dimension(:,:), intent(in) :: k_pts
      complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:,:) :: ft
      complex(kind=kind((1.0d0,1.0d0))) :: ci,prefac
      real(kind=kind(1.0d0)) :: pifac,gamma,g1,g4,dot1,dot2,k1,k2,k3,P1,P2,P3
      integer(kind=kind(1)) :: k_max,n_a,n_b,a,b,k,ax,ay,az,bx,by,bz
      integer(kind=kind(1)), dimension(:,:), pointer :: la,lb
      complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:), pointer :: ft_x,ft_y,ft_z,ft_dx,ft_dy,ft_dz

      ci = (0.0d0,1.0d0)                          ! A few useful constants ...
      k_max = size(k_pts,1)
      n_a = size(ft,2)
      n_b = size(ft,3)
      gamma = self%a%ex+self%b%ex
      g1 = 1/gamma
      g4 = 0.25d0*g1
      pifac = (3.141592653589793d0/gamma)**(1.5)
      P1 = g1*(self%a%ex*self%a%pos(1)+self%b%ex*self%b%pos(1))
      P2 = g1*(self%a%ex*self%a%pos(2)+self%b%ex*self%b%pos(2))
      P3 = g1*(self%a%ex*self%a%pos(3)+self%b%ex*self%b%pos(3))
      call create_(la,3, n_comp_(self%a%l) );   call make_gaussian_xyz_powers_(self%a%l,la)
      call create_(lb,3, n_comp_(self%b%l) );   call make_gaussian_xyz_powers_(self%b%l,lb)

      call create_(ft_x,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
      call create_(ft_y,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
      call create_(ft_z,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
      call make_ft_component_(self,ft_x,1,k_pts(:,1),k_max)         ! Get the Fourier transforms
      call make_ft_component_(self,ft_y,2,k_pts(:,2),k_max)         ! of each component.
      call make_ft_component_(self,ft_z,3,k_pts(:,3),k_max)
      call create_(ft_dx,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
      call create_(ft_dy,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
      call create_(ft_dz,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l/))
      call make_ft_dab_component_(self,ft_dx,1,k_pts(:,1),k_max)    ! Get the Fourier transforms
      call make_ft_dab_component_(self,ft_dy,2,k_pts(:,2),k_max)    ! of the derivative of each
      call make_ft_dab_component_(self,ft_dz,3,k_pts(:,3),k_max)    ! component.

      do a = 1,n_a                ! Loop over all elements and multiply prefactor
         ax = la(1,a)
         ay = la(2,a)
         az = la(3,a)
         do b = 1,n_b
            bx = lb(1,b)
            by = lb(2,b)
            bz = lb(3,b)
            do k = 1,k_max
               k1 = k_pts(k,1)
               k2 = k_pts(k,2)
               k3 = k_pts(k,3)
               dot1 = k1*P1+k2*P2+k3*P3
               dot2 = k1*k1+k2*k2+k3*k3
               dot2 = -dot2*g4
               prefac = pifac*exp(ci*dot1)*exp(dot2)
               ft(k,a,b,1) = prefac*ft_dx(k,ax,bx)*ft_y(k,ay,by) *ft_z(k,az,bz)
               ft(k,a,b,2) = prefac*ft_x(k,ax,bx) *ft_dy(k,ay,by)*ft_z(k,az,bz)
               ft(k,a,b,3) = prefac*ft_x(k,ax,bx) *ft_y(k,ay,by) *ft_dz(k,az,bz)
            end do
         end do
      end do
      call destroy_(lb)
      call destroy_(la)
      call destroy_(ft_dz)
      call destroy_(ft_dy)
      call destroy_(ft_dx)
      call destroy_(ft_z)
      call destroy_(ft_y)
      call destroy_(ft_x)

   end subroutine

   subroutine make_ft_r(self,ft,k_pts)
    type(gaussian2_type) :: self
    ! Calculates the Fourier transform of the derivative of a product of two
    ! primitive gaussian functions, times vector r, evaluated at a series of
    ! points "k_pts".
    ! This routine is based on formula (9) in Jayatilaka, CPL 230, p. 228 (1995)
    ! size of "ft" is [k_max],[.a.l.n_comp],[.b.l.n_comp],[3
      real(kind=kind(1.0d0)), dimension(:,:) :: k_pts
      complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:,:) :: ft
      complex(kind=kind((1.0d0,1.0d0))) :: ci,prefac
      real(kind=kind(1.0d0)) :: pifac,gamma,g1,g4,dot1,dot2,k1,k2,k3,P1,P2,P3
      integer(kind=kind(1)) :: k_max,n_a,n_b,a,b,k,ax,ay,az,bx,by,bz
      integer(kind=kind(1)), dimension(:,:), pointer :: la,lb
      complex(kind=kind((1.0d0,1.0d0))), dimension(:,:,:), pointer :: ft_x,ft_y,ft_z

      ci = (0.0d0,1.0d0)                          ! A few useful constants ...
      k_max = size(k_pts,1)
      n_a = size(ft,2)
      n_b = size(ft,3)
      gamma = self%a%ex+self%b%ex
      g1 = 1/gamma
      g4 = 0.25d0*g1
      pifac = (3.141592653589793d0/gamma)**(1.5)
      P1 = g1*(self%a%ex*self%a%pos(1)+self%b%ex*self%b%pos(1))
      P2 = g1*(self%a%ex*self%a%pos(2)+self%b%ex*self%b%pos(2))
      P3 = g1*(self%a%ex*self%a%pos(3)+self%b%ex*self%b%pos(3))
      call create_(la,3, n_comp_(self%a%l) );   call make_gaussian_xyz_powers_(self%a%l,la)
      call create_(lb,3, n_comp_(self%b%l) );   call make_gaussian_xyz_powers_(self%b%l,lb)

      call create_(ft_x,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l+1/))
      call create_(ft_y,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l+1/))
      call create_(ft_z,(/1,k_max/),(/0,self%a%l/),(/0,self%b%l+1/))
      call make_ft_component_(self,ft_x,1,k_pts(:,1),k_max)         ! Get the Fourier transforms
      call make_ft_component_(self,ft_y,2,k_pts(:,2),k_max)         ! of each component.
      call make_ft_component_(self,ft_z,3,k_pts(:,3),k_max)

      do a = 1,n_a                ! Loop over all elements and multiply prefactor
         ax = la(1,a)
         ay = la(2,a)
         az = la(3,a)
         do b = 1,n_b
            bx = lb(1,b)
            by = lb(2,b)
            bz = lb(3,b)
            do k = 1,k_max
               k1 = k_pts(k,1)
               k2 = k_pts(k,2)
               k3 = k_pts(k,3)
               dot1 = k1*P1+k2*P2+k3*P3
               dot2 = k1*k1+k2*k2+k3*k3
               dot2 = -dot2*g4
               prefac = pifac*exp(ci*dot1)*exp(dot2)
               ft(k,a,b,1) = prefac*(ft_x(k,ax,bx+1)+self%b%pos(1)*ft_x(k,ax,bx))*ft_y(k,ay,by)*ft_z(k,az,bz)
               ft(k,a,b,2) = prefac*ft_x(k,ax,bx)*(ft_y(k,ay,by+1)+self%b%pos(2)*ft_y(k,ay,by))*ft_z(k,az,bz)
               ft(k,a,b,3) = prefac*ft_x(k,ax,bx)*ft_y(k,ay,by)*(ft_z(k,az,bz+1)+self%b%pos(3)*ft_z(k,az,bz))
            end do
         end do
      end do
      call destroy_(lb)
      call destroy_(la)
      call destroy_(ft_z)
      call destroy_(ft_y)
      call destroy_(ft_x)

   end subroutine

   subroutine put_e_coeff(self,out)
    type(gaussian2_type) :: self
    ! Put the McMurchie Davidson 2.718281828459045d0 coefficients to file "out"
      type(textfile_type) :: out
      integer(kind=kind(1)) :: a,b,t
      real(kind=kind(1.0d0)), dimension(:,:,:), pointer :: Ex
      real(kind=kind(1.0d0)), dimension(:,:,:), pointer :: Ey
      real(kind=kind(1.0d0)), dimension(:,:,:), pointer :: Ez

      call flush_(out)
      call text_(out,"GAUSSIAN2 output:",flush=2)
      call text_(out,"Dylan Jayatilaka, University of Western Australia, March 1998",flush=2)
      call show_(out,"l_a   =",self%a%l,real_width=.true.)
      call show_(out,"l_b   =",self%a%l,real_width=.true.)
      call show_(out,"Ra    =",self%a%pos)
      call show_(out,"Rb    =",self%b%pos)
      call show_(out,"R     =",self%a%pos-self%b%pos)
      call show_(out,"alpha =",self%a%ex)
      call show_(out,"beta  =",self%b%ex)
      call flush_(out)
      call put_dash_(out,int_fields=3,real_fields=3,flush=1)
      call put_(out,"a",int_width=.true.)
      call put_(out,"b",int_width=.true.)
      call put_(out,"t",int_width=.true.)
      call put_(out,"Ex(t,a,b)")
      call put_(out,"Ey(t,a,b)")
      call put_(out,"Ez(t,a,b)",flush=1)
      call create_(Ex,(/0,self%a%l+self%b%l/),(/0,self%a%l/),(/0,self%b%l/))
      call make_e_coeff_(self,Ex,1)
      call create_(Ey,(/0,self%a%l+self%b%l/),(/0,self%a%l/),(/0,self%b%l/))
      call make_e_coeff_(self,Ey,2)
      call create_(Ez,(/0,self%a%l+self%b%l/),(/0,self%a%l/),(/0,self%b%l/))
      call make_e_coeff_(self,Ez,3)
      call put_dash_(out,int_fields=3,real_fields=3,flush=1)
      do a = 0,self%a%l
      do b = 0,self%b%l
      do t = 0,a+b
         call put_(out,a)
         call put_(out,b)
         call put_(out,t)
         call put_(out,Ex(t,a,b))
         call put_(out,Ey(t,a,b))
         call put_(out,Ez(t,a,b),flush=1)
      end do
      end do
      end do
      call destroy_(Ez)
      call destroy_(Ey)
      call destroy_(Ex)

   end subroutine

!  **********************
!  CADPAC-style integrals
!  **********************

   subroutine make_overlap_ints(self,S)
    type(gaussian2_type) :: self
    ! Make the overlap integral matrix "S". Uses Gauss-Hermite quadrature.
       real(kind=kind(1.0d0)), dimension(:,:) :: S
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rab
      real(kind=kind(1.0d0)) :: p,prefac
      integer(kind=kind(1)) :: n_a,n_b,a,b,aix,aiy,aiz,bix,biy,biz

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx,self%a%l+1,self%b%l+1); call create_(Sy,self%a%l+1,self%b%l+1); call create_(Sz,self%a%l+1,self%b%l+1)
      call make_overlap_ints_(self,Sx,1)
      call make_overlap_ints_(self,Sy,2)
      call make_overlap_ints_(self,Sz,3)
!     The following loops can be simplified by the one line statement:
!     S = Sx(ax,bx)*Sy(ay,by)*Sz(az,bz)
      do b = 1,n_b
        bix = bx(b)
        biy = by(b)
        biz = bz(b)
        do a = 1,n_a
          aix = ax(a)
          aiy = ay(a)
          aiz = az(a)
          S(a,b) = Sx(aix,bix)*Sy(aiy,biy)*Sz(aiz,biz)
        end do
      end do
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      p = self%a%ex + self%b%ex
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)/(p*sqrt(p))
      S = prefac*S

   end subroutine

   subroutine make_overlap_ints_1(self,Sx,x,max_a,max_b)
    type(gaussian2_type) :: self
    ! Make the 1-D overlap xyz integral matrix "Sx" for component "x".
    ! If present, "max_a" and "max_b" are used for the maximum angular momenta
    ! of centers (a) and (b) respectively -- for derivative integrals.
    ! Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Sx
      integer(kind=kind(1)) :: x
      integer(kind=kind(1)), optional :: max_a,max_b
      real(kind=kind(1.0d0)) :: p,t,rp,ax,bx,wt,pt,ra,rb
      integer(kind=kind(1)) :: l_a,l_b, a,b,i,k

      l_a = self%a%l; if (present(max_a)) l_a = max_a
      l_b = self%b%l; if (present(max_b)) l_b = max_b
      p = self%a%ex + self%b%ex
      t = sqrt(p)
      ax = self%a%pos(x)
      bx = self%b%pos(x)
      rp = (self%a%ex*ax + self%b%ex*bx)/p
      Sx = 0.0d0
      do a = 1,l_a+1
      do b = 1,l_b+1
         i = (a+b)/2
         do k = first_pt(i),last_pt(i)
            wt = gauss_hermite_wt(k)
            pt = gauss_hermite_pt(k)/t + rp
            ra = pt - ax
            rb = pt - bx
            if(a>1) wt = wt*ra**(a-1)
            if(b>1) wt = wt*rb**(b-1)
            Sx(a,b) = Sx(a,b) + wt
         end do
      end do
      end do

   end subroutine

   subroutine make_S_1st_deriv_ints(self,AAx,AAy,AAz)
    type(gaussian2_type) :: self
    ! Make the first derivative overlap integrals "AAx", "AAy" and "AAz" which are
    ! the derivatives of the overlap matrix elements with respect to position A.
    ! The derivatives with respect to position B are not evaluated. By translational
    ! invariance, they are just the negative of the derivatives w.r.t. A.
      real(kind=kind(1.0d0)), dimension(:,:) :: AAx,AAy,AAz
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz, Dx,Dy,Dz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rab
      real(kind=kind(1.0d0)) :: p,prefac
      integer(kind=kind(1)) :: n_a,n_b,a,b,aix,aiy,aiz,bix,biy,biz

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx,self%a%l+2,self%b%l+1); call create_(Sy,self%a%l+2,self%b%l+1); call create_(Sz,self%a%l+2,self%b%l+1)
      call create_(Dx,self%a%l+1,self%b%l+1); call create_(Dy,self%a%l+1,self%b%l+1); call create_(Dz,self%a%l+1,self%b%l+1)
      call make_overlap_ints_(self,Sx,1,self%a%l+1)
      call make_overlap_ints_(self,Sy,2,self%a%l+1)
      call make_overlap_ints_(self,Sz,3,self%a%l+1)
      call differentiate_(self,Sx,"left",Dx)  ! with respect to electron coordinates !
      call differentiate_(self,Sy,"left",Dy)
      call differentiate_(self,Sz,"left",Dz)
!     The following loops can be simplified by the statements:
!     AAx = -Dx(ax,bx)*Sy(ay,by)*Sz(az,bz)
!     AAy = -Sx(ax,bx)*Dy(ay,by)*Sz(az,bz)
!     AAz = -Sx(ax,bx)*Sy(ay,by)*Dz(az,bz)
      do b = 1,n_b
        bix = bx(b)
        biy = by(b)
        biz = bz(b)
        do a = 1,n_a
          aix = ax(a)
          aiy = ay(a)
          aiz = az(a)
           ! Minus sign for nuclear derivative
          AAx(a,b) = -Dx(aix,bix)*Sy(aiy,biy)*Sz(aiz,biz)
          AAy(a,b) = -Sx(aix,bix)*Dy(aiy,biy)*Sz(aiz,biz)
          AAz(a,b) = -Sx(aix,bix)*Sy(aiy,biy)*Dz(aiz,biz)
        end do
      end do
      call destroy_(Dz); call destroy_(Dy); call destroy_(Dx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      p = self%a%ex + self%b%ex
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)/(p*sqrt(p))
      AAx = prefac*AAx
      AAy = prefac*AAy
      AAz = prefac*AAz

   end subroutine

   subroutine make_kinetic_ints(self,T)
    type(gaussian2_type) :: self
    ! Make the kinetic integrals "T". Uses Gauss-Hermite quadrature. This routine is
    ! very inefficient. This includes the factor of -1/2 in T = -1/2 \nabla^2.
       real(kind=kind(1.0d0)), dimension(:,:) :: T
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz, Dx,Dy,Dz, Tx,Ty,Tz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rab
      real(kind=kind(1.0d0)) :: p,prefac
      integer(kind=kind(1)) :: n_a,n_b,a,b,aix,aiy,aiz,bix,biy,biz

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx,self%a%l+1,self%b%l+3); call create_(Sy,self%a%l+1,self%b%l+3); call create_(Sz,self%a%l+1,self%b%l+3)
      call create_(Tx,self%a%l+1,self%b%l+1); call create_(Ty,self%a%l+1,self%b%l+1); call create_(Tz,self%a%l+1,self%b%l+1)
      call create_(Dx,self%a%l+1,self%b%l+2); call create_(Dy,self%a%l+1,self%b%l+2); call create_(Dz,self%a%l+1,self%b%l+2)
      call make_overlap_ints_(self,Sx,1,max_b=self%b%l+2)
      call make_overlap_ints_(self,Sy,2,max_b=self%b%l+2)
      call make_overlap_ints_(self,Sz,3,max_b=self%b%l+2)
      call differentiate_(self,Sx,"right",Dx)  ! with respect to electron coordinates !
      call differentiate_(self,Sy,"right",Dy)
      call differentiate_(self,Sz,"right",Dz)
      call differentiate_(self,Dx,"right",Tx)  ! with respect to electron coordinates !
      call differentiate_(self,Dy,"right",Ty)
      call differentiate_(self,Dz,"right",Tz)
      call destroy_(Dz); call destroy_(Dy); call destroy_(Dx)
!     The following loops can be simplified by the statement:
!     T = Tx(ax,bx)*Sy(ay,by)*Sz(az,bz) &
!       + Sx(ax,bx)*Ty(ay,by)*Sz(az,bz) &
!       + Sx(ax,bx)*Sy(ay,by)*Tz(az,bz)
      do b = 1,n_b
        bix = bx(b)
        biy = by(b)
        biz = bz(b)
        do a = 1,n_a
          aix = ax(a)
          aiy = ay(a)
          aiz = az(a)
          T(a,b) = Tx(aix,bix)*Sy(aiy,biy)*Sz(aiz,biz) + &
                   Sx(aix,bix)*Ty(aiy,biy)*Sz(aiz,biz) + &
                   Sx(aix,bix)*Sy(aiy,biy)*Tz(aiz,biz)
        end do
      end do
      call destroy_(Tz); call destroy_(Ty); call destroy_(Tx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      p = self%a%ex + self%b%ex
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)/(p*sqrt(p))
      T = -0.50d0*prefac*T

   end subroutine

   subroutine make_T_1st_deriv_ints(self,AAx,AAy,AAz)
    type(gaussian2_type) :: self
    ! Make the first derivative kinetic integrals "AAx", "AAy" and "AAz" which are
    ! the derivatives of the kinetic matrix elements with respect to position A.
    ! The derivatives with respect to position B are not evaluated. By translational
    ! invariance, they are just the negative of the derivatives w.r.t. A.
    ! This includes the factor of -1/2 in T = -1/2 \nabla^2.
      real(kind=kind(1.0d0)), dimension(:,:) :: AAx,AAy,AAz
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: SSx,SSy,SSz, SAx,SAy,SAz, TTx,TTy,TTz, TAx,TAy,TAz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rab
      real(kind=kind(1.0d0)) :: p,prefac
      integer(kind=kind(1)) :: n_a,n_b,a,b,aix,aiy,aiz,bix,biy,biz

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(SSx,self%a%l+4,self%b%l+1); call create_(SSy,self%a%l+4,self%b%l+1); call create_(SSz,self%a%l+4,self%b%l+&
&1)
      call create_(SAx,self%a%l+3,self%b%l+1); call create_(SAy,self%a%l+3,self%b%l+1); call create_(SAz,self%a%l+3,self%b%l+&
&1)
      call create_(TTx,self%a%l+2,self%b%l+1); call create_(TTy,self%a%l+2,self%b%l+1); call create_(TTz,self%a%l+2,self%b%l+&
&1)
      call create_(TAx,self%a%l+1,self%b%l+1); call create_(TAy,self%a%l+1,self%b%l+1); call create_(TAz,self%a%l+1,self%b%l+&
&1)
      call make_overlap_ints_(self,SSx,1,self%a%l+3)
      call make_overlap_ints_(self,SSy,2,self%a%l+3)
      call make_overlap_ints_(self,SSz,3,self%a%l+3)
      call differentiate_(self,SSx,"left",SAx)    ! with respect to electron coordinates !
      call differentiate_(self,SSy,"left",SAy)
      call differentiate_(self,SSz,"left",SAz)
      call differentiate_(self,SAx,"left",TTx)    ! with respect to electron coordinates !
      call differentiate_(self,SAy,"left",TTy)
      call differentiate_(self,SAz,"left",TTz)
      call differentiate_(self,TTx,"left",TAx)    ! with respect to electron coordinates !
      call differentiate_(self,TTy,"left",TAy)
      call differentiate_(self,TTz,"left",TAz)
!     The following loops can be simplified by the statements:
!     AAx = TAx(ax,bx)*SSy(ay,by)*SSz(az,bz) &
!         + SAx(ax,bx)*TTy(ay,by)*SSz(az,bz) &
!         + SAx(ax,bx)*SSy(ay,by)*TTz(az,bz)
!     AAy = TTx(ax,bx)*SAy(ay,by)*SSz(az,bz) &
!         + SSx(ax,bx)*TAy(ay,by)*SSz(az,bz) &
!         + SSx(ax,bx)*SAy(ay,by)*TTz(az,bz)
!     AAz = TTx(ax,bx)*SSy(ay,by)*SAz(az,bz) &
!         + SSx(ax,bx)*TTy(ay,by)*SAz(az,bz) &
!         + SSx(ax,bx)*SSy(ay,by)*TAz(az,bz)
      do b = 1,n_b
        bix = bx(b)
        biy = by(b)
        biz = bz(b)
        do a = 1,n_a
          aix = ax(a)
          aiy = ay(a)
          aiz = az(a)
           ! No minus sign for nuclear derivative ... see below for reason
          AAx(a,b) = TAx(aix,bix)*SSy(aiy,biy)*SSz(aiz,biz) + &
                     SAx(aix,bix)*TTy(aiy,biy)*SSz(aiz,biz) + &
                     SAx(aix,bix)*SSy(aiy,biy)*TTz(aiz,biz)
          AAy(a,b) = TTx(aix,bix)*SAy(aiy,biy)*SSz(aiz,biz) + &
                     SSx(aix,bix)*TAy(aiy,biy)*SSz(aiz,biz) + &
                     SSx(aix,bix)*SAy(aiy,biy)*TTz(aiz,biz)
          AAz(a,b) = TTx(aix,bix)*SSy(aiy,biy)*SAz(aiz,biz) + &
                     SSx(aix,bix)*TTy(aiy,biy)*SAz(aiz,biz) + &
                     SSx(aix,bix)*SSy(aiy,biy)*TAz(aiz,biz)
        end do
      end do
      call destroy_(TAz); call destroy_(TAy); call destroy_(TAx)
      call destroy_(TTz); call destroy_(TTy); call destroy_(TTx)
      call destroy_(SAz); call destroy_(SAy); call destroy_(SAx)
      call destroy_(SSz); call destroy_(SSy); call destroy_(SSx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      p = self%a%ex + self%b%ex
      rab = self%a%pos - self%b%pos
      prefac = 0.50d0*exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)/(p*sqrt(p))
      AAx = prefac*AAx  ! should be -1/2 factor on line above, but derivatives are
      AAy = prefac*AAy  ! wrt electrons not nuclei so that reverses the sign
      AAz = prefac*AAz

   end subroutine

   subroutine make_dipole_ints(self,Dx,Dy,Dz,origin)
    type(gaussian2_type) :: self
    ! Make the dipole integral matrices "Dx", "Dy", and "Dz".
    ! "origin" is the gauge origin for the integrals.
    ! Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Dx,Dy,Dz
      real(kind=kind(1.0d0)), dimension(3) :: origin
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz,Rx,Ry,Rz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rab
      real(kind=kind(1.0d0)) :: p,prefac,Sx_ab,Sy_ab,Sz_ab
      integer(kind=kind(1)) :: n_a,n_b,a,b,aix,aiy,aiz,bix,biy,biz

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx,self%a%l+1,self%b%l+1); call create_(Sy,self%a%l+1,self%b%l+1); call create_(Sz,self%a%l+1,self%b%l+1)
      call create_(Rx,self%a%l+1,self%b%l+1); call create_(Ry,self%a%l+1,self%b%l+1); call create_(Rz,self%a%l+1,self%b%l+1)
      call make_dipole_ints_(self,Sx,Rx,1,origin(1))
      call make_dipole_ints_(self,Sy,Ry,2,origin(2))
      call make_dipole_ints_(self,Sz,Rz,3,origin(3))
!     The following loops can be simplified by the statements:
!     Dx = Rx(ax,bx)*Sy(ay,by)*Sz(az,bz)
!     Dy = Sx(ax,bx)*Ry(ay,by)*Sz(az,bz)
!     Dz = Sx(ax,bx)*Sy(ay,by)*Rz(az,bz)
      do b = 1,n_b
        bix = bx(b)
        biy = by(b)
        biz = bz(b)
        do a = 1,n_a
          aix = ax(a)
          aiy = ay(a)
          aiz = az(a)
          Sx_ab = Sx(aix,bix)
          Sy_ab = Sy(aiy,biy)
          Sz_ab = Sz(aiz,biz)
          Dx(a,b) = Rx(aix,bix)*Sy_ab*Sz_ab
          Dy(a,b) = Sx_ab*Ry(aiy,biy)*Sz_ab
          Dz(a,b) = Sx_ab*Sy_ab*Rz(aiz,biz)
        end do
      end do
      call destroy_(Rz); call destroy_(Ry); call destroy_(Rx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      p = self%a%ex + self%b%ex
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)/(p*sqrt(p))
      Dx = prefac*Dx
      Dy = prefac*Dy
      Dz = prefac*Dz

   end subroutine

   subroutine make_dipole_ints_1(self,Sx,Dx,x,ox,max_a,max_b)
    type(gaussian2_type) :: self
    ! Make the 1-D overlap integrals "Sx" and dipole integrals "Dx" for component
    ! "x".
    ! "ox" is the origin for the dipole terms. If present, "max_a" and "max_b"
    ! override the l value for gaussian a or b. Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Sx,Dx
       integer(kind=kind(1)) :: x
      real(kind=kind(1.0d0)) :: ox
      integer(kind=kind(1)), optional :: max_a,max_b
      real(kind=kind(1.0d0)) :: p,t,ax,bx,rp,wt,pt,ra,rb,rd
      integer(kind=kind(1)) :: l_a,l_b,a,b,i,k

      l_a = self%a%l; if (present(max_a)) l_a = max_a
      l_b = self%b%l; if (present(max_b)) l_b = max_b
      p = self%a%ex + self%b%ex
      t = sqrt(p)
      ax = self%a%pos(x)
      bx = self%b%pos(x)
      rp = (self%a%ex*ax + self%b%ex*bx)/p
      Sx = 0.0d0
      Dx = 0.0d0
      do a = 1,l_a+1
      do b = 1,l_b+1
         i = (a+b+1)/2
         do k = first_pt(i),last_pt(i)
            wt = gauss_hermite_wt(k)
            pt = gauss_hermite_pt(k)/t + rp
            ra = pt - ax
            rb = pt - bx
            rd = pt - ox
            if(a>1) wt = wt*ra**(a-1)
            if(b>1) wt = wt*rb**(b-1)
            Sx(a,b) = Sx(a,b) + wt
            Dx(a,b) = Dx(a,b) + rd*wt
         end do
      end do
      end do

   end subroutine

   subroutine make_quadrupole_ints(self,Qxx,Qyy,Qzz,Qxy,Qxz,Qyz,origin)
    type(gaussian2_type) :: self
    ! Make the qudrupole integral matrices "Qxx", ..., "Qyz".
    ! "origin" is the gauge origin for the integrals.
    ! Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Qxx,Qyy,Qzz,Qxy,Qxz,Qyz
      real(kind=kind(1.0d0)), dimension(3) :: origin
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz,Rx,Ry,Rz,Qx,Qy,Qz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rab
      real(kind=kind(1.0d0)) :: p,prefac
      real(kind=kind(1.0d0)) :: Sx_ab,Sy_ab,Sz_ab,Rx_ab,Ry_ab,Rz_ab,Qx_ab,Qy_ab,Qz_ab
      integer(kind=kind(1)) :: n_a,n_b,a,b,aix,aiy,aiz,bix,biy,biz

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx,self%a%l+1,self%b%l+1); call create_(Sy,self%a%l+1,self%b%l+1); call create_(Sz,self%a%l+1,self%b%l+1)
      call create_(Rx,self%a%l+1,self%b%l+1); call create_(Ry,self%a%l+1,self%b%l+1); call create_(Rz,self%a%l+1,self%b%l+1)
      call create_(Qx,self%a%l+1,self%b%l+1); call create_(Qy,self%a%l+1,self%b%l+1); call create_(Qz,self%a%l+1,self%b%l+1)
      call make_quadrupole_ints_(self,Sx,Rx,Qx,1,origin(1))
      call make_quadrupole_ints_(self,Sy,Ry,Qy,2,origin(2))
      call make_quadrupole_ints_(self,Sz,Rz,Qz,3,origin(3))
!     The following loops can be simplified by the statements:
!     Qxx = Qx(ax,bx)*Sy(ay,by)*Sz(az,bz)
!     Qyy = Sx(ax,bx)*Qy(ay,by)*Sz(az,bz)
!     Qzz = Sx(ax,bx)*Sy(ay,by)*Qz(az,bz)
!     Qxy = Rx(ax,bx)*Ry(ay,by)*Sz(az,bz)
!     Qxz = Rx(ax,bx)*Sy(ay,by)*Rz(az,bz)
!     Qyz = Sx(ax,bx)*Ry(ay,by)*Rz(az,bz)
      do b = 1,n_b
        bix = bx(b)
        biy = by(b)
        biz = bz(b)
        do a = 1,n_a
          aix = ax(a)
          aiy = ay(a)
          aiz = az(a)
          Qx_ab = Qx(aix,bix)
          Qy_ab = Qy(aiy,biy)
          Qz_ab = Qz(aiz,biz)
          Rx_ab = Rx(aix,bix)
          Ry_ab = Ry(aiy,biy)
          Rz_ab = Rz(aiz,biz)
          Sx_ab = Sx(aix,bix)
          Sy_ab = Sy(aiy,biy)
          Sz_ab = Sz(aiz,biz)
          Qxx(a,b) = Qx_ab*Sy_ab*Sz_ab
          Qyy(a,b) = Sx_ab*Qy_ab*Sz_ab
          Qzz(a,b) = Sx_ab*Sy_ab*Qz_ab
          Qxy(a,b) = Rx_ab*Ry_ab*Sz_ab
          Qxz(a,b) = Rx_ab*Sy_ab*Rz_ab
          Qyz(a,b) = Sx_ab*Ry_ab*Rz_ab
        end do
      end do
      call destroy_(Qz); call destroy_(Qy); call destroy_(Qx)
      call destroy_(Rz); call destroy_(Ry); call destroy_(Rx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      p = self%a%ex + self%b%ex
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)/(p*sqrt(p))
      Qxx = prefac*Qxx
      Qyy = prefac*Qyy
      Qzz = prefac*Qzz
      Qxy = prefac*Qxy
      Qxz = prefac*Qxz
      Qyz = prefac*Qyz

   end subroutine

   subroutine make_quadrupole_ints_1(self,Sx,Dx,Qx,x,ox,max_a,max_b)
    type(gaussian2_type) :: self
    ! Make the 1-D overlap integrals "Sx", dipole integrals "Dx" and quadruple
    ! integrals "Qx" for component "x". "ox" is the origin for the dipole terms.
    ! If present, "max_a" and "max_b" override the l value for gaussian a or b.
    ! Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Sx,Dx,Qx
       integer(kind=kind(1)) :: x
      real(kind=kind(1.0d0)) :: ox
      integer(kind=kind(1)), optional :: max_a,max_b
      real(kind=kind(1.0d0)) :: p,t,ax,bx,rp,wt,pt,ra,rb,rd
      integer(kind=kind(1)) :: l_a,l_b,a,b,i,k

      l_a = self%a%l; if (present(max_a)) l_a = max_a
      l_b = self%b%l; if (present(max_b)) l_b = max_b
      p = self%a%ex + self%b%ex
      t = sqrt(p)
      ax = self%a%pos(x)
      bx = self%b%pos(x)
      rp = (self%a%ex*ax + self%b%ex*bx)/p
      Sx = 0.0d0
      Dx = 0.0d0
      Qx = 0.0d0
      do a = 1,l_a+1
      do b = 1,l_b+1
         i = (a+b+2)/2
         do k = first_pt(i),last_pt(i)
            wt = gauss_hermite_wt(k)
            pt = gauss_hermite_pt(k)/t + rp
            ra = pt - ax
            rb = pt - bx
            rd = pt - ox
            if(a>1) wt = wt*ra**(a-1)
            if(b>1) wt = wt*rb**(b-1)
            Sx(a,b) = Sx(a,b) + wt
            Dx(a,b) = Dx(a,b) + rd*wt
            Qx(a,b) = Qx(a,b) + rd*rd*wt
         end do
      end do
      end do

   end subroutine

   subroutine make_octupole_ints(self,Oxxx,Oyyy,Ozzz,Oxxy,Oxxz,Oyyx,Oyyz,Ozzx,Ozzy,Oxyz,origin)
    type(gaussian2_type) :: self
    ! Make the octupole integral matrices "Oxxx", ..., "Oxyz".
    ! "origin" is the gauge origin for the integrals.
    ! Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Oxxx,Oyyy,Ozzz,Oxxy,Oxxz,Oyyx,Oyyz,Ozzx,Ozzy,Oxyz
      real(kind=kind(1.0d0)), dimension(3) :: origin
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz,Rx,Ry,Rz,Qx,Qy,Qz,Ox,Oy,Oz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rab
      real(kind=kind(1.0d0)) :: p,prefac
      real(kind=kind(1.0d0)) :: Sx_ab,Sy_ab,Sz_ab,Rx_ab,Ry_ab,Rz_ab
      real(kind=kind(1.0d0)) :: Qx_ab,Qy_ab,Qz_ab,Ox_ab,Oy_ab,Oz_ab
      integer(kind=kind(1)) :: n_a,n_b,a,b,aix,aiy,aiz,bix,biy,biz

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx,self%a%l+1,self%b%l+1); call create_(Sy,self%a%l+1,self%b%l+1); call create_(Sz,self%a%l+1,self%b%l+1)
      call create_(Rx,self%a%l+1,self%b%l+1); call create_(Ry,self%a%l+1,self%b%l+1); call create_(Rz,self%a%l+1,self%b%l+1)
      call create_(Qx,self%a%l+1,self%b%l+1); call create_(Qy,self%a%l+1,self%b%l+1); call create_(Qz,self%a%l+1,self%b%l+1)
      call create_(Ox,self%a%l+1,self%b%l+1); call create_(Oy,self%a%l+1,self%b%l+1); call create_(Oz,self%a%l+1,self%b%l+1)
      call make_octupole_ints_(self,Sx,Rx,Qx,Ox,1,origin(1))
      call make_octupole_ints_(self,Sy,Ry,Qy,Oy,2,origin(2))
      call make_octupole_ints_(self,Sz,Rz,Qz,Oz,3,origin(3))
!     The following loops can be simplified by the statements:
!     Oxxx = Ox(ax,bx)*Sy(ay,by)*Sz(az,bz)
!     Oyyy = Sx(ax,bx)*Oy(ay,by)*Sz(az,bz)
!     Ozzz = Sx(ax,bx)*Sy(ay,by)*Oz(az,bz)
!     Oxxy = Qx(ax,bx)*Ry(ay,by)*Sz(az,bz)
!     Oxxz = Qx(ax,bx)*Sy(ay,by)*Rz(az,bz)
!     Oyyx = Rx(ax,bx)*Qy(ay,by)*Sz(az,bz)
!     Oyyz = Sx(ax,bx)*Qy(ay,by)*Rz(az,bz)
!     Ozzx = Rx(ax,bx)*Sy(ay,by)*Qz(az,bz)
!     Ozzy = Sx(ax,bx)*Ry(ay,by)*Qz(az,bz)
!     Oxyz = Rx(ax,bx)*Ry(ay,by)*Rz(az,bz)
      do b = 1,n_b
        bix = bx(b)
        biy = by(b)
        biz = bz(b)
        do a = 1,n_a
          aix = ax(a)
          aiy = ay(a)
          aiz = az(a)
          Ox_ab = Ox(aix,bix); Oy_ab = Oy(aiy,biy); Oz_ab = Oz(aiz,biz)
          Qx_ab = Qx(aix,bix); Qy_ab = Qy(aiy,biy); Qz_ab = Qz(aiz,biz)
          Rx_ab = Rx(aix,bix); Ry_ab = Ry(aiy,biy); Rz_ab = Rz(aiz,biz)
          Sx_ab = Sx(aix,bix); Sy_ab = Sy(aiy,biy); Sz_ab = Sz(aiz,biz)
          Oxxx(a,b) = Ox_ab*Sy_ab*Sz_ab
          Oyyy(a,b) = Sx_ab*Oy_ab*Sz_ab
          Ozzz(a,b) = Sx_ab*Sy_ab*Oz_ab
          Oxxy(a,b) = Qx_ab*Ry_ab*Sz_ab
          Oxxz(a,b) = Qx_ab*Sy_ab*Rz_ab
          Oyyx(a,b) = Rx_ab*Qy_ab*Sz_ab
          Oyyz(a,b) = Sx_ab*Qy_ab*Rz_ab
          Ozzx(a,b) = Rx_ab*Sy_ab*Qz_ab
          Ozzy(a,b) = Sx_ab*Ry_ab*Qz_ab
          Oxyz(a,b) = Rx_ab*Ry_ab*Rz_ab
        end do
      end do
      call destroy_(Oz); call destroy_(Oy); call destroy_(Ox)
      call destroy_(Qz); call destroy_(Qy); call destroy_(Qx)
      call destroy_(Rz); call destroy_(Ry); call destroy_(Rx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      p = self%a%ex + self%b%ex
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)/(p*sqrt(p))
      Oxxx = prefac*Oxxx
      Oyyy = prefac*Oyyy
      Ozzz = prefac*Ozzz
      Oxxy = prefac*Oxxy
      Oxxz = prefac*Oxxz
      Oyyx = prefac*Oyyx
      Oyyz = prefac*Oyyz
      Ozzx = prefac*Ozzx
      Ozzy = prefac*Ozzy
      Oxyz = prefac*Oxyz

   end subroutine

   subroutine make_octupole_ints_1(self,Sx,Dx,Qx,Ox,x,og,max_a,max_b)
    type(gaussian2_type) :: self
    ! Make the 1-D overlap integrals "Sx", dipole integrals "Dx", quadruple
    ! integrals "Qx", and the ocupole integrals "Ox", for component "x". "og" is
    ! the origin for the dipole terms.
    ! If present, "max_a" and "max_b" override the l value for gaussian a or b.
    ! Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Sx,Dx,Qx,Ox
       integer(kind=kind(1)) :: x
      real(kind=kind(1.0d0)) :: og
      integer(kind=kind(1)), optional :: max_a,max_b
      real(kind=kind(1.0d0)) :: p,t,ax,bx,rp,wt,pt,ra,rb,rd,rd2
      integer(kind=kind(1)) :: l_a,l_b,a,b,i,k

      l_a = self%a%l; if (present(max_a)) l_a = max_a
      l_b = self%b%l; if (present(max_b)) l_b = max_b
      p = self%a%ex + self%b%ex
      t = sqrt(p)
      ax = self%a%pos(x)
      bx = self%b%pos(x)
      rp = (self%a%ex*ax + self%b%ex*bx)/p
      Sx = 0.0d0
      Dx = 0.0d0
      Qx = 0.0d0
      Ox = 0.0d0
      do a = 1,l_a+1
      do b = 1,l_b+1
         i = (a+b+3)/2
         do k = first_pt(i),last_pt(i)
            wt = gauss_hermite_wt(k)
            pt = gauss_hermite_pt(k)/t + rp
            ra = pt - ax
            rb = pt - bx
            rd = pt - og
            rd2 = rd*rd
            if(a>1) wt = wt*ra**(a-1)
            if(b>1) wt = wt*rb**(b-1)
            Sx(a,b) = Sx(a,b) + wt
            Dx(a,b) = Dx(a,b) + rd*wt
            Qx(a,b) = Qx(a,b) + rd2*wt
            Ox(a,b) = Ox(a,b) + rd2*rd*wt
         end do
      end do
      end do

   end subroutine

   subroutine make_nuclear_attraction_ints(self,N,c)
    type(gaussian2_type) :: self
    ! Make the nuclear attraction integral matrix "N" for a nucleus at position
    ! "c".
    ! Uses Rys decomposition of 1/r_c and Gauss-Hermite quadrature.
       real(kind=kind(1.0d0)), dimension(:,:) :: N
       real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Nx,Ny,Nz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,bix,biy,biz
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Nx,self%a%l+1,self%b%l+1); call create_(Ny,self%a%l+1,self%b%l+1); call create_(Nz,self%a%l+1,self%b%l+1)
      n_roots = (self%a%l+self%b%l+2)/2
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      N = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_nuclear_attraction_ints_(self,Nx,1,uu,c(1))
         call make_nuclear_attraction_ints_(self,Ny,2,uu,c(2))
         call make_nuclear_attraction_ints_(self,Nz,3,uu,c(3))
         Nz = Nz*wt
!     The following loops can be simplified by the statement
!        N = N + Nx(ax,bx)*Ny(ay,by)*Nz(az,bz)
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             N(a,b) = N(a,b) + Nx(ax(a),bix)*Ny(ay(a),biy)*Nz(az(a),biz)
           end do
         end do
      end do
      call destroy_(rys)
      call destroy_(Nz); call destroy_(Ny); call destroy_(Nx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      N = prefac*N

   end subroutine

   subroutine make_nuclear_attraction_ints_1(self,Nx,x,uu,cx,max_a,max_b)
    type(gaussian2_type) :: self
    ! Make the 1-D nuclear attraction xyz integrals "Nx", for component "x", for
    ! a particular Rys-gaussian with exponent "uu", used in the decomposition of
    ! 1/r_c centred at position "cx". If present, "max_a" and "max_b" override
    ! the l value for gaussian a or b.
    ! Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Nx
       integer(kind=kind(1)) :: x
      real(kind=kind(1.0d0)) :: uu,cx
      integer(kind=kind(1)), optional :: max_a,max_b
      real(kind=kind(1.0d0)) :: p,t,ax,bx,r0,wt,pt,ra,rb
      integer(kind=kind(1)) :: l_a,l_b,a,b,i,k

      l_a = self%a%l; if (present(max_a)) l_a = max_a
      l_b = self%b%l; if (present(max_b)) l_b = max_b
      p = self%a%ex + self%b%ex + uu
      t = sqrt(p)
      ax = self%a%pos(x)
      bx = self%b%pos(x)
      r0 = (self%a%ex*ax + self%b%ex*bx + uu*cx)/p
      Nx = 0.0d0
      do a = 1,l_a+1
      do b = 1,l_b+1
         i = (a+b)/2  ! should be max((a+b-1)/2,1) ?
         do k = first_pt(i),last_pt(i)
            wt = gauss_hermite_wt(k)
            pt = gauss_hermite_pt(k)/t + r0
            ra = pt - ax
            rb = pt - bx
            if(a>1) wt = wt*ra**(a-1)
            if(b>1) wt = wt*rb**(b-1)
            Nx(a,b) = Nx(a,b) + wt
         end do
      end do
      end do

   end subroutine

   subroutine make_NA_1st_deriv_ints(self,DAx,DAy,DAz,DBx,DBy,DBz,c)
    type(gaussian2_type) :: self
    ! Make the derivatives nuclear attraction integrals w.r.t. centers A and B in
    ! "DAx", "DAy" and "DAz", and "DBx", "DBy" and "DBz" for a nucleus at position
    ! "c". Uses Rys decomposition of 1/r_c and Gauss-Hermite quadrature
      real(kind=kind(1.0d0)), dimension(:,:) :: DAx,DAy,DAz,DBx,DBy,DBz
      real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: NAx,NAy,NAz, AAx,AAy,AAz,BBx,BBy,BBz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,bix,biy,biz
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(NAx,self%a%l+2,self%b%l+2); call create_(NAy,self%a%l+2,self%b%l+2); call create_(NAz,self%a%l+2,self%b%l+&
&2)
      call create_(AAx,self%a%l+1,self%b%l+1); call create_(AAy,self%a%l+1,self%b%l+1); call create_(AAz,self%a%l+1,self%b%l+&
&1)
      call create_(BBx,self%a%l+1,self%b%l+1); call create_(BBy,self%a%l+1,self%b%l+1); call create_(BBz,self%a%l+1,self%b%l+&
&1)
     ! n_roots = (.a.l+.b.l+3)/2
      n_roots = (self%a%l+self%b%l+1)/2 + 1
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      DAx = 0.0d0; DAy = 0.0d0; DAz = 0.0d0
      DBx = 0.0d0; DBy = 0.0d0; DBz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_nuclear_attraction_ints_(self,NAx,1,uu,c(1),self%a%l+1,self%b%l+1)
         call make_nuclear_attraction_ints_(self,NAy,2,uu,c(2),self%a%l+1,self%b%l+1)
         call make_nuclear_attraction_ints_(self,NAz,3,uu,c(3),self%a%l+1,self%b%l+1)
         call differentiate_(self,NAx,"right",BBx)  ! with respect to electron coordinates !
         call differentiate_(self,NAy,"right",BBy)
         call differentiate_(self,NAz,"right",BBz)
         call differentiate_(self,NAx,"left ",AAx)  ! with respect to electron coordinates !
         call differentiate_(self,NAy,"left ",AAy)
         call differentiate_(self,NAz,"left ",AAz)
         NAz = NAz*wt
         AAz = AAz*wt
         BBz = BBz*wt
!     The following loops can be simplified by the statement:
!     DAx = DAx - AAx(ax,bx)*NAy(ay,by)*NAz(az,bz)
!     DAy = DAy - NAx(ax,bx)*AAy(ay,by)*NAz(az,bz)
!     DAz = DAz - NAx(ax,bx)*NAy(ay,by)*AAz(az,bz)
!     DBx = DBx - BBx(ax,bx)*NAy(ay,by)*NAz(az,bz)
!     DBy = DBy - NAx(ax,bx)*BBy(ay,by)*NAz(az,bz)
!     DBz = DBz - NAx(ax,bx)*NAy(ay,by)*BBz(az,bz)
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
              ! Minus sign for nuclear derivative
             DAx(a,b) = DAx(a,b) - AAx(ax(a),bix)*NAy(ay(a),biy)*NAz(az(a),biz)
             DAy(a,b) = DAy(a,b) - NAx(ax(a),bix)*AAy(ay(a),biy)*NAz(az(a),biz)
             DAz(a,b) = DAz(a,b) - NAx(ax(a),bix)*NAy(ay(a),biy)*AAz(az(a),biz)
             DBx(a,b) = DBx(a,b) - BBx(ax(a),bix)*NAy(ay(a),biy)*NAz(az(a),biz)
             DBy(a,b) = DBy(a,b) - NAx(ax(a),bix)*BBy(ay(a),biy)*NAz(az(a),biz)
             DBz(a,b) = DBz(a,b) - NAx(ax(a),bix)*NAy(ay(a),biy)*BBz(az(a),biz)
           end do
         end do
      end do
      call destroy_(rys)
      call destroy_(BBz); call destroy_(BBy); call destroy_(BBx)
      call destroy_(AAz); call destroy_(AAy); call destroy_(AAx)
      call destroy_(NAz); call destroy_(NAy); call destroy_(NAx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      DAx = prefac*DAx; DAy = prefac*DAy; DAz = prefac*DAz
      DBx = prefac*DBx; DBy = prefac*DBy; DBz = prefac*DBz

   end subroutine

   subroutine make_spin_orbit_ints(self,Lx,Ly,Lz,c)
    type(gaussian2_type) :: self
    ! Make the spin orbit integral matrices "Lx", "Ly", and "Lz" around nucleus
    ! "c".
    ! This integrals is for: (r - r_c) x nabla / |r - r_c|^3, with no minus sign
    ! on nabla.
    ! Uses Rys decomposition of 1/r_c and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Lx,Ly,Lz
       real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: NAx,NAy,NAz,AAx,AAy,AAz,BBx,BBy,BBz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      real(kind=kind(1.0d0)) :: AAx_ab,AAy_ab,AAz_ab,BBx_ab,BBy_ab,BBz_ab
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(NAx,self%a%l+2,self%b%l+2); call create_(NAy,self%a%l+2,self%b%l+2); call create_(NAz,self%a%l+2,self%b%l+&
&2)
      call create_(AAx,self%a%l+1,self%b%l+1); call create_(AAy,self%a%l+1,self%b%l+1); call create_(AAz,self%a%l+1,self%b%l+&
&1)
      call create_(BBx,self%a%l+1,self%b%l+1); call create_(BBy,self%a%l+1,self%b%l+1); call create_(BBz,self%a%l+1,self%b%l+&
&1)
      n_roots = (self%a%l+self%b%l+3)/2
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Lx = 0.0d0
      Ly = 0.0d0
      Lz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_nuclear_attraction_ints_(self,NAx,1,uu,c(1),self%a%l+1,self%b%l+1)
         call make_nuclear_attraction_ints_(self,NAy,2,uu,c(2),self%a%l+1,self%b%l+1)
         call make_nuclear_attraction_ints_(self,NAz,3,uu,c(3),self%a%l+1,self%b%l+1)
         NAz = NAz*wt
         call differentiate_(self,NAx,"right",BBx)  ! with respect to electron coordinates !
         call differentiate_(self,NAy,"right",BBy)
         call differentiate_(self,NAz,"right",BBz)
         call differentiate_(self,NAx,"left ",AAx)  ! with respect to electron coordinates !
         call differentiate_(self,NAy,"left ",AAy)
         call differentiate_(self,NAz,"left ",AAz)
!        The following loops can be simplified by the statement:
!        Lx = Lx + NAx(ax,bx)*(AAy(ay,by)*BBz(az,bz)-BBy(ay,by)*AAz(az,bz))
!        Ly = Ly + NAy(ay,by)*(AAz(az,bz)*BBx(ax,bx)-BBz(az,bz)*AAx(ax,bx))
!        Lz = Lz + NAz(az,bz)*(AAx(ax,bx)*BBy(ay,by)-BBx(ax,bx)*AAy(ay,by))
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             AAx_ab = AAx(aix,bix)
             AAy_ab = AAy(aiy,biy)
             AAz_ab = AAz(aiz,biz)
             BBx_ab = BBx(aix,bix)
             BBy_ab = BBy(aiy,biy)
             BBz_ab = BBz(aiz,biz)
             Lx(a,b) = Lx(a,b) + NAx(aix,bix)*(AAy_ab*BBz_ab-BBy_ab*AAz_ab)
             Ly(a,b) = Ly(a,b) + NAy(aiy,biy)*(AAz_ab*BBx_ab-BBz_ab*AAx_ab)
             Lz(a,b) = Lz(a,b) + NAz(aiz,biz)*(AAx_ab*BBy_ab-BBx_ab*AAy_ab)
           end do
         end do
      end do
      call destroy_(rys)
      call destroy_(BBz); call destroy_(BBy); call destroy_(BBx)
      call destroy_(AAz); call destroy_(AAy); call destroy_(AAx)
      call destroy_(NAz); call destroy_(NAy); call destroy_(NAx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      Lx = prefac*Lx
      Ly = prefac*Ly
      Lz = prefac*Lz

   end subroutine

   subroutine make_E_field_ints(self,Ex,Ey,Ez,c)
    type(gaussian2_type) :: self
    ! Make the electric field integral matrices "Ei" at position "c". If present,
    ! Uses Rys decomposition of 1/r_c and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Ex,Ey,Ez
       real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz,Fx,Fy,Fz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: l_a,l_b,n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      type(rys_type), pointer :: rys

      l_a = self%a%l
      l_b = self%b%l
      n_a = (l_a+1)*(l_a+2)/2
      n_b = (l_b+1)*(l_b+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(l_a,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(l_b,bx,by,bz)
      call create_(Sx,l_a+1,l_b+1); call create_(Sy,l_a+1,l_b+1); call create_(Sz,l_a+1,l_b+1)
      call create_(Fx,l_a+1,l_b+1); call create_(Fy,l_a+1,l_b+1); call create_(Fz,l_a+1,l_b+1)
      n_roots = (l_a+l_b+1)/2 + 1
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Ex = 0.0d0; Ey = 0.0d0; Ez = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_E_field_ints_(self,Sx,Fx,1,uu,c(1))
         call make_E_field_ints_(self,Sy,Fy,2,uu,c(2))
         call make_E_field_ints_(self,Sz,Fz,3,uu,c(3))
         Sz = Sz*wt
         Fz = Fz*wt
!        The following loops can be simplified by the statement:
!        Ex = Ex + Fx(ax,bx)*Sy(ay,by)*Sz(az,bz)
!        Ey = Ey + Sx(ax,bx)*Fy(ay,by)*Sz(az,bz)
!        Ez = Ez + Sx(ax,bx)*Sy(ay,by)*Fz(az,bz)
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             Ex(a,b) = Ex(a,b) + Fx(aix,bix)*Sy(aiy,biy)*Sz(aiz,biz)
             Ey(a,b) = Ey(a,b) + Sx(aix,bix)*Fy(aiy,biy)*Sz(aiz,biz)
             Ez(a,b) = Ez(a,b) + Sx(aix,bix)*Sy(aiy,biy)*Fz(aiz,biz)
           end do
         end do
      end do
      call destroy_(rys)
      call destroy_(Fz); call destroy_(Fy); call destroy_(Fx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      Ex = prefac*Ex
      Ey = prefac*Ey
      Ez = prefac*Ez

   end subroutine

   subroutine make_E_field_ints_1(self,Sx,Fx,x,uu,cx,max_a,max_b)
    type(gaussian2_type) :: self
    ! Make the 1-D overlap integrals "Sx", and the electric field integrals "Fx"
    ! for component "x", for a particular Rys-gaussian with exponent "uu", used
    ! in the decomposition of (c-r)/|c-r|^3 centred at position "cx". Uses
    ! Gauss-Hermite quadrature.
    ! If present, "max_a" and "max_b" indicate the l value to be used for
    ! gaussian a or b.
      real(kind=kind(1.0d0)), dimension(:,:) :: Sx,Fx
       integer(kind=kind(1)) :: x
      real(kind=kind(1.0d0)) :: uu,cx
      integer(kind=kind(1)), optional :: max_a,max_b
      real(kind=kind(1.0d0)) :: p,t,ax,bx,r0,ff,pt,wt,ra,rb,ru
      integer(kind=kind(1)) :: l_a,l_b,a,b,i,k

      l_a = self%a%l; if (present(max_a)) l_a = max_a
      l_b = self%b%l; if (present(max_b)) l_b = max_b
      p = self%a%ex + self%b%ex + uu
      t = sqrt(p)
      ax = self%a%pos(x)
      bx = self%b%pos(x)
      r0 = (self%a%ex*ax + self%b%ex*bx + uu*cx)/p
      Sx = 0.0d0; Fx = 0.0d0
      do a = 1,l_a+1
      do b = 1,l_b+1
         i = (a+b+1)/2  ! should be max((a+b)/2,1) ?
         do k = first_pt(i),last_pt(i)
            pt = gauss_hermite_pt(k)/t + r0
            ra = pt - ax
            rb = pt - bx
            ru = 2.0d0*uu*(cx-pt)
            ff = 1.0d0
            if(a>1) ff = ff*ra**(a-1)
            if(b>1) ff = ff*rb**(b-1)
            wt = gauss_hermite_wt(k)
            Sx(a,b) = Sx(a,b) + ff*wt
            Fx(a,b) = Fx(a,b) + ru*ff*wt
         end do
      end do
      end do

   end subroutine

   subroutine make_E_gradient_ints(self,Exx,Eyy,Ezz,Exy,Exz,Eyz,c)
    type(gaussian2_type) :: self
    ! Make the electric field gradient integral matrices "Ei" at position "c".
    ! This does not contain the density contribution from the delta function.
    ! Uses Rys decomposition of 1/r_c and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Exx,Eyy,Ezz,Exy,Exz,Eyz
      real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz,Fx,Fy,Fz,Gx,Gy,Gz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: l_a,l_b,n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      type(rys_type), pointer :: rys

      l_a = self%a%l
      l_b = self%b%l
      n_a = (l_a+1)*(l_a+2)/2
      n_b = (l_b+1)*(l_b+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(l_a,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(l_b,bx,by,bz)
      call create_(Sx,l_a+1,l_b+1); call create_(Sy,l_a+1,l_b+1); call create_(Sz,l_a+1,l_b+1)
      call create_(Fx,l_a+1,l_b+1); call create_(Fy,l_a+1,l_b+1); call create_(Fz,l_a+1,l_b+1)
      call create_(Gx,l_a+1,l_b+1); call create_(Gy,l_a+1,l_b+1); call create_(Gz,l_a+1,l_b+1)
      n_roots = (l_a+l_b+3)/2
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Exx = 0.0d0; Eyy = 0.0d0; Ezz = 0.0d0
      Exy = 0.0d0; Exz = 0.0d0; Eyz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_E_gradient_ints_(self,Sx,Fx,Gx,1,uu,c(1))
         call make_E_gradient_ints_(self,Sy,Fy,Gy,2,uu,c(2))
         call make_E_gradient_ints_(self,Sz,Fz,Gz,3,uu,c(3))
         Sz = Sz*wt
         Fz = Fz*wt
         Gz = Gz*wt
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             Exx(a,b) = Exx(a,b) + Gx(aix,bix)*Sy(aiy,biy)*Sz(aiz,biz)
             Eyy(a,b) = Eyy(a,b) + Sx(aix,bix)*Gy(aiy,biy)*Sz(aiz,biz)
             Ezz(a,b) = Ezz(a,b) + Sx(aix,bix)*Sy(aiy,biy)*Gz(aiz,biz)
             Exy(a,b) = Exy(a,b) + 3.0d0*Fx(aix,bix)*Fy(aiy,biy)*Sz(aiz,biz)
             Exz(a,b) = Exz(a,b) + 3.0d0*Fx(aix,bix)*Sy(aiy,biy)*Fz(aiz,biz)
             Eyz(a,b) = Eyz(a,b) + 3.0d0*Sx(aix,bix)*Fy(aiy,biy)*Fz(aiz,biz)
           end do
         end do
      end do
      call destroy_(rys)
      call destroy_(Gz); call destroy_(Gy); call destroy_(Gx)
      call destroy_(Fz); call destroy_(Fy); call destroy_(Fx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      Exx = prefac*Exx; Eyy = prefac*Eyy; Ezz = prefac*Ezz
      Exy = prefac*Exy; Exz = prefac*Exz; Eyz = prefac*Eyz

   end subroutine

   subroutine make_E_gradient_ints_1(self,Sx,Fx,Gx,x,uu,cx,max_a,max_b)
    type(gaussian2_type) :: self
    ! Make the 1-D overlap integrals "Sx", and the electric field integrals "Fx",
    ! and the electric field gradient integral "Gx" for component "x", for a
    ! particular Rys-gaussian with exponent "uu", used in the decomposition of
    ! (c-r)/|c-r|^3 centred at position "cx". Uses Gauss-Hermite quadrature.
    ! If present, "max_a" and "max_b" indicate the l value to be used for
    ! gaussian a or b.
      real(kind=kind(1.0d0)), dimension(:,:) :: Sx,Fx,Gx
       integer(kind=kind(1)) :: x
      real(kind=kind(1.0d0)) :: uu,cx
      integer(kind=kind(1)), optional :: max_a,max_b
      real(kind=kind(1.0d0)) :: p,t,ax,bx,r0,ff,pt,ra,rb,ru,rg
      integer(kind=kind(1)) :: l_a,l_b,a,b,i,k

      l_a = self%a%l; if (present(max_a)) l_a = max_a
      l_b = self%b%l; if (present(max_b)) l_b = max_b
      p = self%a%ex + self%b%ex + uu
      t = sqrt(p)
      ax = self%a%pos(x)
      bx = self%b%pos(x)
      r0 = (self%a%ex*ax + self%b%ex*bx + uu*cx)/p
      Sx = 0.0d0; Fx = 0.0d0; Gx = 0.0d0
      do a = 1,l_a+1
      do b = 1,l_b+1
         i = (a+b+2)/2  ! should be max((a+b)/2,1) ?
         do k = first_pt(i),last_pt(i)
            pt = gauss_hermite_pt(k)/t + r0
            ra = pt - ax
            rb = pt - bx
            ru =  2.0d0*uu*(cx-pt)
            rg = -2.0d0*uu*(1.0d0-ru*(cx-pt))
            ff = gauss_hermite_wt(k)
            if(a>1) ff = ff*ra**(a-1)
            if(b>1) ff = ff*rb**(b-1)  ! this is \int dx g(a;ax) g(b;bx) e^(-uu*(cx-r)^2)
            Sx(a,b) = Sx(a,b) + ff     ! integrand = 1
            Fx(a,b) = Fx(a,b) + ru*ff  ! integrand = (cx-r)/|c-r|^3
            Gx(a,b) = Gx(a,b) + rg*ff  ! integrand = 3*(cx-r)^2/|c-r|^5 - 1/|c-r|^3
         end do
      end do
      end do

   end subroutine

   subroutine make_spin_orbit_B_ints(self,Qxx,Qxy,Qxz,Qyx,Qyy,Qyz,Qzx,Qzy,Qzz,c,origin)
    type(gaussian2_type) :: self
    ! Make gauge modified (B field) spin orbit integral matrices "Qij" around
    ! nucleus "c".  using gauge origin "origin".  The integrals are:
    !    Qij(a,b) = <a| (r-o)_i (r-c)_j / |r-c|^3 |b>
    ! Uses Rys decomposition of 1/|r-c| and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Qxx,Qxy,Qxz,Qyx,Qyy,Qyz,Qzx,Qzy,Qzz
      real(kind=kind(1.0d0)), dimension(3) :: c,origin
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz,Dx,Dy,Dz,Fx,Fy,Fz,Qx,Qy,Qz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx,self%a%l+1,self%b%l+1); call create_(Sy,self%a%l+1,self%b%l+1); call create_(Sz,self%a%l+1,self%b%l+1)
      call create_(Dx,self%a%l+1,self%b%l+1); call create_(Dy,self%a%l+1,self%b%l+1); call create_(Dz,self%a%l+1,self%b%l+1)
      call create_(Fx,self%a%l+1,self%b%l+1); call create_(Fy,self%a%l+1,self%b%l+1); call create_(Fz,self%a%l+1,self%b%l+1)
      call create_(Qx,self%a%l+1,self%b%l+1); call create_(Qy,self%a%l+1,self%b%l+1); call create_(Qz,self%a%l+1,self%b%l+1)
      n_roots = (self%a%l+self%b%l+3)/2
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Qxx = 0.0d0; Qyx = 0.0d0; Qzx = 0.0d0
      Qxy = 0.0d0; Qyy = 0.0d0; Qzy = 0.0d0
      Qxz = 0.0d0; Qyz = 0.0d0; Qzz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_q_field_ints_(self,Sx,Dx,Fx,Qx,1,uu,c(1),origin(1))
         call make_q_field_ints_(self,Sy,Dy,Fy,Qy,2,uu,c(2),origin(2))
         call make_q_field_ints_(self,Sz,Dz,Fz,Qz,3,uu,c(3),origin(3))
         Sz = Sz*wt; Dz = Dz*wt; Fz = Fz*wt; Qz = Qz*wt
!        The following loops can be simplified by the statements:
!        Qxx = Qxx + Qx(ax,bx)*Sy(ay,by)*Sz(az,bz)
!        Qyx = Qyx + Fx(ax,bx)*Dy(ay,by)*Sz(az,bz)
!        Qzx = Qzx + Fx(ax,bx)*Sy(ay,by)*Dz(az,bz)
!        Qxy = Qxy + Dx(ax,bx)*Fy(ay,by)*Sz(az,bz)
!        Qyy = Qyy + Sx(ax,bx)*Qy(ay,by)*Sz(az,bz)
!        Qzy = Qzy + Sx(ax,bx)*Fy(ay,by)*Dz(az,bz)
!        Qxz = Qxz + Dx(ax,bx)*Sy(ay,by)*Fz(az,bz)
!        Qyz = Qyz + Sx(ax,bx)*Dy(ay,by)*Fz(az,bz)
!        Qzz = Qzz + Sx(ax,bx)*Sy(ay,by)*Qz(az,bz)
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             Qxx(a,b) = Qxx(a,b) + Qx(aix,bix)*Sy(aiy,biy)*Sz(aiz,biz)
             Qyx(a,b) = Qyx(a,b) + Fx(aix,bix)*Dy(aiy,biy)*Sz(aiz,biz)
             Qzx(a,b) = Qzx(a,b) + Fx(aix,bix)*Sy(aiy,biy)*Dz(aiz,biz)
             Qxy(a,b) = Qxy(a,b) + Dx(aix,bix)*Fy(aiy,biy)*Sz(aiz,biz)
             Qyy(a,b) = Qyy(a,b) + Sx(aix,bix)*Qy(aiy,biy)*Sz(aiz,biz)
             Qzy(a,b) = Qzy(a,b) + Sx(aix,bix)*Fy(aiy,biy)*Dz(aiz,biz)
             Qxz(a,b) = Qxz(a,b) + Dx(aix,bix)*Sy(aiy,biy)*Fz(aiz,biz)
             Qyz(a,b) = Qyz(a,b) + Sx(aix,bix)*Dy(aiy,biy)*Fz(aiz,biz)
             Qzz(a,b) = Qzz(a,b) + Sx(aix,bix)*Sy(aiy,biy)*Qz(aiz,biz)
           end do
         end do
      end do
      call destroy_(rys)
      call destroy_(Qz); call destroy_(Qy); call destroy_(Qx)
      call destroy_(Fz); call destroy_(Fy); call destroy_(Fx)
      call destroy_(Dz); call destroy_(Dy); call destroy_(Dx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      Qxx = prefac*Qxx; Qyx = prefac*Qyx; Qzx = prefac*Qzx
      Qxy = prefac*Qxy; Qyy = prefac*Qyy; Qzy = prefac*Qzy
      Qxz = prefac*Qxz; Qyz = prefac*Qyz; Qzz = prefac*Qzz

   end subroutine

   subroutine make_q_field_ints(self,Sx,Dx,Fx,Qx,x,uu,cx,ox,max_a,max_b)
    type(gaussian2_type) :: self
    ! Make the 1-D overlap integrals "Sx", dipole integrals "Dx", electric field
    ! integrals "Fx", and the dipole-electric field integrals "Qx" for component
    ! "x". "uu" is the Rys-gaussian exponent used in the decomposition of
    ! (c-r)/|c-r|^3 centred at position "cx".
    ! "ox" is the origin for the dipole terms. If present, "max_a" and "max_b"
    ! override the l value for gaussian a or b. Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Sx,Dx,Fx,Qx
       integer(kind=kind(1)) :: x
      real(kind=kind(1.0d0)) :: uu,cx,ox
      integer(kind=kind(1)), optional :: max_a,max_b
      real(kind=kind(1.0d0)) :: p,t,ax,bx,r0,wt,pt,ra,rb,ru,rd
      integer(kind=kind(1)) :: l_a,l_b,a,b,i,k

      l_a = self%a%l; if (present(max_a)) l_a = max_a
      l_b = self%b%l; if (present(max_b)) l_b = max_b
      p = self%a%ex + self%b%ex + uu
      t = sqrt(p)
      ax = self%a%pos(x)
      bx = self%b%pos(x)
      r0 = (self%a%ex*ax + self%b%ex*bx + uu*cx)/p
      Sx = 0.0d0; Dx = 0.0d0; Fx = 0.0d0; Qx = 0.0d0
      do a = 1,l_a+1
      do b = 1,l_b+1
         i = (a+b+2)/2  ! should be max((a+b+1)/2,1) ?
         do k = first_pt(i),last_pt(i)
            wt = gauss_hermite_wt(k)
            pt = gauss_hermite_pt(k)/t + r0
            ra = pt - ax
            rb = pt - bx
            ru = 2.0d0*uu*(cx-pt)
            rd = pt - ox
            if(a>1) wt = wt*ra**(a-1)
            if(b>1) wt = wt*rb**(b-1)
            Sx(a,b) = Sx(a,b) + wt
            Dx(a,b) = Dx(a,b) + rd*wt
            Fx(a,b) = Fx(a,b) + ru*wt
            Qx(a,b) = Qx(a,b) + ru*rd*wt
         end do
      end do
      end do

   end subroutine

   subroutine make_L_ints(self,Lx,Ly,Lz,origin)
    type(gaussian2_type) :: self
    ! Make the angular momentum integral matrices "Lx", "Ly", and "Lz".
    ! The integrals are for (r x nabla) with *no* minus sign on nabla.
    ! "origin" is the gauge origin for the integrals.
    ! Uses Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Lx,Ly,Lz
      real(kind=kind(1.0d0)), dimension(3) :: origin
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx,Sy,Sz,Rx,Ry,Rz,Dx,Dy,Dz
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rab
      real(kind=kind(1.0d0)) :: p,prefac
      integer(kind=kind(1)) :: n_a,n_b,a,b,aix,aiy,aiz,bix,biy,biz
      real(kind=kind(1.0d0)) :: Dx_ab,Dy_ab,Dz_ab,Rx_ab,Ry_ab,Rz_ab

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx,self%a%l+1,self%b%l+2); call create_(Sy,self%a%l+1,self%b%l+2); call create_(Sz,self%a%l+1,self%b%l+2)
      call create_(Rx,self%a%l+1,self%b%l+2); call create_(Ry,self%a%l+1,self%b%l+2); call create_(Rz,self%a%l+1,self%b%l+2)
      call create_(Dx,self%a%l+1,self%b%l+1); call create_(Dy,self%a%l+1,self%b%l+1); call create_(Dz,self%a%l+1,self%b%l+1)
      call make_dipole_ints_(self,Sx,Rx,1,origin(1),max_b=self%b%l+1)
      call make_dipole_ints_(self,Sy,Ry,2,origin(2),max_b=self%b%l+1)
      call make_dipole_ints_(self,Sz,Rz,3,origin(3),max_b=self%b%l+1)
      call differentiate_(self,Sx,"right",Dx)
      call differentiate_(self,Sy,"right",Dy)
      call differentiate_(self,Sz,"right",Dz)
      do b=1,n_b
        bix=bx(b)
        biy=by(b)
        biz=bz(b)
        do a=1,n_a
          aix=ax(a)
          aiy=ay(a)
          aiz=az(a)
          Dx_ab = Dx(aix,bix)
          Dy_ab = Dx(aiy,biy)
          Dz_ab = Dx(aiz,biz)
          Rx_ab = Rx(aix,bix)
          Ry_ab = Rx(aiy,biy)
          Rz_ab = Rx(aiz,biz)
          Lx(a,b) = Sx(aix,bix)*(Ry_ab*Dz_ab-Dy_ab*Rz_ab)
          Ly(a,b) = Sy(aiy,biy)*(Rz_ab*Dx_ab-Dz_ab*Rx_ab)
          Lz(a,b) = Sz(aiz,biz)*(Rx_ab*Dy_ab-Dx_ab*Ry_ab)
!      Lx = Sx(ax,bx)*(Ry(ay,by)*Dz(az,bz)-Dy(ay,by)*Rz(az,bz))
!      Ly = Sy(ay,by)*(Rz(az,bz)*Dx(ax,bx)-Dz(az,bz)*Rx(ax,bx))
!      Lz = Sz(az,bz)*(Rx(ax,bx)*Dy(ay,by)-Dx(ax,bx)*Ry(ay,by))
        end do
      end do
      call destroy_(Dz); call destroy_(Dy); call destroy_(Dx)
      call destroy_(Rz); call destroy_(Ry); call destroy_(Rx)
      call destroy_(Sz); call destroy_(Sy); call destroy_(Sx)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      p = self%a%ex + self%b%ex
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)/(p*sqrt(p))
      Lx = prefac*Lx
      Ly = prefac*Ly
      Lz = prefac*Lz

   end subroutine

   subroutine differentiate(self,I,index,D)
    type(gaussian2_type) :: self
    ! Differentiate a gaussian-integral matrix "I" with respect to the
    ! *electron* coordinate on basis function "index", which can be "left"
    ! or "right". Place the result in "D".
      real(kind=kind(1.0d0)), dimension(:,:) :: I,D
      character(*) :: index
      integer(kind=kind(1)) :: i_a,i_b,d_a,d_b,a,b
      real(kind=kind(1.0d0)) :: a2,b2

      i_a = ubound(I,1); i_b = ubound(I,2)
      d_a = ubound(D,1); d_b = ubound(D,2)
      D = 0.0d0
      select case (index)
         case("l","left")
            call ensure_(tonto,i_a>1,"GAUSSIAN2:differentiate ... I array too small to differentiate")
            call ensure_(tonto,i_a>d_a,"GAUSSIAN2:differentiate ... I and D arrays are incompatible")
            call ensure_(tonto,i_b>=d_b,"GAUSSIAN2:differentiate ... I and D arrays are incompatible")
            a2 = 2.0d0*self%a%ex
            D(1,:) = -a2*I(2  ,1:d_b)
            do a = 2,d_a
            D(a,:) = -a2*I(a+1,1:d_b) + (a-1)*I(a-1,1:d_b)
            end do
         case("r","right")
            call ensure_(tonto,i_b>1,"GAUSSIAN2:differentiate ... I array too small to differentiate")
            call ensure_(tonto,i_b>d_b,"GAUSSIAN2:differentiate ... I and D arrays are incompatible")
            call ensure_(tonto,i_a>=d_a,"GAUSSIAN2:differentiate ... I and D arrays are incompatible")
            b2 = 2.0d0*self%b%ex
            D(:,1) = -b2*I(1:d_a,2  )
            do b = 2,d_b
            D(:,b) = -b2*I(1:d_a,b+1) + (b-1)*I(1:d_a,b-1)
            end do
      end select

   end subroutine

   subroutine make_magnetic_jp_ints(self,Jx,Jy,Jz,c)
    type(gaussian2_type) :: self
    ! Make the magnetic Jp integrals "Ji", evaluated at point "c",
    !    <a|J(c)|b> = \int dr [g_a grad g_b - g_b grad g_a] x (c - r)/ |c - r|^3
    ! These are used to get the magnetic field from the paramegnetic current
    ! density,
    !      B(c) = ( mu_o / 4 pi ) \int dr J(r) x (c - r)/|c - r|^3
    ! Note: in atomic units mu_o = 4 pi / c^2.
    ! Uses a double quadrature based on Rys method and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Jx,Jy,Jz
       real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx00,Sy00,Sz00,Sx10,Sy10,Sz10,Sx01,Sy01,Sz01,Sxmm,Symm,Szmm
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Fx00,Fy00,Fz00
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx00,self%a%l+2,self%b%l+2); call create_(Sy00,self%a%l+2,self%b%l+2); call create_(Sz00,self%a%l+2,self%b&
&%l+2)
      call create_(Sx10,self%a%l+1,self%b%l+1); call create_(Sy10,self%a%l+1,self%b%l+1); call create_(Sz10,self%a%l+1,self%b&
&%l+1)
      call create_(Sx01,self%a%l+1,self%b%l+1); call create_(Sy01,self%a%l+1,self%b%l+1); call create_(Sz01,self%a%l+1,self%b&
&%l+1)
      call create_(Sxmm,self%a%l+1,self%b%l+1); call create_(Symm,self%a%l+1,self%b%l+1); call create_(Szmm,self%a%l+1,self%b&
&%l+1)
      call create_(Fx00,self%a%l+2,self%b%l+2); call create_(Fy00,self%a%l+2,self%b%l+2); call create_(Fz00,self%a%l+2,self%b&
&%l+2)
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      n_roots = (self%a%l+self%b%l+1)/2 + 1
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Jx = 0.0d0; Jy = 0.0d0; Jz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_E_field_ints_(self,Sx00,Fx00,1,uu,c(1),self%a%l+1,self%b%l+1)
         call make_E_field_ints_(self,Sy00,Fy00,2,uu,c(2),self%a%l+1,self%b%l+1)
         call make_E_field_ints_(self,Sz00,Fz00,3,uu,c(3),self%a%l+1,self%b%l+1)
         Sz00 =  Sz00*wt
         Fz00 =  Fz00*wt
         call differentiate_(self,Sx00,"left",Sx10); call differentiate_(self,Sx00,"right",Sx01)
         call differentiate_(self,Sy00,"left",Sy10); call differentiate_(self,Sy00,"right",Sy01)
         call differentiate_(self,Sz00,"left",Sz10); call differentiate_(self,Sz00,"right",Sz01)
         Sxmm = Sx01 - Sx10
         Symm = Sy01 - Sy10
         Szmm = Sz01 - Sz10
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             Jx(a,b) = Jx(a,b) + Sx00(aix,bix) * &
                     (Symm(aiy,biy)*Fz00(aiz,biz) - Fy00(aiy,biy)*Szmm(aiz,biz))
             Jy(a,b) = Jy(a,b) + Sy00(aiy,biy) * &
                     (Fx00(aix,bix)*Szmm(aiz,biz) - Sxmm(aix,bix)*Fz00(aiz,biz))
             Jz(a,b) = Jz(a,b) + Sz00(aiz,biz) * &
                     (Sxmm(aix,bix)*Fy00(aiy,biy) - Fx00(aix,bix)*Symm(aiy,biy))
           end do
         end do
!         Jx = Jx + Sx00(ax,bx)*Symm(ay,by)*Fz00(az,bz) &
!                 - Sx00(ax,bx)*Fy00(ay,by)*Szmm(az,bz)
!         Jy = Jy + Fx00(ax,bx)*Sy00(ay,by)*Szmm(az,bz) &
!                 - Sxmm(ax,bx)*Sy00(ay,by)*Fz00(az,bz)
!         Jz = Jz + Sxmm(ax,bx)*Fy00(ay,by)*Sz00(az,bz) &
!                 - Fx00(ax,bx)*Symm(ay,by)*Sz00(az,bz)
      end do
      call destroy_(rys)
      call destroy_(Fz00); call destroy_(Fy00); call destroy_(Fx00)
      call destroy_(Szmm); call destroy_(Symm); call destroy_(Sxmm)
      call destroy_(Sz01); call destroy_(Sy01); call destroy_(Sx01)
      call destroy_(Sz10); call destroy_(Sy10); call destroy_(Sx10)
      call destroy_(Sz00); call destroy_(Sy00); call destroy_(Sx00)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      Jx = prefac*Jx
      Jy = prefac*Jy
      Jz = prefac*Jz

   end subroutine

   subroutine make_magnetic_S_ints(self,Mxx,Mxy,Mxz,Myx,Myy,Myz,Mzx,Mzy,Mzz,c)
    type(gaussian2_type) :: self
    ! Make the magnetic spin density integrals "Mij", evaluated at point "c",
    !    <a|Mij(c)|b> = \int dr grad_i ( g_a(r) g_b(r) ) (c - r)_j/ |c - r|^3
    ! These are used to get the magnetic field from the spin density,
    !      B(c) = -(g mu_b mu_o / 4 pi)
    !             \int dr curl rho_spin(r) x (c - r)/|c - r|3
    ! Note: in atomic units mu_o = 4 pi / c^2.
    ! Uses a double quadrature based on Rys method and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Mxx,Mxy,Mxz,Myx,Myy,Myz,Mzx,Mzy,Mzz
      real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx00,Sy00,Sz00,Sx10,Sy10,Sz10,Sx01,Sy01,Sz01,Sxpp,Sypp,Szpp
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Fx00,Fy00,Fz00,Fx10,Fy10,Fz10,Fx01,Fy01,Fz01,Fxpp,Fypp,Fzpp
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx00,self%a%l+2,self%b%l+2); call create_(Sy00,self%a%l+2,self%b%l+2); call create_(Sz00,self%a%l+2,self%b&
&%l+2)
      call create_(Sx10,self%a%l+1,self%b%l+1); call create_(Sy10,self%a%l+1,self%b%l+1); call create_(Sz10,self%a%l+1,self%b&
&%l+1)
      call create_(Sx01,self%a%l+1,self%b%l+1); call create_(Sy01,self%a%l+1,self%b%l+1); call create_(Sz01,self%a%l+1,self%b&
&%l+1)
      call create_(Sxpp,self%a%l+1,self%b%l+1); call create_(Sypp,self%a%l+1,self%b%l+1); call create_(Szpp,self%a%l+1,self%b&
&%l+1)
      call create_(Fx00,self%a%l+2,self%b%l+2); call create_(Fy00,self%a%l+2,self%b%l+2); call create_(Fz00,self%a%l+2,self%b&
&%l+2)
      call create_(Fx10,self%a%l+1,self%b%l+1); call create_(Fy10,self%a%l+1,self%b%l+1); call create_(Fz10,self%a%l+1,self%b&
&%l+1)
      call create_(Fx01,self%a%l+1,self%b%l+1); call create_(Fy01,self%a%l+1,self%b%l+1); call create_(Fz01,self%a%l+1,self%b&
&%l+1)
      call create_(Fxpp,self%a%l+1,self%b%l+1); call create_(Fypp,self%a%l+1,self%b%l+1); call create_(Fzpp,self%a%l+1,self%b&
&%l+1)
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      n_roots = (self%a%l+self%b%l+2)/2 + 1
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Mxx = 0.0d0; Mxy = 0.0d0; Mxz = 0.0d0
      Myx = 0.0d0; Myy = 0.0d0; Myz = 0.0d0
      Mzx = 0.0d0; Mzy = 0.0d0; Mzz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_E_field_ints_(self,Sx00,Fx00,1,uu,c(1),self%a%l+1,self%b%l+1)
         call make_E_field_ints_(self,Sy00,Fy00,2,uu,c(2),self%a%l+1,self%b%l+1)
         call make_E_field_ints_(self,Sz00,Fz00,3,uu,c(3),self%a%l+1,self%b%l+1)
         Sz00 =  Sz00*wt
         Fz00 =  Fz00*wt
         call differentiate_(self,Sx00,"left",Sx10); call differentiate_(self,Sx00,"right",Sx01)
         call differentiate_(self,Sy00,"left",Sy10); call differentiate_(self,Sy00,"right",Sy01)
         call differentiate_(self,Sz00,"left",Sz10); call differentiate_(self,Sz00,"right",Sz01)
         call differentiate_(self,Fx00,"left",Fx10); call differentiate_(self,Fx00,"right",Fx01)
         call differentiate_(self,Fy00,"left",Fy10); call differentiate_(self,Fy00,"right",Fy01)
         call differentiate_(self,Fz00,"left",Fz10); call differentiate_(self,Fz00,"right",Fz01)
         Sxpp = Sx01 + Sx10
         Sypp = Sy01 + Sy10
         Szpp = Sz01 + Sz10
         Fxpp = Fx01 + Fx10
         Fypp = Fy01 + Fy10
         Fzpp = Fz01 + Fz10
         Mxx = Mxx + Fxpp(ax,bx)*Sy00(ay,by)*Sz00(az,bz)  ! x has pp
         Mxy = Mxy + Sxpp(ax,bx)*Fy00(ay,by)*Sz00(az,bz)
         Mxz = Mxz + Sxpp(ax,bx)*Sy00(ay,by)*Fz00(az,bz)
         Myx = Myx + Fx00(ax,bx)*Sypp(ay,by)*Sz00(az,bz)  ! y has pp
         Myy = Myy + Sx00(ax,bx)*Fypp(ay,by)*Sz00(az,bz)
         Myz = Myz + Sx00(ax,bx)*Sypp(ay,by)*Fz00(az,bz)
         Mzx = Mzx + Fx00(ax,bx)*Sy00(ay,by)*Szpp(az,bz)  ! z has pp
         Mzy = Mzy + Sx00(ax,bx)*Fy00(ay,by)*Szpp(az,bz)
         Mzz = Mzz + Sx00(ax,bx)*Sy00(ay,by)*Fzpp(az,bz)
      end do
      call destroy_(rys)
      call destroy_(Fzpp); call destroy_(Fypp); call destroy_(Fxpp)
      call destroy_(Fz01); call destroy_(Fy01); call destroy_(Fx01)
      call destroy_(Fz10); call destroy_(Fy10); call destroy_(Fx10)
      call destroy_(Fz00); call destroy_(Fy00); call destroy_(Fx00)
      call destroy_(Szpp); call destroy_(Sypp); call destroy_(Sxpp)
      call destroy_(Sz01); call destroy_(Sy01); call destroy_(Sx01)
      call destroy_(Sz10); call destroy_(Sy10); call destroy_(Sx10)
      call destroy_(Sz00); call destroy_(Sy00); call destroy_(Sx00)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      Mxx = prefac*Mxx; Mxy = prefac*Mxy; Mxz = prefac*Mxz
      Myx = prefac*Myx; Myy = prefac*Myy; Myz = prefac*Myz
      Mzx = prefac*Mzx; Mzy = prefac*Mzy; Mzz = prefac*Mzz

   end subroutine

   subroutine make_magnetic_S_ints_1(self,M,c)
    type(gaussian2_type) :: self
    ! Make the magnetic spin density integrals "Mij", evaluated at point "c",
    !    <a|Mij(c)|b> = \int dr grad_i ( g_a(r) g_b(r) ) (c - r)_j/ |c - r|^3
    ! These are used to get the magnetic field from the spin density,
    !      B(c) = -(g mu_b mu_o / 4 pi)
    !             \int dr curl rho_spin(r) x (c - r)/|c - r|3
    ! Note: in atomic units mu_o = 4 pi / c^2.
    ! Uses a double quadrature based on Rys method and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:,:,:) :: M
      real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx00,Sy00,Sz00,Sx10,Sy10,Sz10,Sx01,Sy01,Sz01,Sxpp,Sypp,Szpp
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Fx00,Fy00,Fz00,Fx10,Fy10,Fz10,Fx01,Fy01,Fz01,Fxpp,Fypp,Fzpp
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx00,self%a%l+2,self%b%l+2); call create_(Sy00,self%a%l+2,self%b%l+2); call create_(Sz00,self%a%l+2,self%b&
&%l+2)
      call create_(Sx10,self%a%l+1,self%b%l+1); call create_(Sy10,self%a%l+1,self%b%l+1); call create_(Sz10,self%a%l+1,self%b&
&%l+1)
      call create_(Sx01,self%a%l+1,self%b%l+1); call create_(Sy01,self%a%l+1,self%b%l+1); call create_(Sz01,self%a%l+1,self%b&
&%l+1)
      call create_(Sxpp,self%a%l+1,self%b%l+1); call create_(Sypp,self%a%l+1,self%b%l+1); call create_(Szpp,self%a%l+1,self%b&
&%l+1)
      call create_(Fx00,self%a%l+2,self%b%l+2); call create_(Fy00,self%a%l+2,self%b%l+2); call create_(Fz00,self%a%l+2,self%b&
&%l+2)
      call create_(Fx10,self%a%l+1,self%b%l+1); call create_(Fy10,self%a%l+1,self%b%l+1); call create_(Fz10,self%a%l+1,self%b&
&%l+1)
      call create_(Fx01,self%a%l+1,self%b%l+1); call create_(Fy01,self%a%l+1,self%b%l+1); call create_(Fz01,self%a%l+1,self%b&
&%l+1)
      call create_(Fxpp,self%a%l+1,self%b%l+1); call create_(Fypp,self%a%l+1,self%b%l+1); call create_(Fzpp,self%a%l+1,self%b&
&%l+1)
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      n_roots = (self%a%l+self%b%l+2)/2 + 1
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      M = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_E_field_ints_(self,Sx00,Fx00,1,uu,c(1),self%a%l+1,self%b%l+1)
         call make_E_field_ints_(self,Sy00,Fy00,2,uu,c(2),self%a%l+1,self%b%l+1)
         call make_E_field_ints_(self,Sz00,Fz00,3,uu,c(3),self%a%l+1,self%b%l+1)
         Sz00 =  Sz00*wt
         Fz00 =  Fz00*wt
         call differentiate_(self,Sx00,"left",Sx10); call differentiate_(self,Sx00,"right",Sx01)
         call differentiate_(self,Sy00,"left",Sy10); call differentiate_(self,Sy00,"right",Sy01)
         call differentiate_(self,Sz00,"left",Sz10); call differentiate_(self,Sz00,"right",Sz01)
         call differentiate_(self,Fx00,"left",Fx10); call differentiate_(self,Fx00,"right",Fx01)
         call differentiate_(self,Fy00,"left",Fy10); call differentiate_(self,Fy00,"right",Fy01)
         call differentiate_(self,Fz00,"left",Fz10); call differentiate_(self,Fz00,"right",Fz01)
         Sxpp = Sx01 + Sx10
         Sypp = Sy01 + Sy10
         Szpp = Sz01 + Sz10
         Fxpp = Fx01 + Fx10
         Fypp = Fy01 + Fy10
         Fzpp = Fz01 + Fz10
         M(:,:,1,1) = M(:,:,1,1) + Fxpp(ax,bx)*Sy00(ay,by)*Sz00(az,bz)  ! x has pp
         M(:,:,1,2) = M(:,:,1,2) + Sxpp(ax,bx)*Fy00(ay,by)*Sz00(az,bz)
         M(:,:,1,3) = M(:,:,1,2) + Sxpp(ax,bx)*Sy00(ay,by)*Fz00(az,bz)
         M(:,:,2,1) = M(:,:,2,1) + Fx00(ax,bx)*Sypp(ay,by)*Sz00(az,bz)  ! y has pp
         M(:,:,2,2) = M(:,:,2,2) + Sx00(ax,bx)*Fypp(ay,by)*Sz00(az,bz)
         M(:,:,2,3) = M(:,:,2,3) + Sx00(ax,bx)*Sypp(ay,by)*Fz00(az,bz)
         M(:,:,3,1) = M(:,:,3,1) + Fx00(ax,bx)*Sy00(ay,by)*Szpp(az,bz)  ! z has pp
         M(:,:,3,2) = M(:,:,3,2) + Sx00(ax,bx)*Fy00(ay,by)*Szpp(az,bz)
         M(:,:,3,3) = M(:,:,3,3) + Sx00(ax,bx)*Sy00(ay,by)*Fzpp(az,bz)
      end do
      call destroy_(rys)
      call destroy_(Fzpp); call destroy_(Fypp); call destroy_(Fxpp)
      call destroy_(Fz01); call destroy_(Fy01); call destroy_(Fx01)
      call destroy_(Fz10); call destroy_(Fy10); call destroy_(Fx10)
      call destroy_(Fz00); call destroy_(Fy00); call destroy_(Fx00)
      call destroy_(Szpp); call destroy_(Sypp); call destroy_(Sxpp)
      call destroy_(Sz01); call destroy_(Sy01); call destroy_(Sx01)
      call destroy_(Sz10); call destroy_(Sy10); call destroy_(Sx10)
      call destroy_(Sz00); call destroy_(Sy00); call destroy_(Sx00)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/p
      M = prefac*M

   end subroutine

   subroutine make_solenoidal_jp_ints(self,Jx,Jy,Jz,c)
    type(gaussian2_type) :: self
    ! Make the solenoidal Jp integrals "Ji", evaluated at point "c",
    !    <a|J(c)|b> = (1/8 3.141592653589793d0) \int dr curl [g_a grad g_b - g_b grad g_a] x (c - r)/ |c - r|^3
    ! Uses a double quadrature based on Rys method and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Jx,Jy,Jz
      real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx00,Sy00,Sz00,Sx10,Sy10,Sz10,Sx01,Sy01,Sz01,Sxpp,Sypp,Szpp,Sxmm,Sym&
&m,Szmm
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Fx00,Fy00,Fz00,Fx10,Fy10,Fz10,Fx01,Fy01,Fz01,Fxpp,Fypp,Fzpp,Fxmm,Fym&
&m,Fzmm
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      real(kind=kind(1.0d0)) :: Sx00_ab,Sy00_ab,Sz00_ab,Sxpp_ab,Sypp_ab,Szpp_ab
      real(kind=kind(1.0d0)) :: Fxpp_ab,Fypp_ab,Fzpp_ab
      real(kind=kind(1.0d0)) :: Sxmm_ab,Symm_ab,Szmm_ab,Fxmm_ab,Fymm_ab,Fzmm_ab
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx00,self%a%l+2,self%b%l+2); call create_(Sy00,self%a%l+2,self%b%l+2); call create_(Sz00,self%a%l+2,self%b&
&%l+2)
      call create_(Sx10,self%a%l+1,self%b%l+1); call create_(Sy10,self%a%l+1,self%b%l+1); call create_(Sz10,self%a%l+1,self%b&
&%l+1)
      call create_(Sx01,self%a%l+1,self%b%l+1); call create_(Sy01,self%a%l+1,self%b%l+1); call create_(Sz01,self%a%l+1,self%b&
&%l+1)
      call create_(Sxpp,self%a%l+1,self%b%l+1); call create_(Sypp,self%a%l+1,self%b%l+1); call create_(Szpp,self%a%l+1,self%b&
&%l+1)
      call create_(Sxmm,self%a%l+1,self%b%l+1); call create_(Symm,self%a%l+1,self%b%l+1); call create_(Szmm,self%a%l+1,self%b&
&%l+1)
      call create_(Fx00,self%a%l+2,self%b%l+2); call create_(Fy00,self%a%l+2,self%b%l+2); call create_(Fz00,self%a%l+2,self%b&
&%l+2)
      call create_(Fx10,self%a%l+1,self%b%l+1); call create_(Fy10,self%a%l+1,self%b%l+1); call create_(Fz10,self%a%l+1,self%b&
&%l+1)
      call create_(Fx01,self%a%l+1,self%b%l+1); call create_(Fy01,self%a%l+1,self%b%l+1); call create_(Fz01,self%a%l+1,self%b&
&%l+1)
      call create_(Fxpp,self%a%l+1,self%b%l+1); call create_(Fypp,self%a%l+1,self%b%l+1); call create_(Fzpp,self%a%l+1,self%b&
&%l+1)
      call create_(Fxmm,self%a%l+1,self%b%l+1); call create_(Fymm,self%a%l+1,self%b%l+1); call create_(Fzmm,self%a%l+1,self%b&
&%l+1)
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      n_roots = (self%a%l+self%b%l+2)/2 + 1
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Jx = 0.0d0; Jy = 0.0d0; Jz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_E_field_ints_(self,Sx00,Fx00,1,uu,c(1),self%a%l+1,self%b%l+1)
         call make_E_field_ints_(self,Sy00,Fy00,2,uu,c(2),self%a%l+1,self%b%l+1)
         call make_E_field_ints_(self,Sz00,Fz00,3,uu,c(3),self%a%l+1,self%b%l+1)
         Sz00 =  Sz00*wt
         Fz00 =  Fz00*wt
         call differentiate_(self,Sx00,"left",Sx10); call differentiate_(self,Sx00,"right",Sx01)
         call differentiate_(self,Sy00,"left",Sy10); call differentiate_(self,Sy00,"right",Sy01)
         call differentiate_(self,Sz00,"left",Sz10); call differentiate_(self,Sz00,"right",Sz01)
         call differentiate_(self,Fx00,"left",Fx10); call differentiate_(self,Fx00,"right",Fx01)
         call differentiate_(self,Fy00,"left",Fy10); call differentiate_(self,Fy00,"right",Fy01)
         call differentiate_(self,Fz00,"left",Fz10); call differentiate_(self,Fz00,"right",Fz01)
         Sxpp = Sx01 + Sx10; Sxmm = Sx01 - Sx10
         Sypp = Sy01 + Sy10; Symm = Sy01 - Sy10
         Szpp = Sz01 + Sz10; Szmm = Sz01 - Sz10
         Fxpp = Fx01 + Fx10; Fxmm = Fx01 - Fx10
         Fypp = Fy01 + Fy10; Fymm = Fy01 - Fy10
         Fzpp = Fz01 + Fz10; Fzmm = Fz01 - Fz10
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             Sx00_ab = Sx00(aix,bix)
             Sy00_ab = Sy00(aiy,biy)
             Sz00_ab = Sz00(aiz,biz)
             Sxpp_ab = Sxpp(aix,bix)
             Sypp_ab = Sypp(aiy,biy)
             Szpp_ab = Szpp(aiz,biz)
             Fxpp_ab = Fxpp(aix,bix)
             Fypp_ab = Fypp(aiy,biy)
             Fzpp_ab = Fzpp(aiz,biz)
             Sxmm_ab = Sxmm(aix,bix)
             Symm_ab = Symm(aiy,biy)
             Szmm_ab = Szmm(aiz,biz)
             Fxmm_ab = Fxmm(aix,bix)
             Fymm_ab = Fymm(aiy,biy)
             Fzmm_ab = Fzmm(aiz,biz)
             Jx(a,b) = Jx(a,b) &
                + Sxmm_ab*Sy00_ab*Fzpp_ab &
                - Sxpp_ab*Sy00_ab*Fzmm_ab &
                - Sxpp_ab*Fymm_ab*Sz00_ab &
                + Sxmm_ab*Fypp_ab*Sz00_ab
             Jy(a,b) = Jy(a,b) &
                + Fxpp_ab*Symm_ab*Sz00_ab &
                - Fxmm_ab*Sypp_ab*Sz00_ab &
                - Sx00_ab*Sypp_ab*Fzmm_ab &
                + Sx00_ab*Symm_ab*Fzpp_ab
             Jz(a,b) = Jz(a,b) &
                + Sx00_ab*Fypp_ab*Szmm_ab &
                - Sx00_ab*Fymm_ab*Szpp_ab &
                - Fxmm_ab*Sy00_ab*Szpp_ab &
                + Fxpp_ab*Sy00_ab*Szmm_ab
           end do
         end do
!         Jx = Jx &
!            + Sxmm(ax,bx)*Sy00(ay,by)*Fzpp(az,bz) &
!            - Sxpp(ax,bx)*Sy00(ay,by)*Fzmm(az,bz) &
!            - Sxpp(ax,bx)*Fymm(ay,by)*Sz00(az,bz) &
!            + Sxmm(ax,bx)*Fypp(ay,by)*Sz00(az,bz)
!         Jy = Jy &
!            + Fxpp(ax,bx)*Symm(ay,by)*Sz00(az,bz) &
!            - Fxmm(ax,bx)*Sypp(ay,by)*Sz00(az,bz) &
!            - Sx00(ax,bx)*Sypp(ay,by)*Fzmm(az,bz) &
!            + Sx00(ax,bx)*Symm(ay,by)*Fzpp(az,bz)
!         Jz = Jz &
!            + Sx00(ax,bx)*Fypp(ay,by)*Szmm(az,bz) &
!            - Sx00(ax,bx)*Fymm(ay,by)*Szpp(az,bz) &
!            - Fxmm(ax,bx)*Sy00(ay,by)*Szpp(az,bz) &
!            + Fxpp(ax,bx)*Sy00(ay,by)*Szmm(az,bz)
      end do
      call destroy_(rys)
      call destroy_(Fzmm); call destroy_(Fymm); call destroy_(Fxmm)
      call destroy_(Fzpp); call destroy_(Fypp); call destroy_(Fxpp)
      call destroy_(Fz01); call destroy_(Fy01); call destroy_(Fx01)
      call destroy_(Fz10); call destroy_(Fy10); call destroy_(Fx10)
      call destroy_(Fz00); call destroy_(Fy00); call destroy_(Fx00)
      call destroy_(Szmm); call destroy_(Symm); call destroy_(Sxmm)
      call destroy_(Szpp); call destroy_(Sypp); call destroy_(Sxpp)
      call destroy_(Sz01); call destroy_(Sy01); call destroy_(Sx01)
      call destroy_(Sz10); call destroy_(Sy10); call destroy_(Sx10)
      call destroy_(Sz00); call destroy_(Sy00); call destroy_(Sx00)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/(8*3.141592653589793d0*p)
      Jx = prefac*Jx
      Jy = prefac*Jy
      Jz = prefac*Jz

   end subroutine

   subroutine make_solenoidal_jd_ints(self,Jx,Jy,Jz,B_field,origin,c)
    type(gaussian2_type) :: self
    ! Make the solenoidal Jd integrals "Ji", with external magnetic field
    ! "B_field", gauge origin "origin",evaluated at point "c",
    !    <a|J(c)|b> = (1/8 3.141592653589793d0) \int dr (curl J^d_ab(r)) x (c - r)/ |c - r|^3
    !     curl J^d_ab(r) = B (2 g_a(r)g_b(r) + (r-r_o).grad g_a(r)g_b(r))
    !                      - (r-r_o)(B.grad g_a(r)g_b(r))
    ! Uses a double quadrature based on Rys method and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Jx,Jy,Jz
      real(kind=kind(1.0d0)), dimension(3) :: B_field,origin,c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx00,Sy00,Sz00,Sx10,Sy10,Sz10,Sx01,Sy01,Sz01,Sxpp,Sypp,Szpp
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Dx00,Dy00,Dz00,Dx10,Dy10,Dz10,Dx01,Dy01,Dz01,Dxpp,Dypp,Dzpp
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Fx00,Fy00,Fz00,Fx10,Fy10,Fz10,Fx01,Fy01,Fz01,Fxpp,Fypp,Fzpp
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Qx00,Qy00,Qz00,Qx10,Qy10,Qz10,Qx01,Qy01,Qz01,Qxpp,Qypp,Qzpp
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac,B_x,B_y,B_z
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      type(rys_type), pointer :: rys
      real(kind=kind(1.0d0)) :: Sx00_ab,Sy00_ab,Sz00_ab,Fx00_ab,Fy00_ab,Fz00_ab
      real(kind=kind(1.0d0)) :: Dx00_ab,Dy00_ab,Dz00_ab
      real(kind=kind(1.0d0)) :: Sxpp_ab,Sypp_ab,Szpp_ab,Fxpp_ab,Fypp_ab,Fzpp_ab
      real(kind=kind(1.0d0)) :: Dxpp_ab,Dypp_ab,Dzpp_ab,Qxpp_ab,Qypp_ab,Qzpp_ab

      B_x = B_field(1)
      B_y = B_field(2)
      B_z = B_field(3)
      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx00,self%a%l+2,self%b%l+2); call create_(Sy00,self%a%l+2,self%b%l+2); call create_(Sz00,self%a%l+2,self%b&
&%l+2)
      call create_(Sx10,self%a%l+1,self%b%l+1); call create_(Sy10,self%a%l+1,self%b%l+1); call create_(Sz10,self%a%l+1,self%b&
&%l+1)
      call create_(Sx01,self%a%l+1,self%b%l+1); call create_(Sy01,self%a%l+1,self%b%l+1); call create_(Sz01,self%a%l+1,self%b&
&%l+1)
      call create_(Sxpp,self%a%l+1,self%b%l+1); call create_(Sypp,self%a%l+1,self%b%l+1); call create_(Szpp,self%a%l+1,self%b&
&%l+1)
      call create_(Dx00,self%a%l+2,self%b%l+2); call create_(Dy00,self%a%l+2,self%b%l+2); call create_(Dz00,self%a%l+2,self%b&
&%l+2)
      call create_(Dx10,self%a%l+1,self%b%l+1); call create_(Dy10,self%a%l+1,self%b%l+1); call create_(Dz10,self%a%l+1,self%b&
&%l+1)
      call create_(Dx01,self%a%l+1,self%b%l+1); call create_(Dy01,self%a%l+1,self%b%l+1); call create_(Dz01,self%a%l+1,self%b&
&%l+1)
      call create_(Dxpp,self%a%l+1,self%b%l+1); call create_(Dypp,self%a%l+1,self%b%l+1); call create_(Dzpp,self%a%l+1,self%b&
&%l+1)
      call create_(Fx00,self%a%l+2,self%b%l+2); call create_(Fy00,self%a%l+2,self%b%l+2); call create_(Fz00,self%a%l+2,self%b&
&%l+2)
      call create_(Fx10,self%a%l+1,self%b%l+1); call create_(Fy10,self%a%l+1,self%b%l+1); call create_(Fz10,self%a%l+1,self%b&
&%l+1)
      call create_(Fx01,self%a%l+1,self%b%l+1); call create_(Fy01,self%a%l+1,self%b%l+1); call create_(Fz01,self%a%l+1,self%b&
&%l+1)
      call create_(Fxpp,self%a%l+1,self%b%l+1); call create_(Fypp,self%a%l+1,self%b%l+1); call create_(Fzpp,self%a%l+1,self%b&
&%l+1)
      call create_(Qx00,self%a%l+2,self%b%l+2); call create_(Qy00,self%a%l+2,self%b%l+2); call create_(Qz00,self%a%l+2,self%b&
&%l+2)
      call create_(Qx10,self%a%l+1,self%b%l+1); call create_(Qy10,self%a%l+1,self%b%l+1); call create_(Qz10,self%a%l+1,self%b&
&%l+1)
      call create_(Qx01,self%a%l+1,self%b%l+1); call create_(Qy01,self%a%l+1,self%b%l+1); call create_(Qz01,self%a%l+1,self%b&
&%l+1)
      call create_(Qxpp,self%a%l+1,self%b%l+1); call create_(Qypp,self%a%l+1,self%b%l+1); call create_(Qzpp,self%a%l+1,self%b&
&%l+1)
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      n_roots = (self%a%l+self%b%l+3)/2 + 1
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Jx = 0.0d0; Jy = 0.0d0; Jz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_q_field_ints_(self,Sx00,Dx00,Fx00,Qx00,1,uu,c(1),origin(1),self%a%l+1,self%b%l+1)
         call make_q_field_ints_(self,Sy00,Dy00,Fy00,Qy00,2,uu,c(2),origin(2),self%a%l+1,self%b%l+1)
         call make_q_field_ints_(self,Sz00,Dz00,Fz00,Qz00,3,uu,c(3),origin(3),self%a%l+1,self%b%l+1)
         Sz00 =  Sz00*wt
         Dz00 =  Dz00*wt
         Fx00 = -Fx00      ! minus sign to give (c-r) instead of (r-c)
         Fy00 = -Fy00
         Fz00 = -Fz00*wt
         Qx00 = -Qx00
         Qy00 = -Qy00
         Qz00 = -Qz00*wt
         call differentiate_(self,Sx00,"left",Sx10); call differentiate_(self,Sx00,"right",Sx01)
         call differentiate_(self,Sy00,"left",Sy10); call differentiate_(self,Sy00,"right",Sy01)
         call differentiate_(self,Sz00,"left",Sz10); call differentiate_(self,Sz00,"right",Sz01)
         call differentiate_(self,Dx00,"left",Dx10); call differentiate_(self,Dx00,"right",Dx01)
         call differentiate_(self,Dy00,"left",Dy10); call differentiate_(self,Dy00,"right",Dy01)
         call differentiate_(self,Dz00,"left",Dz10); call differentiate_(self,Dz00,"right",Dz01)
         call differentiate_(self,Fx00,"left",Fx10); call differentiate_(self,Fx00,"right",Fx01)
         call differentiate_(self,Fy00,"left",Fy10); call differentiate_(self,Fy00,"right",Fy01)
         call differentiate_(self,Fz00,"left",Fz10); call differentiate_(self,Fz00,"right",Fz01)
         call differentiate_(self,Qx00,"left",Qx10); call differentiate_(self,Qx00,"right",Qx01)
         call differentiate_(self,Qy00,"left",Qy10); call differentiate_(self,Qy00,"right",Qy01)
         call differentiate_(self,Qz00,"left",Qz10); call differentiate_(self,Qz00,"right",Qz01)
         Sxpp = Sx01 + Sx10
         Sypp = Sy01 + Sy10
         Szpp = Sz01 + Sz10
         Dxpp = Dx01 + Dx10
         Dypp = Dy01 + Dy10
         Dzpp = Dz01 + Dz10
         Fxpp = Fx01 + Fx10
         Fypp = Fy01 + Fy10
         Fzpp = Fz01 + Fz10
         Qxpp = Qx01 + Qx10
         Qypp = Qy01 + Qy10
         Qzpp = Qz01 + Qz10
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             Sx00_ab = Sx00(aix,bix)
             Sy00_ab = Sy00(aiy,biy)
             Sz00_ab = Sz00(aiz,biz)
             Fx00_ab = Fx00(aix,bix)
             Fy00_ab = Fy00(aiy,biy)
             Fz00_ab = Fz00(aiz,biz)
             Sxpp_ab = Sxpp(aix,bix)
             Sypp_ab = Sypp(aiy,biy)
             Szpp_ab = Szpp(aiz,biz)
             Fxpp_ab = Fxpp(aix,bix)
             Fypp_ab = Fypp(aiy,biy)
             Fzpp_ab = Fzpp(aiz,biz)
             Dx00_ab = Dx00(aix,bix)
             Dy00_ab = Dy00(aiy,biy)
             Dz00_ab = Dz00(aiz,biz)
             Dxpp_ab = Dxpp(aix,bix)
             Dypp_ab = Dypp(aiy,biy)
             Dzpp_ab = Dzpp(aiz,biz)
             Qxpp_ab = Qxpp(aix,bix)
             Qypp_ab = Qypp(aiy,biy)
             Qzpp_ab = Qzpp(aiz,biz)
             Jx(a,b) = Jx(a,b) &
              + B_y*( 2.0d0*Sx00_ab*Sy00_ab*Fz00_ab &
              + Dxpp_ab*Sy00_ab*Fz00_ab  &
              + Sx00_ab*Dypp_ab*Fz00_ab  &
              + Sx00_ab*Sy00_ab*Qzpp_ab) &
              - B_z*( 2.0d0*Sx00_ab*Fy00_ab*Sz00_ab &
              + Dxpp_ab*Fy00_ab*Sz00_ab  &
              + Sx00_ab*Qypp_ab*Sz00_ab  &
              + Sx00_ab*Fy00_ab*Dzpp_ab) &
              - B_x*(Sxpp_ab*Dy00_ab*Fz00_ab - Sxpp_ab*Fy00_ab*Dz00_ab) &
              - B_y*(Sx00_ab*Dypp_ab*Fz00_ab - Sx00_ab*Fypp_ab*Dz00_ab) &
              - B_z*(Sx00_ab*Dy00_ab*Fzpp_ab - Sx00_ab*Fy00_ab*Dzpp_ab)
             Jy(a,b) = Jy(a,b) &
              + B_z*( 2.0d0*Fx00_ab*Sy00_ab*Sz00_ab &
              + Qxpp_ab*Sy00_ab*Sz00_ab  &
              + Fx00_ab*Dypp_ab*Sz00_ab  &
              + Fx00_ab*Sy00_ab*Dzpp_ab) &
              - B_x*( 2.0d0*Sx00_ab*Sy00_ab*Fz00_ab &
              + Dxpp_ab*Sy00_ab*Fz00_ab  &
              + Sx00_ab*Dypp_ab*Fz00_ab  &
              + Sx00_ab*Sy00_ab*Qzpp_ab) &
              - B_x*(Fxpp_ab*Sy00_ab*Dz00_ab - Dxpp_ab*Sy00_ab*Fz00_ab) &
              - B_y*(Fx00_ab*Sypp_ab*Dz00_ab - Dx00_ab*Sypp_ab*Fz00_ab) &
              - B_z*(Fx00_ab*Sy00_ab*Dzpp_ab - Dx00_ab*Sy00_ab*Fzpp_ab)
             Jz(a,b) = Jz(a,b) &
              + B_x*( 2.0d0*Sx00_ab*Fy00_ab*Sz00_ab &
              + Dxpp_ab*Fy00_ab*Sz00_ab  &
              + Sx00_ab*Qypp_ab*Sz00_ab  &
              + Sx00_ab*Fy00_ab*Dzpp_ab) &
              - B_y*( 2.0d0*Fx00_ab*Sy00_ab*Sz00_ab &
              + Qxpp_ab*Sy00_ab*Sz00_ab  &
              + Fx00_ab*Dypp_ab*Sz00_ab  &
              + Fx00_ab*Sy00_ab*Dzpp_ab) &
              - B_x*(Dxpp_ab*Fy00_ab*Sz00_ab - Fxpp_ab*Dy00_ab*Sz00_ab) &
              - B_y*(Dx00_ab*Fypp_ab*Sz00_ab - Fx00_ab*Dypp_ab*Sz00_ab) &
              - B_z*(Dx00_ab*Fy00_ab*Szpp_ab - Fx00_ab*Dy00_ab*Szpp_ab)
           end do
         end do
!         Jx = Jx &
!          + B_field(2)*( 2.0d0*Sx00(ax,bx)*Sy00(ay,by)*Fz00(az,bz) &
!          + Dxpp(ax,bx)*Sy00(ay,by)*Fz00(az,bz)  &
!          + Sx00(ax,bx)*Dypp(ay,by)*Fz00(az,bz)  &
!          + Sx00(ax,bx)*Sy00(ay,by)*Qzpp(az,bz)) &
!          - B_field(3)*( 2.0d0*Sx00(ax,bx)*Fy00(ay,by)*Sz00(az,bz) &
!          + Dxpp(ax,bx)*Fy00(ay,by)*Sz00(az,bz)  &
!          + Sx00(ax,bx)*Qypp(ay,by)*Sz00(az,bz)  &
!          + Sx00(ax,bx)*Fy00(ay,by)*Dzpp(az,bz)) &
!          - B_field(1)*(Sxpp(ax,bx)*Dy00(ay,by)*Fz00(az,bz) - Sxpp(ax,bx)*Fy00(ay,by)*Dz00(az,bz)) &
!          - B_field(2)*(Sx00(ax,bx)*Dypp(ay,by)*Fz00(az,bz) - Sx00(ax,bx)*Fypp(ay,by)*Dz00(az,bz)) &
!          - B_field(3)*(Sx00(ax,bx)*Dy00(ay,by)*Fzpp(az,bz) - Sx00(ax,bx)*Fy00(ay,by)*Dzpp(az,bz))
!         Jy = Jy &
!          + B_field(3)*( 2.0d0*Fx00(ax,bx)*Sy00(ay,by)*Sz00(az,bz) &
!          + Qxpp(ax,bx)*Sy00(ay,by)*Sz00(az,bz)  &
!          + Fx00(ax,bx)*Dypp(ay,by)*Sz00(az,bz)  &
!          + Fx00(ax,bx)*Sy00(ay,by)*Dzpp(az,bz)) &
!          - B_field(1)*( 2.0d0*Sx00(ax,bx)*Sy00(ay,by)*Fz00(az,bz) &
!          + Dxpp(ax,bx)*Sy00(ay,by)*Fz00(az,bz)  &
!          + Sx00(ax,bx)*Dypp(ay,by)*Fz00(az,bz)  &
!          + Sx00(ax,bx)*Sy00(ay,by)*Qzpp(az,bz)) &
!          - B_field(1)*(Fxpp(ax,bx)*Sy00(ay,by)*Dz00(az,bz) - Dxpp(ax,bx)*Sy00(ay,by)*Fz00(az,bz)) &
!          - B_field(2)*(Fx00(ax,bx)*Sypp(ay,by)*Dz00(az,bz) - Dx00(ax,bx)*Sypp(ay,by)*Fz00(az,bz)) &
!          - B_field(3)*(Fx00(ax,bx)*Sy00(ay,by)*Dzpp(az,bz) - Dx00(ax,bx)*Sy00(ay,by)*Fzpp(az,bz))
!         Jz = Jz &
!          + B_field(1)*( 2.0d0*Sx00(ax,bx)*Fy00(ay,by)*Sz00(az,bz) &
!          + Dxpp(ax,bx)*Fy00(ay,by)*Sz00(az,bz)  &
!          + Sx00(ax,bx)*Qypp(ay,by)*Sz00(az,bz)  &
!          + Sx00(ax,bx)*Fy00(ay,by)*Dzpp(az,bz)) &
!          - B_field(2)*( 2.0d0*Fx00(ax,bx)*Sy00(ay,by)*Sz00(az,bz) &
!          + Qxpp(ax,bx)*Sy00(ay,by)*Sz00(az,bz)  &
!          + Fx00(ax,bx)*Dypp(ay,by)*Sz00(az,bz)  &
!          + Fx00(ax,bx)*Sy00(ay,by)*Dzpp(az,bz)) &
!          - B_field(1)*(Dxpp(ax,bx)*Fy00(ay,by)*Sz00(az,bz) - Fxpp(ax,bx)*Dy00(ay,by)*Sz00(az,bz)) &
!          - B_field(2)*(Dx00(ax,bx)*Fypp(ay,by)*Sz00(az,bz) - Fx00(ax,bx)*Dypp(ay,by)*Sz00(az,bz)) &
!          - B_field(3)*(Dx00(ax,bx)*Fy00(ay,by)*Szpp(az,bz) - Fx00(ax,bx)*Dy00(ay,by)*Szpp(az,bz))
      end do
      call destroy_(rys)
      call destroy_(Qzpp); call destroy_(Qypp); call destroy_(Qxpp)
      call destroy_(Qz01); call destroy_(Qy01); call destroy_(Qx01)
      call destroy_(Qz10); call destroy_(Qy10); call destroy_(Qx10)
      call destroy_(Qz00); call destroy_(Qy00); call destroy_(Qx00)
      call destroy_(Fzpp); call destroy_(Fypp); call destroy_(Fxpp)
      call destroy_(Fz01); call destroy_(Fy01); call destroy_(Fx01)
      call destroy_(Fz10); call destroy_(Fy10); call destroy_(Fx10)
      call destroy_(Fz00); call destroy_(Fy00); call destroy_(Fx00)
      call destroy_(Qzpp); call destroy_(Qypp); call destroy_(Qxpp)
      call destroy_(Qz01); call destroy_(Qy01); call destroy_(Qx01)
      call destroy_(Qz10); call destroy_(Qy10); call destroy_(Qx10)
      call destroy_(Qz00); call destroy_(Qy00); call destroy_(Qx00)
      call destroy_(Szpp); call destroy_(Sypp); call destroy_(Sxpp)
      call destroy_(Sz01); call destroy_(Sy01); call destroy_(Sx01)
      call destroy_(Sz10); call destroy_(Sy10); call destroy_(Sx10)
      call destroy_(Sz00); call destroy_(Sy00); call destroy_(Sx00)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/(8*3.141592653589793d0*p)
      Jx = prefac*Jx
      Jy = prefac*Jy
      Jz = prefac*Jz

   end subroutine

   subroutine make_irrotational_jp_ints(self,Jx,Jy,Jz,c)
    type(gaussian2_type) :: self
    ! Make the solenoidal Jp integrals "Ji", evaluated at point "c",
    !    <a|J(c)|b> = (1/8 3.141592653589793d0) \int dr curl [g_a grad g_b - g_b grad g_a] x (c - r)/ |c - r|^3
    ! Uses a double quadrature based on Rys method and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Jx,Jy,Jz
       real(kind=kind(1.0d0)), dimension(3) :: c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx00,Sy00,Sz00,Sx10,Sy10,Sz10,Sx01,Sy01,Sz01,Sxmm,Symm,Szmm
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Fx00,Fy00,Fz00,Fx10,Fy10,Fz10,Fx01,Fy01,Fz01,Fxmm,Fymm,Fzmm
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      real(kind=kind(1.0d0)) :: Sx00_ab,Sy00_ab,Sz00_ab,Fx00_ab,Fy00_ab,Fz00_ab
      real(kind=kind(1.0d0)) :: Sxmm_ab,Symm_ab,Szmm_ab,Fxmm_ab,Fymm_ab,Fzmm_ab
      type(rys_type), pointer :: rys

      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx00,self%a%l+3,self%b%l+3); call create_(Sy00,self%a%l+3,self%b%l+3); call create_(Sz00,self%a%l+3,self%b&
&%l+3)
      call create_(Sx10,self%a%l+2,self%b%l+2); call create_(Sy10,self%a%l+2,self%b%l+2); call create_(Sz10,self%a%l+2,self%b&
&%l+2)
      call create_(Sx01,self%a%l+2,self%b%l+2); call create_(Sy01,self%a%l+2,self%b%l+2); call create_(Sz01,self%a%l+2,self%b&
&%l+2)
      call create_(Sxmm,self%a%l+2,self%b%l+2); call create_(Symm,self%a%l+2,self%b%l+2); call create_(Szmm,self%a%l+2,self%b&
&%l+2)
      call create_(Fx00,self%a%l+3,self%b%l+3); call create_(Fy00,self%a%l+3,self%b%l+3); call create_(Fz00,self%a%l+3,self%b&
&%l+3)
      call create_(Fx10,self%a%l+2,self%b%l+2); call create_(Fy10,self%a%l+2,self%b%l+2); call create_(Fz10,self%a%l+2,self%b&
&%l+2)
      call create_(Fx01,self%a%l+2,self%b%l+2); call create_(Fy01,self%a%l+2,self%b%l+2); call create_(Fz01,self%a%l+2,self%b&
&%l+2)
      call create_(Fxmm,self%a%l+2,self%b%l+2); call create_(Fymm,self%a%l+2,self%b%l+2); call create_(Fzmm,self%a%l+2,self%b&
&%l+2)
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      n_roots = (self%a%l+self%b%l+3)/2 + 1
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Jx = 0.0d0; Jy = 0.0d0; Jz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_E_field_ints_(self,Sx00,Fx00,1,uu,c(1),self%a%l+2,self%b%l+2)
         call make_E_field_ints_(self,Sy00,Fy00,2,uu,c(2),self%a%l+2,self%b%l+2)
         call make_E_field_ints_(self,Sz00,Fz00,3,uu,c(3),self%a%l+2,self%b%l+2)
         Sz00 =  Sz00*wt
         Fz00 =  Fz00*wt
         call differentiate_(self,Sx00,"right",Sx01); call differentiate_(self,Sx01,"right",Sxmm)
         call differentiate_(self,Sx00,"left" ,Sx10); call differentiate_(self,Sx10,"left" ,Sx01)
         call differentiate_(self,Sy00,"right",Sy01); call differentiate_(self,Sy01,"right",Symm)
         call differentiate_(self,Sy00,"left" ,Sy10); call differentiate_(self,Sy10,"left" ,Sy01)
         call differentiate_(self,Sz00,"right",Sz01); call differentiate_(self,Sz01,"right",Szmm)
         call differentiate_(self,Sz00,"left" ,Sz10); call differentiate_(self,Sz10,"left" ,Sz01)
         call differentiate_(self,Fx00,"right",Fx01); call differentiate_(self,Fx01,"right",Fxmm)
         call differentiate_(self,Fx00,"left" ,Fx10); call differentiate_(self,Fx10,"left" ,Fx01)
         call differentiate_(self,Fy00,"right",Fy01); call differentiate_(self,Fy01,"right",Fymm)
         call differentiate_(self,Fy00,"left" ,Fy10); call differentiate_(self,Fy10,"left" ,Fy01)
         call differentiate_(self,Fz00,"right",Fz01); call differentiate_(self,Fz01,"right",Fzmm)
         call differentiate_(self,Fz00,"left" ,Fz10); call differentiate_(self,Fz10,"left" ,Fz01)
         Sxmm = Sxmm - Sx01
         Symm = Symm - Sy01
         Szmm = Szmm - Sz01
         Fxmm = Fxmm - Fx01
         Fymm = Fymm - Fy01
         Fzmm = Fzmm - Fz01
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             Sx00_ab = Sx00(aix,bix)
             Sy00_ab = Sy00(aiy,biy)
             Sz00_ab = Sz00(aiz,biz)
             Fx00_ab = Fx00(aix,bix)
             Fy00_ab = Fy00(aiy,biy)
             Fz00_ab = Fz00(aiz,biz)
             Sxmm_ab = Sxmm(aix,bix)
             Symm_ab = Symm(aiy,biy)
             Szmm_ab = Szmm(aiz,biz)
             Fxmm_ab = Fxmm(aix,bix)
             Fymm_ab = Fymm(aiy,biy)
             Fzmm_ab = Fzmm(aiz,biz)
             Jx(a,b) = Jx(a,b) + Fxmm_ab*Sy00_ab*Sz00_ab &
                               + Fx00_ab*Symm_ab*Sz00_ab &
                               + Fx00_ab*Sy00_ab*Szmm_ab
             Jy(a,b) = Jy(a,b) + Sxmm_ab*Fy00_ab*Sz00_ab &
                               + Sx00_ab*Fymm_ab*Sz00_ab &
                               + Sx00_ab*Fy00_ab*Szmm_ab
             Jz(a,b) = Jz(a,b) + Sxmm_ab*Sy00_ab*Fz00_ab &
                               + Sx00_ab*Symm_ab*Fz00_ab &
                               + Sx00_ab*Sy00_ab*Fzmm_ab
           end do
         end do
!         Jx = Jx + Fxmm(ax,bx)*Sy00(ay,by)*Sz00(az,bz) &
!                 + Fx00(ax,bx)*Symm(ay,by)*Sz00(az,bz) &
!                 + Fx00(ax,bx)*Sy00(ay,by)*Szmm(az,bz)
!         Jy = Jy + Sxmm(ax,bx)*Fy00(ay,by)*Sz00(az,bz) &
!                 + Sx00(ax,bx)*Fymm(ay,by)*Sz00(az,bz) &
!                 + Sx00(ax,bx)*Fy00(ay,by)*Szmm(az,bz)
!         Jz = Jz + Sxmm(ax,bx)*Sy00(ay,by)*Fz00(az,bz) &
!                 + Sx00(ax,bx)*Symm(ay,by)*Fz00(az,bz) &
!                 + Sx00(ax,bx)*Sy00(ay,by)*Fzmm(az,bz)
      end do
      call destroy_(rys)
      call destroy_(Fzmm); call destroy_(Fymm); call destroy_(Fxmm)
      call destroy_(Fz01); call destroy_(Fy01); call destroy_(Fx01)
      call destroy_(Fz10); call destroy_(Fy10); call destroy_(Fx10)
      call destroy_(Fz00); call destroy_(Fy00); call destroy_(Fx00)
      call destroy_(Szmm); call destroy_(Symm); call destroy_(Sxmm)
      call destroy_(Sz01); call destroy_(Sy01); call destroy_(Sx01)
      call destroy_(Sz10); call destroy_(Sy10); call destroy_(Sx10)
      call destroy_(Sz00); call destroy_(Sy00); call destroy_(Sx00)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/(8*3.141592653589793d0*p)
      Jx = prefac*Jx
      Jy = prefac*Jy
      Jz = prefac*Jz

   end subroutine

   subroutine make_irrotational_jd_ints(self,Jx,Jy,Jz,B_field,origin,c)
    type(gaussian2_type) :: self
    ! Make the solenoidal Jd integrals "Ji", with external magnetic field
    ! "B_field", gauge origin at "origin", and evaluated at point "c",
    !    <a|J(c)|b> = (1/8 3.141592653589793d0) \int dr (div J^d_ab(r)) (c - r)/|c - r|3
    !     J^d_ab(r) = B (2 g_a(r)g_b(r) + (r-r_o).grad g_a(r)g_b(r))
    !                 - (r-r_o)(B.grad g_a(r)g_b(r))
    ! Uses a double quadrature based on Rys method and Gauss-Hermite quadrature.
      real(kind=kind(1.0d0)), dimension(:,:) :: Jx,Jy,Jz
      real(kind=kind(1.0d0)), dimension(3) :: B_field,origin,c
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sx00,Sy00,Sz00,Sx10,Sy10,Sz10,Sx01,Sy01,Sz01
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Sxpp,Sypp,Szpp,Dx00,Dy00,Dz00
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Fx00,Fy00,Fz00,Fx10,Fy10,Fz10,Fx01,Fy01,Fz01
      real(kind=kind(1.0d0)), dimension(:,:), pointer :: Fxpp,Fypp,Fzpp,Qx00,Qy00,Qz00
      integer(kind=kind(1)), dimension(:), pointer :: ax,ay,az,bx,by,bz
      real(kind=kind(1.0d0)), dimension(3) :: rpc,rab
      real(kind=kind(1.0d0)) :: p,xx,uu,wt,prefac,B_x,B_y,B_z
      integer(kind=kind(1)) :: n_a,n_b,n_roots,k,a,b,aix,aiy,aiz,bix,biy,biz
      real(kind=kind(1.0d0)) :: Sx00_ab,Sy00_ab,Sz00_ab,Fx00_ab,Fy00_ab,Fz00_ab
      real(kind=kind(1.0d0)) :: Dx00_ab,Dy00_ab,Dz00_ab,Qx00_ab,Qy00_ab,Qz00_ab
      real(kind=kind(1.0d0)) :: Sxpp_ab,Sypp_ab,Szpp_ab,Fxpp_ab,Fypp_ab,Fzpp_ab
      type(rys_type), pointer :: rys

      B_x = B_field(1)
      B_y = B_field(2)
      B_z = B_field(3)
      n_a = (self%a%l+1)*(self%a%l+2)/2
      n_b = (self%b%l+1)*(self%b%l+2)/2
      call create_(ax,n_a); call create_(ay,n_a); call create_(az,n_a); call make_gaussian_xyz_indices_(self%a%l,ax,ay,az)
      call create_(bx,n_b); call create_(by,n_b); call create_(bz,n_b); call make_gaussian_xyz_indices_(self%b%l,bx,by,bz)
      call create_(Sx00,self%a%l+2,self%b%l+2); call create_(Sy00,self%a%l+2,self%b%l+2); call create_(Sz00,self%a%l+2,self%b&
&%l+2)
      call create_(Sx10,self%a%l+1,self%b%l+1); call create_(Sy10,self%a%l+1,self%b%l+1); call create_(Sz10,self%a%l+1,self%b&
&%l+1)
      call create_(Sx01,self%a%l+1,self%b%l+1); call create_(Sy01,self%a%l+1,self%b%l+1); call create_(Sz01,self%a%l+1,self%b&
&%l+1)
      call create_(Sxpp,self%a%l+1,self%b%l+1); call create_(Sypp,self%a%l+1,self%b%l+1); call create_(Szpp,self%a%l+1,self%b&
&%l+1)
      call create_(Dx00,self%a%l+2,self%b%l+2); call create_(Dy00,self%a%l+2,self%b%l+2); call create_(Dz00,self%a%l+2,self%b&
&%l+2)
      call create_(Fx00,self%a%l+2,self%b%l+2); call create_(Fy00,self%a%l+2,self%b%l+2); call create_(Fz00,self%a%l+2,self%b&
&%l+2)
      call create_(Fx10,self%a%l+1,self%b%l+1); call create_(Fy10,self%a%l+1,self%b%l+1); call create_(Fz10,self%a%l+1,self%b&
&%l+1)
      call create_(Fx01,self%a%l+1,self%b%l+1); call create_(Fy01,self%a%l+1,self%b%l+1); call create_(Fz01,self%a%l+1,self%b&
&%l+1)
      call create_(Fxpp,self%a%l+1,self%b%l+1); call create_(Fypp,self%a%l+1,self%b%l+1); call create_(Fzpp,self%a%l+1,self%b&
&%l+1)
      call create_(Qx00,self%a%l+2,self%b%l+2); call create_(Qy00,self%a%l+2,self%b%l+2); call create_(Qz00,self%a%l+2,self%b&
&%l+2)
      p = self%a%ex + self%b%ex
      rpc = (self%a%ex*self%a%pos + self%b%ex*self%b%pos)/p - c
      n_roots = (self%a%l+self%b%l+2)/2 + 1
      call create_(rys,n_roots)
      xx = p*sum(rpc*rpc)
      call get_weights_and_u_roots_(rys,xx)
      Jx = 0.0d0; Jy = 0.0d0; Jz = 0.0d0
      do k = 1,n_roots
         uu = p*root_(rys,k)
         wt =   weight_(rys,k)
         call make_q_field_ints_(self,Sx00,Dx00,Fx00,Qx00,1,uu,c(1),origin(1),self%a%l+1,self%b%l+1)
         call make_q_field_ints_(self,Sy00,Dy00,Fy00,Qy00,2,uu,c(2),origin(2),self%a%l+1,self%b%l+1)
         call make_q_field_ints_(self,Sz00,Dz00,Fz00,Qz00,3,uu,c(3),origin(3),self%a%l+1,self%b%l+1)
         Sz00 =  Sz00*wt
         Dz00 =  Dz00*wt
         Fz00 =  Fz00*wt
         Qz00 =  Qz00*wt
         call differentiate_(self,Sx00,"left",Sx10); call differentiate_(self,Sx00,"right",Sx01)
         call differentiate_(self,Sy00,"left",Sy10); call differentiate_(self,Sy00,"right",Sy01)
         call differentiate_(self,Sz00,"left",Sz10); call differentiate_(self,Sz00,"right",Sz01)
         call differentiate_(self,Fx00,"left",Fx10); call differentiate_(self,Fx00,"right",Fx01)
         call differentiate_(self,Fy00,"left",Fy10); call differentiate_(self,Fy00,"right",Fy01)
         call differentiate_(self,Fz00,"left",Fz10); call differentiate_(self,Fz00,"right",Fz01)
         Sxpp = Sx01 + Sx10
         Sypp = Sy01 + Sy10
         Szpp = Sz01 + Sz10
         Fxpp = Fx01 + Fx10
         Fypp = Fy01 + Fy10
         Fzpp = Fz01 + Fz10
         do b=1,n_b
           bix=bx(b)
           biy=by(b)
           biz=bz(b)
           do a=1,n_a
             aix=ax(a)
             aiy=ay(a)
             aiz=az(a)
             Sx00_ab = Sx00(aix,bix)
             Sy00_ab = Sy00(aiy,biy)
             Sz00_ab = Sz00(aiz,biz)
             Fx00_ab = Fx00(aix,bix)
             Fy00_ab = Fy00(aiy,biy)
             Fz00_ab = Fz00(aiz,biz)
             Dx00_ab = Dx00(aix,bix)
             Dy00_ab = Dy00(aiy,biy)
             Dz00_ab = Dz00(aiz,biz)
             Qx00_ab = Qx00(aix,bix)
             Qy00_ab = Qy00(aiy,biy)
             Qz00_ab = Qz00(aiz,biz)
             Sxpp_ab = Sxpp(aix,bix)
             Sypp_ab = Sypp(aiy,biy)
             Szpp_ab = Szpp(aiz,biz)
             Fxpp_ab = Fxpp(aix,bix)
             Fypp_ab = Fypp(aiy,biy)
             Fzpp_ab = Fzpp(aiz,biz)
             Jx(a,b) = Jx(a,b) &
                 + B_y*Fxpp_ab*Sy00_ab*Dz00_ab - B_z*Fxpp_ab*Dy00_ab*Sz00_ab &
                 + B_z*Qx00_ab*Sypp_ab*Sz00_ab - B_x*Fx00_ab*Sypp_ab*Dz00_ab &
                 + B_x*Fx00_ab*Dy00_ab*Szpp_ab - B_y*Qx00_ab*Sy00_ab*Szpp_ab
             Jy(a,b) = Jy(a,b) &
                 + B_y*Sxpp_ab*Fy00_ab*Dz00_ab - B_z*Sxpp_ab*Qy00_ab*Sz00_ab &
                 + B_z*Dx00_ab*Fypp_ab*Sz00_ab - B_x*Sx00_ab*Fypp_ab*Dz00_ab &
                 + B_x*Sx00_ab*Qy00_ab*Szpp_ab - B_y*Dx00_ab*Fy00_ab*Szpp_ab
             Jz(a,b) = Jz(a,b) &
                 + B_y*Sxpp_ab*Sy00_ab*Qz00_ab - B_z*Sxpp_ab*Dy00_ab*Fz00_ab &
                 + B_z*Dx00_ab*Sypp_ab*Fz00_ab - B_x*Sx00_ab*Sypp_ab*Qz00_ab &
                 + B_x*Sx00_ab*Dy00_ab*Fzpp_ab - B_y*Dx00_ab*Sy00_ab*Fzpp_ab
           end do
         end do
!         Jx = Jx + B_field(2)*Fxpp(ax,bx)*Sy00(ay,by)*Dz00(az,bz) - B_field(3)*Fxpp(ax,bx)*Dy00(ay,by)*Sz00(az,bz) &
!                 + B_field(3)*Qx00(ax,bx)*Sypp(ay,by)*Sz00(az,bz) - B_field(1)*Fx00(ax,bx)*Sypp(ay,by)*Dz00(az,bz) &
!                 + B_field(1)*Fx00(ax,bx)*Dy00(ay,by)*Szpp(az,bz) - B_field(2)*Qx00(ax,bx)*Sy00(ay,by)*Szpp(az,bz)
!         Jy = Jy + B_field(2)*Sxpp(ax,bx)*Fy00(ay,by)*Dz00(az,bz) - B_field(3)*Sxpp(ax,bx)*Qy00(ay,by)*Sz00(az,bz) &
!                 + B_field(3)*Dx00(ax,bx)*Fypp(ay,by)*Sz00(az,bz) - B_field(1)*Sx00(ax,bx)*Fypp(ay,by)*Dz00(az,bz) &
!                 + B_field(1)*Sx00(ax,bx)*Qy00(ay,by)*Szpp(az,bz) - B_field(2)*Dx00(ax,bx)*Fy00(ay,by)*Szpp(az,bz)
!         Jz = Jz + B_field(2)*Sxpp(ax,bx)*Sy00(ay,by)*Qz00(az,bz) - B_field(3)*Sxpp(ax,bx)*Dy00(ay,by)*Fz00(az,bz) &
!                 + B_field(3)*Dx00(ax,bx)*Sypp(ay,by)*Fz00(az,bz) - B_field(1)*Sx00(ax,bx)*Sypp(ay,by)*Qz00(az,bz) &
!                 + B_field(1)*Sx00(ax,bx)*Dy00(ay,by)*Fzpp(az,bz) - B_field(2)*Dx00(ax,bx)*Sy00(ay,by)*Fzpp(az,bz)
      end do
      call destroy_(rys)
      call destroy_(Qz00); call destroy_(Qy00); call destroy_(Qx00)
      call destroy_(Fzpp); call destroy_(Fypp); call destroy_(Fxpp)
      call destroy_(Fz01); call destroy_(Fy01); call destroy_(Fx01)
      call destroy_(Fz10); call destroy_(Fy10); call destroy_(Fx10)
      call destroy_(Fz00); call destroy_(Fy00); call destroy_(Fx00)
      call destroy_(Dz00); call destroy_(Dy00); call destroy_(Dx00)
      call destroy_(Szpp); call destroy_(Sypp); call destroy_(Sxpp)
      call destroy_(Sz01); call destroy_(Sy01); call destroy_(Sx01)
      call destroy_(Sz10); call destroy_(Sy10); call destroy_(Sx10)
      call destroy_(Sz00); call destroy_(Sy00); call destroy_(Sx00)
      call destroy_(bz); call destroy_(by); call destroy_(bx)
      call destroy_(az); call destroy_(ay); call destroy_(ax)
      rab = self%a%pos - self%b%pos
      prefac = exp(-self%a%ex*self%b%ex*sum(rab*rab)/p)*pi212/(8*3.141592653589793d0*p)
      Jx = prefac*Jx
      Jy = prefac*Jy
      Jz = prefac*Jz

   end subroutine

   subroutine normalise(self,I)
    type(gaussian2_type) :: self
    ! Multiply the matrix "I" by the atomic orbital normalisation coefficients
     intent(in) :: self
      real(kind=kind(1.0d0)), dimension(:,:) :: I
     real(kind=kind(1.0d0)), dimension(:), pointer :: anorm,bnorm
     integer(kind=kind(1)) :: na,nb,a,b

     if (self%a%l<2 .and. self%b%l<2) then;   return; end if
     na = n_comp_(self%a)
     nb = n_comp_(self%b)
     call create_(anorm,na); call normalising_factors_(anorm,self%a%l)
     call create_(bnorm,nb); call normalising_factors_(bnorm,self%b%l)
     do b = 1,nb
     do a = 1,na
        I(a,b) = I(a,b)*anorm(a)*bnorm(b)
     end do
     end do
     call destroy_(anorm); call destroy_(bnorm)

   end subroutine

   subroutine put(self)
    type(gaussian2_type) :: self
    ! Put the object to file "stdout"

      call flush_(stdout)
      call text_(stdout,"GAUSSIAN2:")
      call flush_(stdout)
      call show_(stdout,"l_a   =",self%a%l,real_width=.true.)
      call show_(stdout,"l_b   =",self%b%l,real_width=.true.)
      call show_(stdout,"pos_a =",self%a%pos(1),self%a%pos(2),self%a%pos(3))
      call show_(stdout,"pos_b =",self%b%pos(1),self%b%pos(2),self%b%pos(3))
      call show_(stdout,"ex_a  =",self%a%ex)
      call show_(stdout,"ex_b  =",self%b%ex)

   end subroutine

end
