C  9 DEC 03 - MWS - SYNCH COMMON BLOCK RUNOPT
C 22 MAY 02 - MWS - GGSRTI ADDED TO OBTAIN DDI 2E- INTEGRALS
C 19 SEP 01 - MWS - CONVERT MXAOCI PARAMTER TO MXAO
C  6 SEP 01 - MWS - ADD DUMMY ARGUMENTS TO NAMEIO CALL
C 21 DEC 99 - MWS - MAKE GUGWFN COMMON CONSISTENT
C 12 NOV 98 - GDF - CHANGE BIT PACKING TO ISHIFT
C  6 JAN 98 - MWS - CHANGE CALL TO RACLOS
C 28 SEP 97 - MWS - CONVERT PARALLEL CALLS FROM TCGMSG TO DDI
C  8 JAN 97 - GMC - CORSRT,GGSRTA: CHANGES FOR DROPPING MCSCF CORES
C 26 NOV 96 - VAG - INCREASE CI AO'S TO 768
C 29 SEP 96 - KRG - ADDED SOME ERROR MESSAGES BEFORE ABRT CALLS
C 13 JUN 96 - MWS - CORSRT,GGSRTA: SUBTRACT CORE INDEX ONLY DURING MCSCF
C 18 APR 96 - GMC - CORSRT,GGSRTA: CHANGES FOR FOCAS CORE DENSITY
C 10 NOV 94 - MWS - REMOVE FTNCHEK WARNINGS
C 10 AUG 94 - MWS - INCREASE NUMBER OF DAF RECORDS
C  9 AUG 94 - MWS - CORSRT,GGSRTA: USE DOUBLE LABEL PACKING
C  1 JUL 94 - MWS - GGSRTA: ONLY MASTER HAS 1E- INTEGRALS, REWIND NEEDED
C 13 DEC 93 - TLW - CORSRT: GLOBAL SUM SORTED INTEGRAL LIST
C 30 MAR 93 - MWS - REWORK OUT OF CORE SORT MEMORY ALLOCATIONS,
C                   REMOVING ALL IMPLIED EQUIVALENCES
C 12 MAR 92 - MWS - REDIMENSION TO 500 ATOMS
C 11 JAN 92 - TLW - GUGSRT: MAKE READS PARALLEL
C 10 JAN 92 - TLW - CHANGE REWINDS TO CALL SEQREW
C  6 JAN 92 - TLW - MAKE WRITES PARALLEL;ADD COMMON PAR
C 17 DEC 91 - MWS - COSMETIC CHANGES WHILE DEBUGGING SOMETHING ELSE
C  7 OCT 91 - MWS - CHANGE UNIX BYTE UNPACKING
C 28 MAR 91 - MWS - USE SQWRIT FOR OUTPUT, ELIMINATING ROUTINE SORTWT.
C 24 OCT 90 - TLW - CHANGED FORMAT 9068 IN CORSRT
C  3 JUN 90 - JAM - CHANGE VAX BYTE PACKING TO FULL 8 BITS
C  7 JAN 90 - MWS - SUPPRESS PRINTOUT OF DRT FILES TITLE
C 26 SEP 89 - MWS - ADD NFT13,NFT14 TO /CIFILS/
C  3 APR 89 - STE - STORE CI INTEGRALS ON FILE NFT14 INSTEAD OF NFT12
C 28 MAR 89 - MWS - GUGSRT: EXETYP=CHECK NOW CALLS RAOPEN
C 25 JAN 89 - MWS - INACCURATE INTEGRAL TEST CHANGED, BETTER DIAGNOSTIC
C  7 OCT 88 - MWS - INCREASE AO NUMBER FROM 128 TO 256
C 15 NOV 87 - STE - GUGSRT: NFTO=NFT12 INSTEAD OF NFT11; USE EXETYP
C  6 AUG 87 - MWS - INCLUDE ETA VERSION
C 19 JUL 87 - MWS - RENAME $GUGSRT VARIABLE NOCORE TO NOMEM (STE)
C  3 NOV 86 - STE - INITIALIZE VARIABLES TO HELP FPS COMPILER
C                   REMOVE NAV20 REFERENCES, USE VCLR IN GGSRTB
C  9 JUL 86 - JAB - ADD BIT PACKING/UNPACKING FOR CRAY, CELERITY
C  7 JUL 86 - MWS - SANITIZE FLOATING POINT CONSTANTS
C 14 NOV 85 - STE - CORSRT,GGSRTA: ALLOW INPUT INTEGRALS OUT OF ORDER
C  8 NOV 85 - STE - GUGSRT: FIX GETFM ARGUMENT NEED
C 14 OCT 85 - STE - USE GENERIC ABS,MAX,MIN; GUGSRT: USE /CIFILS/
C 10 JUL 85 - MWS - CHANGE IBM INDEX PACKING
C 30 MAY 85 - MWS - ADD NPRINT TO RAOPEN CALL
C 15 MAR 85 - MWS - CALL RASIZE TO GET LDAR
C  1 DEC 83 - STE - FIX IX INDEXING IN GUGSRT FOR NWDVAR=1
C 18 NOV 83 - STE - FPS UNPACKING IN CORSRT,GGSRTA
C  5 NOV 83 - STE - DELETE CALL DARTRN FROM GUGSRT
C  1 OCT 82 - MWS - CONVERT TO IBM
C
C*MODULE GUGSRT  *DECK GUGSRT
      SUBROUTINE GUGSRT(NPRINT,DDITRF)
C
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
C
      LOGICAL SOME,OUT,GOPARR,DSKWRK,MASWRK,PACK2E,DDITRF
C
      PARAMETER (MXAO=2047)
C
      DIMENSION TITLE(10),ISYM(MXAO),MAP(MXAO)
      DIMENSION IX(1)
C
      COMMON /CIFILS/ NFT11,NFT12,NFT13,NFT14,NFT15,NFT16,IDAF20,NEMEMX
      COMMON /FMCOM / X(1)
      COMMON /INTFIL/ NINTMX,NHEX,NTUPL,PACK2E,INTG76
      COMMON /IOFILE/ IR,IW,IP,IJKO,IJKT,IDAF,NAV,IODA(400)
      COMMON /MACHIN/ NWDVAR,MAXFM,MAXSM,LIMFM,LIMSM
      COMMON /PAR   / ME,MASTER,NPROC,IBTYP,IPTIM,GOPARR,DSKWRK,MASWRK
      COMMON /RUNOPT/ RUNTYP,EXETYP,NEVALS,NGLEVL,NHLEVL
C
      EQUIVALENCE (X(1),IX(1))
C
C     ----- SET UP NAMELIST SIMULATION -----
C
      PARAMETER (NNAM=5)
      DIMENSION QNAM(NNAM),KQNAM(NNAM)
      CHARACTER*8 :: CISORT_STR
      EQUIVALENCE (CISORT, CISORT_STR)
      DATA CISORT_STR/"CISORT  "/
      CHARACTER*8 :: QNAM_STR(NNAM)
      EQUIVALENCE (QNAM, QNAM_STR)
      DATA QNAM_STR/"NDAR    ","LDAR    ","NBOXMX  ","NWORD   ",
     +          "NOMEM   "/
      DATA KQNAM/1,1,1,1,1/
