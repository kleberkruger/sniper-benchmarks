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
      subroutine usermaterials(text,textpart,elcon,nelcon,
     &  nmat,ntmat_,ncmat_,iperturb,iumat,istep,istat,in,n)
!
!     reading the input deck: *ELASTIC
!
      implicit none
!
      integer nelcon(2,*),nmat,ntmat,ntmat_,istep,istat,in,
     &  n,key,i,ncmat_,nconstants,imax,isum,j,iperturb,iumat
!
      real*8 elcon(0:ncmat_,ntmat_,*)
!
      character*40 textpart(16)
      character*132 text
!
      iperturb=3
      ntmat=0
      iumat=1
!
      if(istep.gt.0) then
         write(*,*)'*ERROR in usermaterials: *USER MATERIAL should be'
         write(*,*) '  placed before all step definitions'
         stop
      endif
!
      if(nmat.eq.0) then
         write(*,*) '*ERROR in usermaterials: *USER MATERIAL should be'
         write(*,*) '  preceded by a *MATERIAL card'
         stop
      endif
!
      do i=2,n
         if(textpart(i)(1:10).eq.'CONSTANTS=') then
            read(textpart(i)(11:40),'(i30)',iostat=istat) nconstants
            if(nconstants.gt.21) then
               write(*,*) '*ERROR in usermaterials: number of'
               write(*,*) '       constants cannot exceed 21'
               write(*,*) '       change the source code or'
               write(*,*) '       contact the author'
               stop
            endif
            if(istat.gt.0) call inputerror(text)
            nelcon(1,nmat)=-100-nconstants
            exit
         endif
      enddo
!
      do
         isum=0
         do j=1,(nconstants)/8+1
            if(j.eq.1) then
               call getnewline(text,textpart,istat,in,n,key)
               if((istat.lt.0).or.(key.eq.1)) return
               ntmat=ntmat+1
               nelcon(2,nmat)=ntmat
               if(ntmat.gt.ntmat_) then
                  write(*,*) '*ERROR in usermaterials: increase ntmat_'
                  stop
               endif
            else
               call getnewline(text,textpart,istat,in,n,key)
               if((istat.lt.0).or.(key.eq.1)) then
                  write(*,*) 
     &              '*ERROR in usermaterials: anisotropic definition'
                  write(*,*) '  is not complete. Card image:'
                  write(*,'(a132)') text
                  stop
               endif
            endif
            imax=8
            if(8*j.gt.nconstants+1) then
               imax=nconstants-8*j+9
            endif
            do i=1,imax
               if(isum+i.le.nconstants) then
                  read(textpart(i),'(f40.0)',iostat=istat) 
     &             elcon(isum+i,ntmat,nmat)
               else
                  read(textpart(i),'(f40.0)',iostat=istat) 
     &              elcon(0,ntmat,nmat)
               endif
               if(istat.gt.0) call inputerror(text)
            enddo
            isum=isum+imax
!
         enddo
      enddo
!
      return
      end

