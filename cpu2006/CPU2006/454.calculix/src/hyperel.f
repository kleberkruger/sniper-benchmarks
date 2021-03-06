!
!     CalculiX - A 3-dimensional finite element program
!              Copyright (C) 1998 Guido Dhondt
!
!     This program is free software; you can redistribute it and/or
!     modify it under the terms of the GNU General Public License as
!     published by the Free Software Foundation(version 2);
!     
!
!     This program is distributed in the hope that it will be useful,
!     but WITHOUT ANY WARRANTY; without even the implied warranty of 
!     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
!     GNU General Public License for more details.
!
!     You should have received a copy of the GNU General Public License
!     along with this program; if not, write to the Free Software
!     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
!
      subroutine hyperel(elconloc,elas,eloc,kode,eth,ithermal,
     &     icmd,beta,stre,xkl,ckl,vj,xikl,vij,
     &     plconloc,xstate,xstateini,
     &     ielas,amat,t1l,dtime,iel,iint,nstate_,mint_,iorien,
     &     pgauss,orab)
!
!     kode=-1: Arruda-Boyce
!          -2: Mooney-Rivlin
!	   -3: Neo-Hooke
!	   -4: Ogden (N=1)
!	   -5: Ogden (N=2)
!	   -6: Ogden (N=3)
!	   -7: Polynomial (N=1)
!	   -8: Polynomial (N=2)
!	   -9: Polynomial (N=3)
!	   -10: Reduced Polynomial (N=1)
!	   -11: Reduced Polynomial (N=2)
!	   -12: Reduced Polynomial (N=3)
!	   -13: Van der Waals (not implemented yet)
!	   -14: Yeoh
!	   -15: Hyperfoam (N=1)
!	   -16: Hyperfoam (N=2)
!	   -17: Hyperfoam (N=3)
!	   -50: deformation plasticity
!	   -51: incremental plasticity (no viscosity)
!	   -52: viscoplasticity
!       < -100: user material routine with -kode-100 user
!               defined constants with keyword *USER MATERIAL
!
      implicit none
!
      character*20 amat
!
      integer kode,ithermal,icmd,ielas,iel,iint,nstate_,mint_,iorien
!
      real*8 elconloc(*),elas(*),eloc(*),eth(*),beta(*),stre(*),ckl(*),
     &  vj,plconloc(*),t1l,xkl(*),xikl(*),vij,
     &  dtime,didc(27),d2idc2(243),dibdc(27),d2ibdc2(243),
     &  dudc(9),d2udc2(81),dldc(27),d2ldc2(243),dlbdc(27),d2lbdc2(243),
     &  pgauss(3),orab(7,*)
!
      real*8 xstate(nstate_,mint_,*),xstateini(nstate_,mint_,*)
!
      if(kode.gt.-50) then
         call rubber(elconloc,elas,eloc,kode,eth,didc,d2idc2,
     &     dibdc,d2ibdc2,dudc,d2udc2,dldc,d2ldc2,dlbdc,d2lbdc2,
     &     ithermal,icmd,beta,stre)
      elseif(kode.eq.-50) then
         call defplas(elconloc,elas,eloc,eth,ithermal,icmd,beta,stre,
     &     ckl,vj)
      elseif(kode.gt.-100) then
         call incplas(elconloc,plconloc,xstate,xstateini,elas,eloc,
     &     eth,ithermal,icmd,beta,stre,vj,kode,ielas,
     &     amat,t1l,dtime,iel,iint,nstate_,mint_)
      else
         call umat(amat,iel,iint,kode,elconloc,eloc,eth,beta,xikl,
     &        vij,xkl,vj,ithermal,t1l,dtime,icmd,ielas,mint_,
     &        nstate_,xstateini,xstate,stre,elas,iorien,pgauss,
     &        orab)
      endif
!
      return
      end
