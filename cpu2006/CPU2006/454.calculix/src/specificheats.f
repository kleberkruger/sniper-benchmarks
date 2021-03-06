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
      subroutine specificheats(text,textpart,shcon,nshcon,
     &  nmat,ntmat_,istep,istat,in,n)
!
!     reading the input deck: *SPECIFIC HEAT
!
      implicit none
!
      integer nshcon(*),nmat,ntmat,ntmat_,istep,istat,in,n,
     &  key
      real*8 shcon(0:1,ntmat_,*)
!
      character*40 textpart(16)
      character*132 text
!
      ntmat=0
!
      if(istep.gt.0) then
         write(*,*) '*ERROR in specificheats: *SPECIFIC HEAT should be'
         write(*,*) '  placed before all step definitions'
         stop
      endif
!
      if(nmat.eq.0) then
         write(*,*) '*ERROR in specificheats: *SPECIFIC HEAT should be'
         write(*,*) '  preceded by a *MATERIAL card'
         stop
      endif
!
      do
         call getnewline(text,textpart,istat,in,n,key)
         if((istat.lt.0).or.(key.eq.1)) return
         ntmat=ntmat+1
         nshcon(nmat)=ntmat
         if(ntmat.gt.ntmat_) then
            write(*,*) '*ERROR in specificheats: increase ntmat_'
            stop
         endif
            read(textpart(1),'(f40.0)',iostat=istat) shcon(1,ntmat,nmat)
            if(istat.gt.0) call inputerror(text)
         read(textpart(2),'(f40.0)',iostat=istat) shcon(0,ntmat,nmat)
         if(istat.gt.0) call inputerror(text)
      enddo
!
      return
      end

