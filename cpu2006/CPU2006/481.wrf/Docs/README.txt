WRF Model Version 2 (May 2004)

------------------------
WRF PUBLIC DOMAIN NOTICE
------------------------

WRF was developed at the National Center for Atmospheric Research
(NCAR) which is operated by the University Corporation for
Atmospheric Research (UCAR). NCAR and UCAR make no proprietary
claims, either statutory or otherwise, to this version and
release of WRF and consider WRF to be in the public domain for
use by any person or entity for any purpose without any fee or
charge. UCAR requests that any WRF user include this notice on
any partial or full copies of WRF. WRF is provided on an "AS
IS" basis and any warranties, either express or implied,
including but not limited to implied warranties of
non-infringement, originality, merchantability and fitness for a
particular purpose, are disclaimed. In no event shall
UCAR be liable for any damages, whatsoever, whether direct,
indirect, consequential or special, that arise out of or in
connection with the access, use or performance of WRF, including
infringement actions.


======================================

V2 Release Notes:
-----------------

This is the main directory for the WRF Version 2 source code release.

- For directions on compiling WRF, see below or Users Web page.
- For more information on WRF V2 release, visit WRF Users home page
  http://www.mmm.ucar.edu/wrf/users/
- If you have used WRF software before, you must rerun SI (set 
  namelist variable OUTPUT_FILE_TYPE = 'WRF') preferrably using
  the new SI V2.0 release (www.wrf-model.org/si).
  wrfbdy_d01/wrfinput_d01 from 1.3 release will not work for V2 WRF model.
- WRF V2's namelist has changed significantly. Read the README.namelist
  file in the run/ directory (or on the Users' page), and make changes 
  carefully.

For questions, send mail to wrfhelp@ucar.edu

======================================

How to compile and run?
-----------------------

- In WRFV2 directory, type 'configure' - this will create a configure.wrf
  file that has appropriate compile options for the supported computers.

  Note: WRF requires netCDF library. If your netCDF library is installed in
        some odd directory, set environment variable NETCDF before you type
        'configure'. For example, 

        setenv NETCDF /usr/local/lib32/r4i4

- Type 'compile case_name' where you can find the case_names by simply typing
  compile. The following are available:

        compile em_b_wave
        compile em_hill2d_x
        compile em_grav2d_x
        compile em_quarter_ss
        compile em_real
        compile em_squall2d_x
        compile em_squall2d_y

- If sucessfully, this will create either real.exe or ideal.exe and wrf.exe
  in directory main/, and the appropriate executables will be linked into
  the test directoires under test/case_name, or run/.

- cd to the appropriate test or run direcotry to run ideal/real/wrf.

- If it is one of the idealized cases (b_wave, hill2d_x, grav2d_x, quarter_ss,
  squall2d_x or squall2d_y), cd the the appropriate directory, type

  ideal.exe 

  to produce wrfinput_d01 file for wrf model. Then type

  wrf.exe 

  to run. 

- If it is real-data case (real), place files from SI (wrf_real_input_em.*)
  in the appropriate directory, type

  real.exe

  to produce wrfbdy_d01 and wrfinput_d01. Then type

  wrf.exe

  to run.

- If you use mpich, type

  mpirun -np number-of-processors wrf.exe

- For information on how to make nested runs, visit
  http://www.mmm.ucar.edu/wrf/users/


======================================

What is in WRF V2?

- Advanced Research WRF (ARW) core: Eulerian mass, hydrostatic and non-hydrostatic
  * Arakawa C-grid staggering
  * Runge-Kutta 2nd and 3rd order timestep options
  * scalar-conserving flux form for prognostic variables
  * 2nd to 6th order advection options (horizontal and vertical)
  * time-split small step for acoustic modes
  * small step horizontally explicit, vertically implicit
  * divergence damping option and vertical time off-centering
  * external-mode filtering option for mass model
  * hydrostatic option via namelist option

- Two-way nesting:
  * multiple domains and multiple nest levels
  * supports integer nest grid ratio
  * if feedback is on, the grid ratio needs to be odd;
    if feedback is off, then the grid ratio can be odd or even.
  * smoothing options

- Physics options:
  * microphysics (Kessler/ WRF Single Moment 3, 5 and 6 class / Lin et al./
    Eta Ferrier)
  * cumulus parameterization (Kain-Fritsch with shallow convection / 
    Betts-Miller-Janjic / Grell-Devenyi ensemble)
  * planetary boundary layer (Yosei University (S. Korea) / Mellor-Yamada-Janjic)
  * surface layer (similarity theory MM5 / Eta)
  * slab soil model (5-layer thermal diffusion / Noah land-surface model (4-level) /
    RUC LSM (6-level) )
  * longwave radiation (RRTM)
  * shortwave radiation (simple MM5 scheme / Goddard)
  * sub-grid turbulence (constant K diffusion/ Smagorinsky/ predicted TKE)
  * land-use categories determine surface properties

- Sofeware

  * Hierarchical software architecture that insulates scientific code
    (Model Layer) from computer architecture (Driver Layer)
  * Multi-level parallelism supporting shared-memory (OpenMP), distributed-memory (MPI), 
    and hybrid share/distributed modes of execution
  * Active data registry: defines and manages model state fields, I/O,
    nesting, configuration, and numerous other aspects of WRF through a single file, 
    called the Registry
  * Two-way nesting:
      Easy to extend: forcing and feedback of new fields specified by
        editing a single table in the Registry
      Efficient: 5-8% overhead on 64 processes of IBM
  * Enhanced I/O options:
      NetCDF and Parallel HDF5 formats
      Five auxiliary history output streams separately controllable through the namelist
      Output file names and time-stamps specifiable through namelist
      Special output stream for 3DVAR
  * Efficient execution on a range of computing platforms:
      IBM SP systems, (e.g. NCAR "bluesky" Power4-based system)
      HP/Compaq Alpha/OSF workstation, SMP, and MPP systems (e.g. Pittsburgh 
         Supercomputing Center TCS)
      SGI Origin and Altix
      Linux/Intel
         IA64 MPP (HP Superdome, SGI Altix, NCSA Teragrid systems)
         IA64 SMP
         Pentium 3/4 SMP and SMP clusters (NOAA/FSL iJet system)
	 PGI and Intel compilers supported
      Alpha Linux (NOAA/FSL Jet system)
      Sun Solaris (single threaded and SMP)
      Other ports under development:
         Cray X1
         NEC SX/6
         Fujitsu VPP 5000
  * RSL_LITE: optional new communication layer, scalable to very
    large domains (limited to single domain in 2.0)
  * ESMF Time Management, including exact arithmetic for fractional
    time steps (no drift); model start, stop, run length and I/O frequencies are
    now specified as times and time intervals in 2.0 (rather than numbers of
    steps, as in 1.3 and earlier)
  * Improved documentation, both on-line (web based browsing tools) and in-line
