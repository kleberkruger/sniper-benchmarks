#ifdef FCODE
#define DECLARE_PUGHSLAB_PRIVATE_FARGUMENTS \


#define PUGHSLAB_PRIVATE_FARGUMENTS \



#endif /*FCODE*/


#ifdef CCODE
#define DECLARE_PUGHSLAB_PRIVATE_CARGUMENTS \


#define USE_PUGHSLAB_PRIVATE_CARGUMENTS \


#define DECLARE_PUGHSLAB_PRIVATE_C2F \


#define INITIALISE_PUGHSLAB_PRIVATE_C2F \


#define PUGHSLAB_PRIVATE_C2F_PROTO \



#define PASS_PUGHSLAB_PRIVATE_C2F(xGH) \



#endif /*CCODE*/


#ifdef FCODE
#define DECLARE_PUGHSLAB_PROTECTED_FARGUMENTS \


#define PUGHSLAB_PROTECTED_FARGUMENTS \



#endif /*FCODE*/


#ifdef CCODE
#define DECLARE_PUGHSLAB_PROTECTED_CARGUMENTS \


#define USE_PUGHSLAB_PROTECTED_CARGUMENTS \


#define DECLARE_PUGHSLAB_PROTECTED_C2F \


#define INITIALISE_PUGHSLAB_PROTECTED_C2F \


#define PUGHSLAB_PROTECTED_C2F_PROTO \



#define PASS_PUGHSLAB_PROTECTED_C2F(xGH) \



#endif /*CCODE*/


#ifdef FCODE
#define DECLARE_PUGHSLAB_PUBLIC_FARGUMENTS \


#define PUGHSLAB_PUBLIC_FARGUMENTS \



#endif /*FCODE*/


#ifdef CCODE
#define DECLARE_PUGHSLAB_PUBLIC_CARGUMENTS \


#define USE_PUGHSLAB_PUBLIC_CARGUMENTS \


#define DECLARE_PUGHSLAB_PUBLIC_C2F \


#define INITIALISE_PUGHSLAB_PUBLIC_C2F \


#define PUGHSLAB_PUBLIC_C2F_PROTO \



#define PASS_PUGHSLAB_PUBLIC_C2F(xGH) \



#endif /*CCODE*/


#ifdef FCODE
#define PUGHSLAB_FARGUMENTS _CCTK_FARGUMENTS\


#define DECLARE_PUGHSLAB_FARGUMENTS _DECLARE_CCTK_FARGUMENTS \


#endif /*FCODE*/


#ifdef CCODE
#define DECLARE_PUGHSLAB_CARGUMENTS _DECLARE_CCTK_CARGUMENTS \


#define USE_PUGHSLAB_CARGUMENTS _USE_CCTK_CARGUMENTS \


#endif /*CCODE*/


#ifdef CCODE
#define PUGHSLAB_C2F_PROTO _CCTK_C2F_PROTO\


#define PASS_PUGHSLAB_C2F(xGH) _PASS_CCTK_C2F(xGH)\


#define DECLARE_PUGHSLAB_C2F _DECLARE_CCTK_C2F \


#define INITIALISE_PUGHSLAB_C2F _INITIALISE_CCTK_C2F \


#define PUGHSLAB_CARGUMENTS cGH *cctkGH 


#endif /*CCODE*/