C
      CHARACTER*8 :: CHECK_STR
      EQUIVALENCE (CHECK, CHECK_STR)
      CHARACTER*8 :: DEBUG_STR
      EQUIVALENCE (DEBUG, DEBUG_STR)
      DATA CHECK_STR/"CHECK   "/, DEBUG_STR/"DEBUG   "/
C
      SOME = NPRINT .NE. -5 .AND. MASWRK
      OUT = NPRINT .GT. 0 .AND. MASWRK
      IF(EXETYP.EQ.DEBUG) THEN
         SOME = .TRUE. .AND. MASWRK
         OUT  = .TRUE. .AND. MASWRK
      END IF
      IF(SOME) WRITE(IW,9000)
C
C     ----- READ NAMELIST /CISORT/ -----
C
      LDAR=0
      CALL RASIZE(LDAR)
      NOMEM=0
      NWORD=0
      NBOXMX=200
      NDAR=2000
      JRET=0
      CALL NAMEIO(IR,JRET,CISORT,NNAM,QNAM,KQNAM,
     *            NDAR,LDAR,NBOXMX,NWORD,NOMEM,
     *            0,0,0,0,  0,0,0,0,0,
     *     0,0,0,0,0,  0,0,0,0,0,
     *     0,0,0,0,0,  0,0,0,0,0, 0,0,0,0,0,  0,0,0,0,0,
     *     0,0,0,0,0,  0,0,0,0,0, 0,0,0,0,0,  0,0,0,0,0)
      IF(JRET.GT.1) THEN
         IF (MASWRK) WRITE(IW,9010)
         CALL ABRT
      END IF
C
C     ----- READ IN -DRT- DATA -----
C
      CALL SEQREW(NFT11)
      NORBMX = 0
      NORBS = 0
      NSYM = 0
      NGRPS = 0
      MXNINT = 0
      NINT = 0
      CALL RDDRT(NORBMX,NORBS,NSYM,NROWS,NWKS,LEVFRM,NEMEMX,NREFS,
     *           IEXCT,NFOCI,INTACT,NCORBS)
      READ (NFT11) TITLE
      READ (NFT11) MAP
      READ (NFT11) ISYM
      DO 140 I = 1,11
  140 READ (NFT11)
      M1 = NORBS
      M2 = (M1*(M1+1))/2
      MN = M1*NSYM
      READ (NFT11) NGRPS,NEXT,MXNINT,NINT
      NELEM = NGRPS*MXNINT
C
C          READ DRT INFO INTO MEMORY,
C          W/O FORMALLY ALLOCATING THE MEMORY JUST YET.
C
      CALL VALFM(LOADFM)
      CALL GOTFM(NGOT)
      IF(NWORD.GT.0) NGOT = MIN(NGOT,NWORD)
C
      IJADD = 1 + LOADFM
      IJGRP = IJADD + M2
      KADD  = IJGRP + M2
      LADD  = KADD + MN
      LAST0 = LADD + MN
C
      READ (NFT11) (IX(IJADD*NWDVAR-NWDVAR+I),I = 1,M2)
      READ (NFT11) (IX(IJGRP*NWDVAR-NWDVAR+I),I = 1,M2)
      READ (NFT11) (IX(KADD *NWDVAR-NWDVAR+I),I = 1,MN)
      READ (NFT11) (IX(LADD *NWDVAR-NWDVAR+I),I = 1,MN)
      CALL SEQREW(NFT11)
      IF(OUT) WRITE(IW,9020) TITLE,NEXT
C
      NFTI = IJKT
      NFTO = NFT14
      IF(.NOT.DDITRF) CALL SEQREW(NFTI)
      CALL SEQREW(NFTO)
C
C     ----- SORT THE INTEGRALS IN FAST MEMORY -----
C     BOTH -IA- AND -X1E- ARE AT -LIA-
C     INDEX   ARRAY -IG-   AT X(I10)
C     INDEX   ARRAY -IA-   AT X(I20) (ALSO 1E-INT. AT X(I20))
C     SORTING ARRAY -SX-   AT X(I30)
C
      LIG   = LAST0
      LX1E  = LIG   + NGRPS
      LIA   = LX1E  + M2
      LSX   = LIA   + M2
      LAST  = LSX   + NELEM
      IF(DDITRF) THEN
         NOCC  = NCORBS + NORBS
         LXBUF = LAST
         LAST  = LXBUF + (NOCC*NOCC+NOCC)/2
         LIBUF = LAST
      ELSE
         LXBUF = LAST
         LIBUF = LXBUF + NINTMX
         LAST  = LIBUF + NINTMX
      END IF
      NEED  = LAST - LOADFM - 1
      IF(SOME) WRITE(IW,9030) NEED,NINT,NGOT
C
C            OUT OF CORE CODE NOT ADAPTED TO DDI TRANSFORMATION YET
C
      IF(.NOT.DDITRF  .AND.  NEED.GT.NGOT) GO TO 180
      IF(.NOT.DDITRF  .AND.  NOMEM.EQ.1)   GO TO 180
      CALL GETFM(NEED)
      IF(EXETYP.EQ.CHECK) GO TO 600
C
      IF(SOME) WRITE(IW,9040)
      CALL CORSRT(X(LSX),X(LX1E),X(LIA),X(LIG),M1,M2,NFTI,NFTO,
     *            X(IJADD),X(IJGRP),X(KADD),X(LADD),X(LXBUF),X(LIBUF),
     *            ISYM,MAP,NSYM,NORBMX,NORBS,NGRPS,NINT,
     *            MXNINT,NINTMX,NZ1SRT,NZ2SRT,OUT,DDITRF)
      IF(SOME) WRITE(IW,9050) NZ1SRT,NZ2SRT
      GO TO 600
C
C     ----- 2 STEP SORTING TECHNIQUE -----
C
  180 CONTINUE
      IF(SOME) WRITE(IW,9060)
      IF(NPROC.GT.1) THEN
         IF(MASWRK) THEN
            WRITE(IW,*) '2 PHASE INTEGRAL SORT DOES NOT RUN IN PARALLEL'
            WRITE(IW,*) 'SO SORRY, PLEASE INCREASE MEMORY TO RUN INCORE'
         END IF
         CALL ABRT
      END IF
