      subroutine Bench_StaggeredLeapfrog1a_TS( cctk_dim, cctk_gsh, cctk_
     &lsh, cctk_lbnd,                          cctk_ubnd, cctk_lssh, cct
     &k_from, cctk_to, cctk_bbox,                          cctk_delta_ti
     &me, cctk_time, cctk_delta_space,                          cctk_ori
     &gin_space, cctk_levfac, cctk_convlevel,                          c
     &ctk_nghostzones, cctk_iteration, cctkGH,XADM_curv_stag0,XADM_curv_
     &stag1,XADM_curv_stag2,XADM_metric_prev0,XADM_metric_prev1,XADM_met
     &ric_prev2,XADM_sources0,XADM_sources1,XADM_sources2,ADM_gxx,ADM_gx
     &x_p,ADM_gxy,ADM_gxy_p,ADM_gxz,ADM_gxz_p,ADM_gyy,ADM_gyy_p,ADM_gyz,
     &ADM_gyz_p,ADM_gzz,ADM_gzz_p,ADM_kxx_stag,ADM_kxx_stag_p,ADM_kxx_st
     &ag_p_p,ADM_kxy_stag,ADM_kxy_stag_p,ADM_kxy_stag_p_p,ADM_kxz_stag,A
     &DM_kxz_stag_p,ADM_kxz_stag_p_p,ADM_kyy_stag,ADM_kyy_stag_p,ADM_kyy
     &_stag_p_p,ADM_kyz_stag,ADM_kyz_stag_p,ADM_kyz_stag_p_p,ADM_kzz_sta
     &g,ADM_kzz_stag_p,ADM_kzz_stag_p_p,adms_gxx,adms_gxy,adms_gxz,adms_
     &gyy,adms_gyz,adms_gzz,adms_kxx,adms_kxy,adms_kxz,adms_kyy,adms_kyz
     &,adms_kzz,Xconfac0,Xconfac1,Xconfac2,Xconfac_1derivs0,Xconfac_1der
     &ivs1,Xconfac_1derivs2,Xconfac_2derivs0,Xconfac_2derivs1,Xconfac_2d
     &erivs2,Xcoordinates0,Xcoordinates1,Xcoordinates2,Xcurv0,Xcurv1,Xcu
     &rv2,Xlapse0,Xlapse1,Xlapse2,Xmask0,Xmask1,Xmask2,Xmetric0,Xmetric1
     &,Xmetric2,Xshift0,Xshift1,Xshift2,active_slicing_handle,alp,betax,
     &betay,betaz,coarse_dx,coarse_dy,coarse_dz,conformal_state,courant_
     &min_time,courant_wave_speed,emask,gxx,gxy,gxz,gyy,gyz,gzz,kxx,kxy,
     &kxz,kyy,kyz,kzz,psi,psix,psixx,psixy,psixz,psiy,psiyy,psiyz,psiz,p
     &sizz,r,shift_state,x,y,z)
      implicit none
      INTEGER cctk_dim
      INTEGER cctk_gsh(cctk_dim),cctk_lsh(cctk_dim)
      INTEGER cctk_lbnd(cctk_dim),cctk_ubnd(cctk_dim)
      INTEGER cctk_lssh(     3*cctk_dim)
      INTEGER cctk_from(cctk_dim),cctk_to(cctk_dim)
      INTEGER cctk_bbox(2*cctk_dim)
      REAL*8 cctk_delta_time, cctk_time
      REAL*8 cctk_delta_space(cctk_dim)
      REAL*8 cctk_origin_space(cctk_dim)
      INTEGER cctk_levfac(cctk_dim)
      INTEGER cctk_convlevel
      INTEGER cctk_nghostzones(cctk_dim)
      INTEGER cctk_iteration
      integer*8 cctkGH
      INTEGER XADM_curv_stag0
      INTEGER XADM_curv_stag1
      INTEGER XADM_curv_stag2
      INTEGER XADM_metric_prev0
      INTEGER XADM_metric_prev1
      INTEGER XADM_metric_prev2
      INTEGER XADM_sources0
      INTEGER XADM_sources1
      INTEGER XADM_sources2
      REAL*8 ADM_gxx(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_pre
     &v2)
      REAL*8 ADM_gxx_p(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_p
     &rev2)
      REAL*8 ADM_gxy(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_pre
     &v2)
      REAL*8 ADM_gxy_p(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_p
     &rev2)
      REAL*8 ADM_gxz(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_pre
     &v2)
      REAL*8 ADM_gxz_p(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_p
     &rev2)
      REAL*8 ADM_gyy(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_pre
     &v2)
      REAL*8 ADM_gyy_p(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_p
     &rev2)
      REAL*8 ADM_gyz(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_pre
     &v2)
      REAL*8 ADM_gyz_p(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_p
     &rev2)
      REAL*8 ADM_gzz(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_pre
     &v2)
      REAL*8 ADM_gzz_p(XADM_metric_prev0,XADM_metric_prev1,XADM_metric_p
     &rev2)
      REAL*8 ADM_kxx_stag(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_stag
     &2)
      REAL*8 ADM_kxx_stag_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_st
     &ag2)
      REAL*8 ADM_kxx_stag_p_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_
     &stag2)
      REAL*8 ADM_kxy_stag(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_stag
     &2)
      REAL*8 ADM_kxy_stag_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_st
     &ag2)
      REAL*8 ADM_kxy_stag_p_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_
     &stag2)
      REAL*8 ADM_kxz_stag(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_stag
     &2)
      REAL*8 ADM_kxz_stag_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_st
     &ag2)
      REAL*8 ADM_kxz_stag_p_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_
     &stag2)
      REAL*8 ADM_kyy_stag(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_stag
     &2)
      REAL*8 ADM_kyy_stag_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_st
     &ag2)
      REAL*8 ADM_kyy_stag_p_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_
     &stag2)
      REAL*8 ADM_kyz_stag(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_stag
     &2)
      REAL*8 ADM_kyz_stag_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_st
     &ag2)
      REAL*8 ADM_kyz_stag_p_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_
     &stag2)
      REAL*8 ADM_kzz_stag(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_stag
     &2)
      REAL*8 ADM_kzz_stag_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_st
     &ag2)
      REAL*8 ADM_kzz_stag_p_p(XADM_curv_stag0,XADM_curv_stag1,XADM_curv_
     &stag2)
      REAL*8 adms_gxx(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_gxy(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_gxz(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_gyy(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_gyz(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_gzz(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_kxx(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_kxy(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_kxz(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_kyy(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_kyz(XADM_sources0,XADM_sources1,XADM_sources2)
      REAL*8 adms_kzz(XADM_sources0,XADM_sources1,XADM_sources2)
      INTEGER Xconfac0
      INTEGER Xconfac1
      INTEGER Xconfac2
      INTEGER Xconfac_1derivs0
      INTEGER Xconfac_1derivs1
      INTEGER Xconfac_1derivs2
      INTEGER Xconfac_2derivs0
      INTEGER Xconfac_2derivs1
      INTEGER Xconfac_2derivs2
      INTEGER Xcoordinates0
      INTEGER Xcoordinates1
      INTEGER Xcoordinates2
      INTEGER Xcurv0
      INTEGER Xcurv1
      INTEGER Xcurv2
      INTEGER Xlapse0
      INTEGER Xlapse1
      INTEGER Xlapse2
      INTEGER Xmask0
      INTEGER Xmask1
      INTEGER Xmask2
      INTEGER Xmetric0
      INTEGER Xmetric1
      INTEGER Xmetric2
      INTEGER Xshift0
      INTEGER Xshift1
      INTEGER Xshift2
      INTEGER*4 active_slicing_handle
      REAL*8 alp(Xlapse0,Xlapse1,Xlapse2)
      REAL*8 betax(Xshift0,Xshift1,Xshift2)
      REAL*8 betay(Xshift0,Xshift1,Xshift2)
      REAL*8 betaz(Xshift0,Xshift1,Xshift2)
      REAL*8 coarse_dx
      REAL*8 coarse_dy
      REAL*8 coarse_dz
      INTEGER*4 conformal_state
      REAL*8 courant_min_time
      REAL*8 courant_wave_speed
      REAL*8 emask(Xmask0,Xmask1,Xmask2)
      REAL*8 gxx(Xmetric0,Xmetric1,Xmetric2)
      REAL*8 gxy(Xmetric0,Xmetric1,Xmetric2)
      REAL*8 gxz(Xmetric0,Xmetric1,Xmetric2)
      REAL*8 gyy(Xmetric0,Xmetric1,Xmetric2)
      REAL*8 gyz(Xmetric0,Xmetric1,Xmetric2)
      REAL*8 gzz(Xmetric0,Xmetric1,Xmetric2)
      REAL*8 kxx(Xcurv0,Xcurv1,Xcurv2)
      REAL*8 kxy(Xcurv0,Xcurv1,Xcurv2)
      REAL*8 kxz(Xcurv0,Xcurv1,Xcurv2)
      REAL*8 kyy(Xcurv0,Xcurv1,Xcurv2)
      REAL*8 kyz(Xcurv0,Xcurv1,Xcurv2)
      REAL*8 kzz(Xcurv0,Xcurv1,Xcurv2)
      REAL*8 psi(Xconfac0,Xconfac1,Xconfac2)
      REAL*8 psix(Xconfac_1derivs0,Xconfac_1derivs1,Xconfac_1derivs2)
      REAL*8 psixx(Xconfac_2derivs0,Xconfac_2derivs1,Xconfac_2derivs2)
      REAL*8 psixy(Xconfac_2derivs0,Xconfac_2derivs1,Xconfac_2derivs2)
      REAL*8 psixz(Xconfac_2derivs0,Xconfac_2derivs1,Xconfac_2derivs2)
      REAL*8 psiy(Xconfac_1derivs0,Xconfac_1derivs1,Xconfac_1derivs2)
      REAL*8 psiyy(Xconfac_2derivs0,Xconfac_2derivs1,Xconfac_2derivs2)
      REAL*8 psiyz(Xconfac_2derivs0,Xconfac_2derivs1,Xconfac_2derivs2)
      REAL*8 psiz(Xconfac_1derivs0,Xconfac_1derivs1,Xconfac_1derivs2)
      REAL*8 psizz(Xconfac_2derivs0,Xconfac_2derivs1,Xconfac_2derivs2)
      REAL*8 r(Xcoordinates0,Xcoordinates1,Xcoordinates2)
      INTEGER*4 shift_state
      REAL*8 x(Xcoordinates0,Xcoordinates1,Xcoordinates2)
      REAL*8 y(Xcoordinates0,Xcoordinates1,Xcoordinates2)
      REAL*8 z(Xcoordinates0,Xcoordinates1,Xcoordinates2)
      
      integer*8  method
      COMMON /benchadmrest/method
      integer*8  bound
      INTEGER*4 time_symmetric
      COMMON /BenchADMpriv/bound,time_symmetric
      REAL*8  CCTKH2
      REAL*8  CCTKH3
      REAL*8  CCTKH8
      REAL*8  CCTKH11
      REAL*8  CCTKH12
      integer*8  CCTKH0
      integer*8  evolution_system
      integer*8  CCTKH4
      integer*8  CCTKH5
      integer*8  CCTKH6
      integer*8  CCTKH7
      integer*8  CCTKH14
      integer*8  slicing
      integer*8  CCTKH15
      INTEGER*4 CCTKH1
      INTEGER*4 CCTKH9
      INTEGER*4 CCTKH10
      INTEGER*4 CCTKH13
      INTEGER*4 CCTKH16
      INTEGER*4 CCTKH17
      INTEGER*4 CCTKH18
      COMMON /EINSTEINrest/CCTKH2,CCTKH3,CCTKH8,CCTKH11,CCTKH12,CCTKH0,e
     &volution_system,CCTKH4,CCTKH5,CCTKH6,CCTKH7,CCTKH14,slicing,CCTKH1
     &5,CCTKH1,CCTKH9,CCTKH10,CCTKH13,CCTKH16,CCTKH17,CCTKH18
      integer*8  timestep_method
      INTEGER*4 timestep_outonly
      COMMON /TIMErest/timestep_method,timestep_outonly
      
      ADM_gxx = gxx
      ADM_gxy = gxy
      ADM_gxz = gxz
      ADM_gyy = gyy
      ADM_gyz = gyz
      ADM_gzz = gzz
      ADM_kxx_stag_p = kxx
      ADM_kxy_stag_p = kxy
      ADM_kxz_stag_p = kxz
      ADM_kyy_stag_p = kyy
      ADM_kyz_stag_p = kyz
      ADM_kzz_stag_p = kzz
      ADM_kxx_stag = kxx
      ADM_kxy_stag = kxy
      ADM_kxz_stag = kxz
      ADM_kyy_stag = kyy
      ADM_kyz_stag = kyz
      ADM_kzz_stag = kzz
      ADM_kxx_stag_p_p = 0.0d0
      ADM_kxy_stag_p_p = 0.0d0
      ADM_kxz_stag_p_p = 0.0d0
      ADM_kyy_stag_p_p = 0.0d0
      ADM_kyz_stag_p_p = 0.0d0
      ADM_kzz_stag_p_p = 0.0d0
      end subroutine Bench_StaggeredLeapfrog1a_TS