C
C     NDAR          = # OF -DA- RECORDS
C     LDAR          = # OF INT. / -DA- RECORD
C
C     NBOX          = # OF BOXES IN 1 PASS
C     LBOX          = # OF INT. / BOX
C
C     NBIN          = # OF BINS IN 1 BOX
C     LBIN          = # OF INT. / BIN
C
C     NPASS         = # OF PASSES
C     LPASS         = # OF INT. / PASS
C
C     NBOXMX        = MAXIMUM # OF BOXES
C
C     NINT          = MAXIMUM # OF INTEGRALS
C
C     NOTE THAT THE TOTAL NUMBER OF ELEMENTS TO BE SORTED IS =
C     NGRPS*MXNINT, WHICH IS GREATER OR EQUAL TO -NINT-, THE ACTUAL
C     NUMBER OF NON-ZERO INTEGRALS.  INDEED THE GROUPS ARE NOT ALWAYS
C     FULL.
C
C     +--------------------------------------------------------------+
C                                LEFT
C     +-------+--+--+--+--+--------+-------------+
C      NDARU+1   4*NBOXU      L2      LDARU*NBOXU
C     +-------+--+-----------------------------+
C      NDARU+1 NBOXU            LBOXU
C
C     ----- STEP -A-
C
C     IX(I30)     -DA- FILE INDEX
C     IX(I40)     BIN CHAINING INDEX
C     IX(I50)     BIN FILLING COUNTER
C     IX(I51)     BOX LOCATION BIAS
C     IX(I52)     BOX ADDRESS BIAS
C     IX(I60)     PAIR INDEX ARRAY (ALSO 1E-INT. AT X(I60))
C     IX(I70)     BIN SPACE
C      X(I70)     BIN SPACE
C
C     ----- STEP -B-
C
C     IX(I30)     -DA- FILE INDEX
C     IX(I40)     BIN CHAINING INDEX
C     IX(I50)     BOX SPACE
C      X(I50)     BOX SPACE
C
      LEFT = NGOT-LAST0+1
      LWORDA = LEFT - (NDAR+1) - 4*NBOXMX - 2*M2
      LWORDB = LEFT - (NDAR+1) - NBOXMX
      IF(LWORDA.LT.0) THEN
         MORE = -LWORDA
         IF(MASWRK) WRITE(IW,9062) LEFT,MORE
         CALL ABRT
      END IF
C
      IF(LWORDB.LT.MXNINT) THEN
         IF (MASWRK) WRITE(IW,9064) LWORDB,MXNINT
         CALL ABRT
      END IF
C
      LBOX = LWORDB
      LBIN = LDAR
      NBIN = LBOX/LBIN
      IF (NBIN .GT. NDAR) NBIN = NDAR
      LBOX = LBIN*NBIN
      LGRP = MXNINT
      NGRP = LBOX/LGRP
      IF (NGRP .GT. NGRPS) NGRP = NGRPS
      LBOX = LGRP*NGRP
      NBIN = (LBOX-1)/LBIN+1
C
      N1 = NDAR/NBIN
      N2 = LWORDA/(2*LDAR+2)
      N3 = (NELEM-1)/LBOX+1
      NBOX = MIN(N1,N2,N3,NBOXMX)
C
      IF(NBOX.LE.0) THEN
         IF (MASWRK) WRITE(IW,9066) NDAR,LDAR,NGOT,NBOXMX
         CALL ABRT
      END IF
C
C     PARAMETERS GIVEN -   NINT,     NDAR,   LDAR,   LWORDA
C                USED  -   NINT,NBOX*NBIN,   LDAR,NBOX*LBIN
C
C     # OF PASSES               NPASS
C     # INT./PASS               LPASS=LBOX*NBOX=(LBIN*NBIN)*NBOX
C     # OF BOXES /PASS          NBOX
C     # INT./BOX                LBOX=LBIN*NBIN
C     # OF BINS  /BOX           NBIN
C     # INT./BIN                LBIN=LDAR
C
      NBOXU = NBOX
      NGRPU = NGRP
      LGRPU = LGRP
      NBINU = NBIN
      LBINU = LBIN
      LBOXU = LBOX
      LDARU = LDAR
      LPASSU = LBOXU*NBOXU
      NPASSU = (NELEM-1)/LPASSU+1
      NDARU  = NBINU*NBOXU
      MXBOXU = NBOXU*NPASSU
      NDAR20 = NDARU+1
      LDAR20 = 2*LBINU + 2
      NIJKL  = NBOXU*LDAR20
C
C     ----- GET FAST MEMORY -----
C
      LIODA  = LAST0
      LICHAN = LIODA  + NDAR20
      LAST   = LICHAN + NBOXU
C
      LICOUN = LAST
      LLOCBX = LICOUN + NBOXU
      LIJKLA = LLOCBX + NBOXU
      LIG    = LIJKLA + NBOXU
      LIA    = LIG    + NGRPS
      LX1E   = LIA    + M2
      LXIJKL = LX1E   + M2
      LXXA   = LXIJKL + NIJKL
      LIXA   = LXXA   + NINTMX
      LASTA  = LIXA   + NINTMX
C
      LSX    = LAST
      LXXB   = LSX    + LBOXU
      LASTB  = LXXB   + LDAR20
C
      LAST = MAX(LASTA,LASTB)
      NEED = LAST - LOADFM - 1
      IF(SOME) WRITE(IW,9070) NELEM,NDAR,LDAR,NGOT,NDARU,LDARU,NEED,
     *     NPASSU,LPASSU,NBOXU,NBOXMX,LBOXU,NGRPU,LGRPU,NBINU,LBINU,
     *     MXBOXU
      CALL GETFM(NEED)
C
C     ----- OPEN DIRECT ACCESS FILE -IDAF20- -----
C
      CALL RAOPEN(IDAF20,X(LIODA),0,NDAR20,LDAR20,NPRINT)
      IF(EXETYP.EQ.CHECK) GO TO 600
C
C     ----- LOOP OVER PASSES -----
C
      NSX = 0
      ILOW = 1
      IHIGH = LPASSU
      MBOX = NBOXU
      NZSORT=0
      NZ1IN=0
      NZ2IN=0
      DO 260 IBOX = 1,MXBOXU,NBOXU
      IF (IBOX+NBOXU .GT. MXBOXU) MBOX = MXBOXU-IBOX+1
C
C     ----- STEP -A- -----
C
      CALL GGSRTA(ILOW,IHIGH,NFTI,IDAF20,X(LIODA),NDARU,X(LICHAN),
     *            X(LICOUN),X(LLOCBX),X(LIJKLA),NBOXU,LBOXU,LBINU,
     *            X(LIA),X(LX1E),M1,M2,X(LXIJKL),NIJKL,
     *            X(IJADD),X(IJGRP),X(KADD),X(LADD),MN,X(LIG),NGRPS,
     *            X(LXXA),X(LIXA),NINTMX,ISYM,MAP,NSYM,NORBMX,
     *            NORBS,MXNINT,OUT,NZ1IN,NZ2IN)
C
C     ----- STEP -B- -----
C
      CALL GGSRTB(NFTO,IDAF20,X(LIODA),X(LICHAN),X(LSX),X(LXXB),
     *            MBOX,NDAR20,LBOXU,LBINU,NGRPU,NSX,NINT,MXNINT,NINTMX,
     *            NZSORT,OUT)
C
      ILOW = ILOW+LPASSU
      IHIGH = IHIGH+LPASSU
  260 CONTINUE
      IF(SOME) WRITE(IW,9080) NZ1IN,NZ2IN
C
      IF(NZSORT.NE.(NZ1IN+NZ2IN)) THEN
         IF(SOME) WRITE(IW,9090) NZ1IN,NZ2IN,NZSORT
         CALL ABRT
      END IF
C
C     ----- CLOSE -IDAF20- -----
C
      CALL RACLOS(IDAF20,'DELETE')
C
C     ----- TIDY UP -----
C
  600 CONTINUE
      IF(.NOT.DDITRF) CALL SEQREW(NFTI)
      CALL SEQREW(NFTO)
      CALL RETFM(NEED)
      IF(SOME) WRITE(IW,9100)
      IF(SOME) CALL TIMIT(1)
      RETURN
C
 9000 FORMAT(/10X,24("-")/10X,'GUGA-CI INTEGRAL SORTING'/10X,24("-"))
 9010 FORMAT(1X,'ERROR READING $CISORT, THIS JOB IS ENDING...')
 9020 FORMAT(/," NAME OF THE DISTINCT ROW TABLE - ",10A8/
     *        1X,'NEXT=',I5)
 9030 FORMAT(/I10,' WORDS NEEDED TO SORT',I15,
     *            ' GUGA INTEGRALS IN MEMORY'/
     *        I10,' WORDS ARE AVAILABLE')
 9040 FORMAT(1X,'CHOOSING IN-MEMORY SORTING...')
 9050 FORMAT(1X,'IN CORE ALGORITHM SORTED',I15,
     *          ' NON-ZERO 1E- INTEGRALS'/
     *       1X,'IN CORE ALGORITHM SORTED',I15,
     *          ' NON-ZERO 2E- INTEGRALS')
 9060 FORMAT(1X,'CHOOSING OUT-OF-MEMORY SORTING...')
 9062 FORMAT(' NOT ENOUGH MEMORY AVAILABLE. LEFT = ',I10, " NEED ",I10,
     +     6H MORE.)
 9064 FORMAT(" IN -GUGACI- INTEGRAL SORTING, THERE IS NOT",
     +     ' ENOUGH MEMORY TO ACCOMODATE ONE GROUP OF INTEGRALS.'/
     +     21H LWORDB AND MXNINT = ,2I10)
 9066 FORMAT(" INCOHERENT PARAMETERS IN THE SORTING OF INTEGRALS.", /,
     +     34H GIVEN NDAR, LDAR, NGOT, NBOXMX = ,4I10,
     +     1X,'REEVALUATE THE INPUT PARAMETERS.')
 9070 FORMAT(/" NUMBER OF ELEMENTS SORTED = ",I10/
     +     29H GIVEN NDAR,LDAR,LWORD     = ,3I10/
     +     29H USED  NDAR,LDAR,LWORD     = ,3I10/
     +     29H NUMBER OF PASSES          = ,I10/
     +     29H NUMBER OF ELEMENTS/PASS   = ,I10/
     +     29H NUMBER OF BOXES/PASS      = ,I10,17H MAXIMUM GIVEN = ,
     +     I10,/, 29H NUMBER OF ELEMENTS/BOX    = ,I10/
     +     29H NUMBER OF GROUPS/BOX      = ,I10/
     +     29H NUMBER OF ELEM./GROUP     = ,I10/
     +     29H NUMBER OF BINS/BOX        = ,I10/
     +     29H NUMBER OF ELEMENTS/BIN    = ,I10/
     +     29H TOTAL NUMBER OF BOXES     = ,I10)
 9080 FORMAT(1X,'ON DISK ALGORITHM SORTED',I15,
     *          ' NON-ZERO 1E- INTEGRALS'/
     *       1X,'ON DISK ALGORITHM SORTED',I15,
     *          ' NON-ZERO 2E- INTEGRALS')
 9090 FORMAT(1X,'MISMATCHED INTEGRAL COUNT IN GUGA SORTING'/
     *       1X,'ON DISK METHOD INPUT ',I15,' NON-ZERO 1E- INTEGRALS'/
     *       1X,'ON DISK METHOD INPUT ',I15,' NON-ZERO 2E- INTEGRALS'/
     *       1X,'ON DISK METHOD OUTPUT',I15,' NON-ZERO INTEGRALS')
 9100 FORMAT(" ...... END OF INTEGRAL SORTING ...... ")
      END
C*MODULE GUGSRT  *DECK CORSRT
      SUBROUTINE CORSRT(SX,X1E,IA,IG,L1,L2,NFTI,NFTO,
     *                  IJADD,IJGRP,KADD,LADD,X,IX,
     *                  ISYM,MAP,NSYM,NORBMX,NORBS,NGRPS,
     *                  NINT,MXNINT,NINTMX,NZ1SRT,NZ2SRT,OUT,DDITRF)
C
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
C
      LOGICAL OUT,DDITRF,GOPARR,DSKWRK,MASWRK,FOCAS,SOSCF,DROPC
C
      DIMENSION X(NINTMX),IX(*),
     *          IG(NGRPS),ISYM(*),IJADD(*),IJGRP(*),KADD(*),LADD(*),
     *          SX(*),X1E(L2),IA(L2),MAP(*)
      DIMENSION MULT8(8),LKUPSM(64),KLOFF(8)
C
      COMMON /CASOPT/ CASHFT,CASDII,NRMCAS,FOCAS,SOSCF,DROPC
      COMMON /GUGWFN/ NFZC,NMCC,NDOC,NAOS,NBOS,NALP,NVAL,NEXT,NFZV,
     *                IFORS,IEXCIT,ICICI,NOIRR
      COMMON /IOFILE/ IR,IW,IP,IJKO,IJKT,IDAF,NAV,IODA(400)
      COMMON /OUTPUT/ NPRINT,ITOL,ICUT,NORMF,NORMP,NOPK
      COMMON /PAR   / ME,MASTER,NPROC,IBTYP,IPTIM,GOPARR,DSKWRK,MASWRK
      COMMON /PCKLAB/ LABSIZ
C
C  DDI ARRAY HANDLES
C
      INTEGER         D_OOOO, D_VOOO, D_VVOO, D_VOVO, D_U
      LOGICAL         NDOOOO, NDVOOO, NDVVOO, NDVOVO
      COMMON /MP2DMS/ D_OOOO, D_VOOO, D_VVOO, D_VOVO, D_U,
     *                NDOOOO, NDVOOO, NDVVOO, NDVOVO
C
      PARAMETER (TEN=10.0D+00)
C
      DATA MULT8 /0,8,16,24,32,40,48,56/
      DATA LKUPSM /1,2,3,4,5,6,7,8,
     +             2,1,4,3,6,5,8,7,
     +             3,4,1,2,7,8,5,6,
     +             4,3,2,1,8,7,6,5,
     +             5,6,7,8,1,2,3,4,
     +             6,5,8,7,2,1,4,3,
     +             7,8,5,6,3,4,1,2,
     +             8,7,6,5,4,3,2,1/
C
C     ----- SORT ONE AND TWO-ELECTRON INTEGRALS IN FAST MEMORY -----
C
      NZ1SRT=0
      NZ2SRT=0
      CUTOFF = TEN**(-ICUT)
      THRSH = TEN*CUTOFF
      NCORBS = 0
      DO I = 1,NORBMX
         IF (MAP(I) .LT. 0) NCORBS = NCORBS+1
      ENDDO
      DO I = 1,NGRPS
         IG(I) = (I-1)*MXNINT
      ENDDO
      DO I = 1,NSYM
         KLOFF(I) = (I-1)*NORBS
      ENDDO
      DO I = 1,L2
         IA(I) = (I*I-I)/2
      ENDDO
C
      CALL VCLR(SX,1,NGRPS*MXNINT)
C
C     ----- PROCESS 1E-INTEGRALS FIRST -----
C     ONLY THE MASTER NODE HAS THE 1E- INTEGRALS.
C
      IF (MASWRK) THEN
         IF(DDITRF) CALL SEQREW(NFTI)
         CALL SQREAD(NFTI,X1E,L2)
         IF(DDITRF) CALL SEQREW(NFTI)
         N = 0
         DO 120 K0 = 1,L1
            DO 110 L0 = 1,K0
               N = N+1
               VAL = X1E(N)
               KMAP = MAP(K0+NCORBS)
               LMAP = MAP(L0+NCORBS)
               K = MAX(KMAP,LMAP)
               L = MIN(KMAP,LMAP)
               MB = 3
               IF (K .EQ. L) MB = 2
               KL = (K*(K-1))/2 + K
               KKSYM = ISYM(K)
               IF (KKSYM .NE. ISYM(L)) GO TO 110
               LSMPT = L + KLOFF(KKSYM)
               LAD = IJADD(KL)+KADD(K)+LADD(LSMPT)+MB
               LGRP = IJGRP(KL)
               KL = IG(LGRP)+LAD
               SX(KL) = VAL
               NZ1SRT=NZ1SRT+1
               IF (OUT) WRITE (IW,9028) K0,L0,K,L,LAD,LGRP,KL,VAL
  110       CONTINUE
  120    CONTINUE
      END IF
C
      IF(.NOT.DDITRF) GO TO 500
C
C     ----- PROCESS 2E- INTEGRALS FROM DISTRIBUTED MEMORY -----
C
      CALL DDI_DISTRIB(D_OOOO,ME,ILO,IHI,JLO,JHI)
      NACT = NORBS
      NCORE= NCORBS
      NOCC = NACT + NCORE
      NOTR = (NOCC*NOCC+NOCC)/2
      DO 340 I = 1, NACT
         IN = I + NCORE
         DO 330 J = 1, I
            JN = J + NCORE
            IJ = (I*I-I)/2 + J
            IJN = (IN*IN-IN)/2 + JN
C
C              PROCESS ONLY LOCAL DATA SERVER'S INTEGRALS
C
            IF ((IJN.GE.JLO).AND.(IJN.LE.JHI)) THEN
               CALL DDI_GET(D_OOOO,1,NOTR,IJN,IJN,X)
               DO 320 K = 1, NACT
                  KN = K + NCORE
                  DO 310 L = 1, K
                     LN = L + NCORE
                     KL = (K*K-K)/2 + L
                     IF (IJ.GE.KL) THEN
                        KLN = (KN*KN-KN)/2 + LN
                        VAL = X(KLN)
                        IF(ABS(VAL).LT.CUTOFF) GO TO 310
                        CALL GGSRTI(VAL,I,J,K,L,NCORBS,SX,NZ2SRT,
     *                              THRSH,MAP,IG,ISYM,IJADD,IJGRP,
     *                              KADD,LADD,KLOFF,MULT8,LKUPSM,
     *                              IA,OUT)
                     END IF
  310             CONTINUE
  320          CONTINUE
            END IF
  330    CONTINUE
  340 CONTINUE
      GO TO 600
C
C     ----- PROCESS 2E- INTEGRALS FROM LOCAL DISK FILE -NFTI- -----
C
  500 CONTINUE
      NX=0
  510 CONTINUE
      CALL PREAD(NFTI,X,IX,NX,NINTMX)
      IF (NX .EQ. 0) GO TO 580
      MX = ABS(NX)
      IF (MX .GT. NINTMX)THEN
        IF(MASWRK)WRITE(IW,*)' MX .GT. NINTMX IN CORSRT'
        CALL ABRT
      ENDIF
C
      DO 540 M = 1,MX
         VAL = X(M)
         NPACK = M
         IF (LABSIZ .EQ. 2) THEN
            LABEL = IX( 2*NPACK - 1 )
            IPACK = ISHFT( LABEL, -16 )
            JPACK = IAND(  LABEL, 65535 )
            LABEL = IX( 2*NPACK     )
            KPACK = ISHFT( LABEL, -16 )
            LPACK = IAND(  LABEL, 65535 )
         ELSE IF (LABSIZ .EQ. 1) THEN
            LABEL = IX(NPACK)
            IPACK = ISHFT( LABEL, -24 )
            JPACK = IAND( ISHFT( LABEL, -16 ), 255 )
            KPACK = IAND( ISHFT( LABEL,  -8 ), 255 )
            LPACK = IAND( LABEL, 255 )
         END IF
         I0 = IPACK
         J0 = JPACK
         K0 = KPACK
         L0 = LPACK
C
         IF(ICICI.EQ.0  .AND.  DROPC) THEN
            I0=I0 - NCORBS
            J0=J0 - NCORBS
            K0=K0 - NCORBS
            L0=L0 - NCORBS
         END IF
C
         IF (MAX(I0,J0,K0,L0) .GT. NORBS) GO TO 540
         IF (MIN(I0,J0,K0,L0) .LE.     0) GO TO 540
C
         CALL GGSRTI(VAL,I0,J0,K0,L0,NCORBS,SX,NZ2SRT,THRSH,
     *               MAP,IG,ISYM,IJADD,IJGRP,KADD,LADD,
     *               KLOFF,MULT8,LKUPSM,IA,OUT)
  540 CONTINUE
      IF (NX .GT. 0) GO TO 510
  580 CONTINUE
      CALL SEQREW(NFTI)
C
C     ----- SUM UP SX IF RUNNING IN PARALLEL -----
C     ALL NODES WILL HAVE A COPY OF ALL INTEGRALS OVER THE OCCUPIED MOS
C
  600 CONTINUE
      IF(GOPARR) THEN
         CALL DDI_GSUMF(1800,SX,NGRPS*MXNINT)
         CALL DDI_GSUMI(1801,NZ2SRT,1)
      END IF
C
C        WRITE INTEGRALS ON -NFTO- IN GROUPS OF -MXNINT- INTEGRALS.
C
      IF(OUT) WRITE(IW,9058)
      MININT = 1
      DO 630 IGRP = 1,NGRPS
         IF(MININT+MXNINT-1.GE.NINT) GO TO 650
         CALL SQWRIT(NFTO,SX(MININT),MXNINT)
         IF(OUT) WRITE(IW,9048) (SX(I+MININT-1),I = 1,MXNINT)
         MININT = MININT+MXNINT
  630 CONTINUE
C
  650 CONTINUE
      CALL SQWRIT(NFTO,SX(MININT),MXNINT)
      IF(OUT) THEN
         MAXI = NINT-MININT+1
         WRITE (IW,9048) (SX(I+MININT-1),I = 1,MAXI)
      END IF
      RETURN
C
 9028 FORMAT(4I5,I10,I5,I10,E20.12)
 9048 FORMAT(6E20.12)
 9058 FORMAT(1X,'SORTED MO INTEGRALS ARE')
      END
C*MODULE GUGSRT  *DECK GGSRTI
      SUBROUTINE GGSRTI(VAL,I0,J0,K0,L0,NCORBS,SX,NZ2SRT,THRSH,
     *                  MAP,IG,ISYM,IJADD,IJGRP,KADD,LADD,
     *                  KLOFF,MULT8,LKUPSM,IA,OUT)
C
      IMPLICIT DOUBLE PRECISION(A-H,O-Z)
C
      DIMENSION MAP(*),IG(*),ISYM(*),IJADD(*),IJGRP(*),KADD(*),LADD(*),
     *          KLOFF(8),MULT8(8),LKUPSM(64),IA(*),SX(*)
C
      LOGICAL OUT,GOPARR,DSKWRK,MASWRK
C
      COMMON /IOFILE/ IR,IW,IP,IJKO,IJKT,IDAF,NAV,IODA(400)
      COMMON /PAR   / ME,MASTER,NPROC,IBTYP,IPTIM,GOPARR,DSKWRK,MASWRK
C
      IMAP = MAP(I0+NCORBS)
      JMAP = MAP(J0+NCORBS)
      KMAP = MAP(K0+NCORBS)
      LMAP = MAP(L0+NCORBS)
      I = MAX(IMAP,JMAP)
      J = MIN(IMAP,JMAP)
      K = MAX(KMAP,LMAP)
      L = MIN(KMAP,LMAP)
C
      IF (I-K) 260,280,300
  260 N = K
      K = I
      I = N
      N = L
      L = J
      J = N
      GO TO 300
C
  280 IF (J-L) 260,300,300
  300 CONTINUE
      IF (J-K) 320,340,360
  320 II = I
      JJ = K
      KK = J
      LL = L
      IF (KK .GE. LL) GO TO 400
      KK = L
      LL = J
      IF (JJ .GT. KK) GO TO 380
      MB = 2
      GO TO 420
C
  340 II = I
      JJ = J
      KK = K
      LL = L
      IF (JJ .GT. LL) GO TO 400
      IF (II .EQ. JJ) GO TO 400
      JJ = I
      KK = I
      MB = 2
      GO TO 420
C
  360 II = I
      JJ = J
      KK = K
      LL = L
      MB = 2
      GO TO 420
C
  380 MB = 3
      GO TO 420
C
  400 MB = 1
C
  420 CONTINUE
      IJ = IA(II)+JJ
      IISYM = ISYM(II)
      IJMUL = MULT8(IISYM)+ISYM(JJ)
      IJSYM = LKUPSM(IJMUL)
      IJKMUL = MULT8(IJSYM)+ISYM(KK)
      IJKSYM = LKUPSM(IJKMUL)
      LSYM = ISYM(LL)
C
C     ----- TEST SYMMETRY ASSIGNMENTS ----
C     RATHER SMALL INTEGRALS ARE DISCARDED RATHER THAN BOMBING THE JOB
C
      IF (LSYM .NE. IJKSYM) THEN
         IF(ABS(VAL).LT.THRSH) RETURN
         IBAD = I0+NCORBS
         JBAD = J0+NCORBS
         KBAD = K0+NCORBS
         LBAD = L0+NCORBS
         IF (MASWRK) WRITE(IW,9068) VAL,IBAD,JBAD,KBAD,LBAD
         CALL ABRT
      END IF
      KSMPT = KK+KLOFF(IJSYM)
      LSMPT = LL+KLOFF(IJKSYM)
      LAD  = IJADD(IJ)+KADD(KSMPT)+LADD(LSMPT)+MB
      LGRP = IJGRP(IJ)
      IJKL = IG(LGRP)+LAD
      IF (OUT) WRITE (IW,9008) I0,J0,K0,L0,I,J,K,L,II,JJ,KK,LL,
     *                         LAD,LGRP,IJKL,VAL
      SX(IJKL) = VAL
      NZ2SRT=NZ2SRT+1
      RETURN
C
 9008 FORMAT(12I5,I10,I5,I10,E20.12)
 9068 FORMAT(1X,'INACCURATE INTEGRAL=',1P,E20.12,0P,' FOUND.'/
     *       1X,'THIS INTEGRAL SHOULD BE ZERO BY SYMMETRY.'/
     *       1X,'ORBITAL INDICES OF THE BAD INTEGRAL ARE ',4I5/
     *       1X,'CHECK YOUR INPUT ORBITALS FOR THEIR SYMMETRY QUALITY,'/
     *       1X,'CHECK YOUR GROUP ASSIGNMENT IN YOUR DRT INPUT.')
      END
C*MODULE GUGSRT  *DECK GGSRTA
      SUBROUTINE GGSRTA(ILOW,IHIGH,NFTI,IDAF20,IODA20,NDAR,
     +                  ICHAIN,ICOUNT,LOCBOX,IJKLAD,NBOX,LBOX,LBIN,
     *                  IA,X1E,L1,L2,XIJKL,NIJKL,
     +                  IJADD,IJGRP,KADD,LADD,MN,IG,NGRPS,
     *                  X,IX,NINTBF,ISYM,MAP,NSYM,NORBMX,NORBS,
     +                  MXNINT,OUT,NZ1IN,NZ2IN)
C
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
C
      LOGICAL PACK2E,OUT,GOPARR,DSKWRK,MASWRK,FOCAS,SOSCF,DROPC
C
      PARAMETER (MXAO=2047)
C
      DIMENSION IODA20(NDAR),IA(L2),X1E(L2),XIJKL(NIJKL),
     *          ICOUNT(NBOX),ICHAIN(NBOX),LOCBOX(NBOX),IJKLAD(NBOX),
     *          X(NINTBF),IX(NINTBF),ISYM(MXAO),MAP(MXAO),
     *          IJADD(L2),IJGRP(L2),KADD(MN),LADD(MN),IG(NGRPS)
      DIMENSION MULT8(8),LKUPSM(64),KLOFF(8)
C
      COMMON /GUGWFN/ NFZC,NMCC,NDOC,NAOS,NBOS,NALP,NVAL,NEXT,NFZV,
     *                IFORS,IEXCIT,ICICI,NOIRR
      COMMON /IOFILE/ IR,IW,IP,IJKO,IJKT,IDAF,NAV,IODA(400)
      COMMON /INTFIL/ NINTMX,NHEX,NTUPL,PACK2E,INTG76
      COMMON /OUTPUT/ NPRINT,ITOL,ICUT,NORMF,NORMP,NOPK
      COMMON /PAR   / ME,MASTER,NPROC,IBTYP,IPTIM,GOPARR,DSKWRK,MASWRK
      COMMON /PCKLAB/ LABSIZ
      COMMON /CASOPT/ CASHFT,CASDII,NRMCAS,FOCAS,SOSCF,DROPC
C
      PARAMETER (TEN=10.0D+00)
C
      DATA MULT8 /0,8,16,24,32,40,48,56/
      DATA LKUPSM /1,2,3,4,5,6,7,8,
     +             2,1,4,3,6,5,8,7,
     +             3,4,1,2,7,8,5,6,
     +             4,3,2,1,8,7,6,5,
     +             5,6,7,8,1,2,3,4,
     +             6,5,8,7,2,1,4,3,
     +             7,8,5,6,3,4,1,2,
     +             8,7,6,5,4,3,2,1/
C
      CUTOFF = TEN**(-ICUT)
      THRSH = TEN*CUTOFF
C
      LENGTH = 2*LBIN+2
      NDAF20 = 1
      NCORBS = 0
      DO 100 I = 1,NORBMX
         IF (MAP(I) .LT. 0) NCORBS = NCORBS+1
  100 CONTINUE
      DO 120 IBOX = 1,NBOX
         LOCBOX(IBOX) = (IBOX-1)*LENGTH
         IJKLAD(IBOX) = (IBOX-1)*LBOX +ILOW-1
         ICOUNT(IBOX) = 1
         ICHAIN(IBOX) = 0
  120 CONTINUE
      DO 140 IGRP = 1,NGRPS
  140 IG(IGRP) = (IGRP-1)*MXNINT
      DO 160 I = 1,NSYM
  160 KLOFF(I) = (I-1)*NORBS
C
C           READ TRANSFORMED INTEGRAL FILE
C
      CALL SEQREW(NFTI)
C
C     ----- PROCESS 1E-INTEGRALS FIRST -----
C
      CALL SQREAD(NFTI,X1E,L2)
      N = 0
      DO 220 K0 = 1,L1
      DO 200 L0 = 1,K0
      N = N+1
      VAL = X1E(N)
      KMAP = MAP(K0+NCORBS)
      LMAP = MAP(L0+NCORBS)
      K = MAX(KMAP,LMAP)
      L = MIN(KMAP,LMAP)
      MB = 3
      IF (K .EQ. L) MB = 2
      KL = (K*(K-1))/2 + K
      KKSYM = ISYM(K)
      IF (KKSYM .NE. ISYM(L)) GO TO 200
      LSMPT = L + KLOFF(KKSYM)
      LAD = IJADD(KL)+KADD(K)+LADD(LSMPT)+MB
      LGRP = IJGRP(KL)
      KL = IG(LGRP)+LAD
      IF (KL .LT. ILOW .OR. KL .GT. IHIGH) GO TO 200
      IBOX = (KL-ILOW)/LBOX+1
      LCOUNT = ICOUNT(IBOX)
      LOCB = LOCBOX(IBOX)
      LOC = LOCB+LCOUNT
C
      IF (OUT) WRITE (IW,9028) K0,L0,K,L,LAD,LGRP,KL,VAL
      NZ1IN=NZ1IN+1
      XIJKL(LOC ) = VAL
      XIJKL(LOC+LBIN) = KL-IJKLAD(IBOX)
C
      LCOUNT = LCOUNT+1
      IF(LCOUNT.GT.LBIN) THEN
         LOC = LOCB+LBIN+LBIN
         XIJKL(LOC+1) = LCOUNT-1
         XIJKL(LOC+2) = ICHAIN(IBOX)
         CALL RAWRIT(IDAF20,IODA20,XIJKL(LOCB+1),LENGTH,NDAF20,0)
         ICHAIN(IBOX) = NDAF20
         NDAF20 = NDAF20+1
         LCOUNT = 1
      END IF
      ICOUNT(IBOX) = LCOUNT
  200 CONTINUE
  220 CONTINUE
C
      DO 240 I = 1,L2
  240 IA(I) = (I*I-I)/2
C
C     ----- PROCESS 2E-INTEGRALS -----
C
  260 CONTINUE
      NX=0
      CALL PREAD(NFTI,X,IX,NX,NINTMX)
      IF (NX .EQ. 0) GO TO 500
      MX = ABS(NX)
      IF (MX .GT. NINTMX)THEN
         IF(MASWRK)WRITE(IW,*) 'CONFUSION: MX.GT.NINTMX IN GGSRTA'
         CALL ABRT
      ENDIF
      DO 480 M = 1,MX
         VAL = X(M)
C
                       NPACK = M
                       IF (LABSIZ .EQ. 2) THEN
                         LABEL = IX( 2*NPACK - 1 )
                         IPACK = ISHFT( LABEL, -16 )
                         JPACK = IAND(  LABEL, 65535 )
                         LABEL = IX( 2*NPACK     )
                         KPACK = ISHFT( LABEL, -16 )
                         LPACK = IAND(  LABEL, 65535 )
                       ELSE IF (LABSIZ .EQ. 1) THEN
                         LABEL = IX(NPACK)
                         IPACK = ISHFT( LABEL, -24 )
                         JPACK = IAND( ISHFT( LABEL, -16 ), 255 )
                         KPACK = IAND( ISHFT( LABEL,  -8 ), 255 )
                         LPACK = IAND( LABEL, 255 )
                       END IF
                       I0 = IPACK
                       J0 = JPACK
                       K0 = KPACK
                       L0 = LPACK
C
       IF(ICICI.EQ.0  .AND.  DROPC) THEN
         I0=I0 - NCORBS
         J0=J0 - NCORBS
         K0=K0 - NCORBS
         L0=L0 - NCORBS
       END IF
C
      IF (MAX(I0,J0,K0,L0) .GT. NORBS) GO TO 480
      IF (I0.LE.0 .OR. J0.LE.0 .OR. K0.LE.0 .OR. L0.LE.0)
     *     GO TO 480
C
      IMAP = MAP(I0+NCORBS)
      JMAP = MAP(J0+NCORBS)
      KMAP = MAP(K0+NCORBS)
      LMAP = MAP(L0+NCORBS)
      I = MAX(IMAP,JMAP)
      J = MIN(IMAP,JMAP)
      K = MAX(KMAP,LMAP)
      L = MIN(KMAP,LMAP)
      IF (I-K) 280,300,320
  280 N = K
      K = I
      I = N
      N = L
      L = J
      J = N
      GO TO 320
  300 IF (J-L) 280,320,320
  320 CONTINUE
C
      IF (J-K) 340,360,380
  340 II = I
      JJ = K
      KK = J
      LL = L
      IF (KK .GE. LL) GO TO 420
      KK = L
      LL = J
      IF (JJ .GT. KK) GO TO 400
      MB = 2
      GO TO 440
  360 II = I
      JJ = J
      KK = K
      LL = L
      IF (JJ .GT. LL) GO TO 420
      IF (II .EQ. JJ) GO TO 420
      JJ = I
      KK = I
      MB = 2
      GO TO 440
  380 II = I
      JJ = J
      KK = K
      LL = L
      MB = 2
      GO TO 440
  400 MB = 3
      GO TO 440
  420 MB = 1
  440 CONTINUE
      IJ = IA(II)+JJ
      IISYM = ISYM(II)
      IJMUL = MULT8(IISYM)+ISYM(JJ)
      IJSYM = LKUPSM(IJMUL)
      IJKMUL = MULT8(IJSYM)+ISYM(KK)
      IJKSYM = LKUPSM(IJKMUL)
      LSYM = ISYM(LL)
C
C     ----- TEST SYMMETRY ASSIGNMENTS ----
C     RATHER SMALL INTEGRALS ARE DISCARDED RATHER THAN BOMBING THE JOB
C
      IF (LSYM .NE. IJKSYM) THEN
         IF(ABS(VAL).LT.THRSH) GO TO 480
         IBAD = I0+NCORBS
         JBAD = J0+NCORBS
         KBAD = K0+NCORBS
         LBAD = L0+NCORBS
         IF (MASWRK) WRITE(IW,9068) VAL,IBAD,JBAD,KBAD,LBAD
         CALL ABRT
      END IF
      KSMPT = KK+KLOFF(IJSYM)
      LSMPT = LL+KLOFF(IJKSYM)
      LAD = IJADD(IJ)+KADD(KSMPT)+LADD(LSMPT)+MB
      LGRP = IJGRP(IJ)
      IJKL = IG(LGRP)+LAD
C
      IF (IJKL .LT. ILOW .OR. IJKL .GT. IHIGH) GO TO 480
      IBOX = (IJKL-ILOW)/LBOX+1
      LCOUNT = ICOUNT(IBOX)
      LOCB = LOCBOX(IBOX)
      LOC = LOCB+LCOUNT
C
      IF (OUT) WRITE (IW,9008) I0,J0,K0,L0,I,J,K,L,II,JJ,KK,LL,LAD,LGRP,
     +     IJKL,VAL
      NZ2IN=NZ2IN+1
      XIJKL(LOC ) = VAL
      XIJKL(LOC+LBIN) = IJKL-IJKLAD(IBOX)
C
      LCOUNT = LCOUNT+1
      IF(LCOUNT.GT.LBIN) THEN
         LOC = LOCB+LBIN+LBIN
         XIJKL(LOC+1) = LCOUNT-1
         XIJKL(LOC+2) = ICHAIN(IBOX)
         CALL RAWRIT(IDAF20,IODA20,XIJKL(LOCB+1),LENGTH,NDAF20,0)
         ICHAIN(IBOX) = NDAF20
         NDAF20 = NDAF20+1
         LCOUNT = 1
      END IF
      ICOUNT(IBOX) = LCOUNT
  480 CONTINUE
      IF (NX .GT. 0) GO TO 260
C
C     ----- DRAIN ALL THE BOXES -----
C
  500 CONTINUE
      DO 520 IBOX = 1,NBOX
         LOCB = LOCBOX(IBOX)
         LOC = LOCB+LBIN+LBIN
         LCOUNT = ICOUNT(IBOX)
         XIJKL(LOC+1) = LCOUNT-1
         XIJKL(LOC+2) = ICHAIN(IBOX)
         CALL RAWRIT(IDAF20,IODA20,XIJKL(LOCB+1),LENGTH,NDAF20,0)
         ICHAIN(IBOX) = NDAF20
         NDAF20 = NDAF20+1
  520 CONTINUE
      RETURN
C
 9008 FORMAT(12I5,I10,I5,I10,E20.12)
 9028 FORMAT(4I5,I10,I5,I10,E20.12)
 9068 FORMAT(1X,'INACCURATE INTEGRAL',E20.12,' FOUND, SHOULD BE ZERO.'/
     *       1X,'CHECK YOUR ORBITAL SYMMETRY ASSIGNMENTS IN $DRTINP.'/
     *       1X,'ESPECIALLY FOR ORBITALS',4I5)
      END
C*MODULE GUGSRT  *DECK GGSRTB
      SUBROUTINE GGSRTB(NFTO,IDAF20,IODA20,ICHAIN,SX,XX,NBOX,NDAR20,
     *                  LBOX,LBIN,NGRP,NSX,NINT,MXNINT,NINTBF,NZSORT,
     *                  OUT)
C
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
C
      LOGICAL OUT
C
      DIMENSION IODA20(NDAR20),ICHAIN(NBOX),SX(LBOX),XX(NINTBF)
C
      COMMON /IOFILE/ IR,IW,IP,IJKO,IJKT,IDAF,NAV,IODA(400)
C
      LENGTH = 2*LBIN+2
C
      IBOX = 0
  100 IBOX = IBOX+1
      IF (IBOX .GT. NBOX) GO TO 220
      CALL VCLR(SX,1,LBOX)
C
C     ----- READ IN BINS FROM -DAF20- -----
C
      NDAF20 = ICHAIN(IBOX)
  140 CONTINUE
      CALL RAREAD(IDAF20,IODA20,XX,LENGTH,NDAF20,0)
      LCOUNT = INT(XX(LENGTH-1))
      ICHANE = INT(XX(LENGTH  ))
      DO 160 INTS = 1,LCOUNT
         IVAL     = INT(XX(INTS+LBIN))
         SX(IVAL) = XX(INTS)
         NZSORT=NZSORT+1
  160 CONTINUE
      NDAF20 = ICHANE
      IF (NDAF20 .GT. 0) GO TO 140
C
C     ----- WRITE INTEGRALS ON -NFTO- IN GROUPS OF -MXNINT- INTEGRALS
C
      MIN = 1
      DO 180 IGRP = 1,NGRP
      IF (NSX+MXNINT .GE. NINT) GO TO 200
      NSX = NSX+MXNINT
      CALL SQWRIT(NFTO,SX(MIN),MXNINT)
      IF (OUT) WRITE (IW,9008) (SX(I-MIN+1),I = 1,MXNINT)
      MIN = MIN+MXNINT
  180 CONTINUE
      GO TO 100
C
  200 CONTINUE
      NSX = NSX+MXNINT
      CALL SQWRIT(NFTO,SX(MIN),MXNINT)
      IF (OUT) WRITE (IW,9008) (SX(I-MIN+1),I = 1,MXNINT)
  220 CONTINUE
      RETURN
C
 9008 FORMAT(6E20.12)
      END
