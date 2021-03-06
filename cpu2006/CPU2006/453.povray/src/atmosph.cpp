/****************************************************************************
 *                  atmosph.cpp
 *
 * This module contains all functions for atmospheric effects.
 *
 * from Persistence of Vision(tm) Ray Tracer version 3.6.
 * Copyright 1991-2003 Persistence of Vision Team
 * Copyright 2003-2004 Persistence of Vision Raytracer Pty. Ltd.
 *---------------------------------------------------------------------------
 * NOTICE: This source code file is provided so that users may experiment
 * with enhancements to POV-Ray and to port the software to platforms other
 * than those supported by the POV-Ray developers. There are strict rules
 * regarding how you are permitted to use this file. These rules are contained
 * in the distribution and derivative versions licenses which should have been
 * provided with this file.
 *
 * These licences may be found online, linked from the end-user license
 * agreement that is located at http://www.povray.org/povlegal.html
 *---------------------------------------------------------------------------
 * This program is based on the popular DKB raytracer version 2.12.
 * DKBTrace was originally written by David K. Buck.
 * DKBTrace Ver 2.0-2.12 were written by David K. Buck & Aaron A. Collins.
 *---------------------------------------------------------------------------
 * $File: //depot/povray/3.5/source/atmosph.cpp $
 * $Revision: #20 $
 * $Change: 3010 $
 * $DateTime: 2004/07/27 14:06:43 $
 * $Author: thorsten $
 * $Log$
 *****************************************************************************/

#include "frame.h"
#include "vector.h"
#include "atmosph.h"
#include "chi2.h"
#include "colour.h"
#include "povray.h"
#include "texture.h"
#include "pigment.h"
#include "objects.h"
#include "lighting.h"
#include "matrices.h"
#include "media.h"
#include "texture.h"
#include "ray.h"
#include "render.h" /* for In_Reflection_Ray */
#include "octree.h"  /* for radiosit.h */
#include "radiosit.h"  /* for Radiosity_Trace_Level */

#include <algorithm>

BEGIN_POV_NAMESPACE

/*****************************************************************************
* Local preprocessor defines
******************************************************************************/

/*****************************************************************************
* Local typedefs
******************************************************************************/

/*****************************************************************************
* Local variables
******************************************************************************/

/*****************************************************************************
* Static functions
******************************************************************************/

static DBL constant_fog (RAY *Ray, DBL Depth, DBL Width, FOG *Fog, COLOUR Colour);
static DBL ground_fog (RAY *Ray, DBL Depth, DBL Width, FOG *Fog, COLOUR Colour);

static void do_fog (RAY *Ray, INTERSECTION *Intersection, COLOUR Colour, int Light_Ray_Flag);
static void do_rainbow (RAY *Ray, INTERSECTION *Intersection, COLOUR Colour);
static void do_skysphere (RAY *Ray, COLOUR Colour);



/*****************************************************************************
*
* FUNCTION
*
*   Initialize_Atmosphere_Code
*
* INPUT
*
* OUTPUT
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Initialize atmosphere specific variables.
*
* CHANGES
*
*   Aug 1995 : Creation.
*
******************************************************************************/

void Initialize_Atmosphere_Code()
{
}



/*****************************************************************************
*
* FUNCTION
*
*   Deinitialize_Atmosphere_Code
*
* INPUT
*
* OUTPUT
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Deinitialize atmosphere specific variables.
*
* CHANGES
*
*   Aug 1995 : Creation.
*
******************************************************************************/

void Deinitialize_Atmosphere_Code()
{
}



/*****************************************************************************
*
* FUNCTION
*
*   Do_Infinite_Atmosphere
*
* INPUT
*
*   Ray    - Current ray
*
* OUTPUT
*
*   Colour - Color of the current ray
*
* RETURNS
*   
* AUTHOR
*
*   Dieter Bayer
*   
* DESCRIPTION
*
*   Apply atmospheric effects to an infinite ray.
*
* CHANGES
*
*   Feb 1995 : Creation.
*
*   Jun 1995 : Added code for alpha channel support. [DB]
*
*   Feb 2001 : Fixed alpha channel code. [NK]
*
******************************************************************************/

void Do_Infinite_Atmosphere(RAY *Ray, COLOUR Colour)
{
  if (opts.Options & OUTPUT_ALPHA &&
      !(In_Reflection_Ray || (Radiosity_Trace_Level>1)))
  {
    /*
    If we are using the alpha channel, then the background
    must be black - this is necessary for proper antialiasing
    of the alpha channel, and assures overall correctness and
    consistency.

    However, we do want to use the background and sky sphere for radiosity
    and for reflections.
    */
    Colour[pRED] = Colour[pGREEN] = Colour[pBLUE] = Colour[pFILTER] = 0.0;
    Colour[pTRANSM] = 1.0;
  }
  else
  {
    /* Set background color. */
    Assign_Colour(Colour, Frame.Background_Colour);
  
    Colour[pFILTER] = 0.0;
    Colour[pTRANSM] = 1.0;

    /* Determine atmospheric effects for infinite ray. */
    do_skysphere(Ray, Colour);
  }
}



/*****************************************************************************
*
* FUNCTION
*
*   Do_Finite_Atmosphere
*
* INPUT
*
*   Ray            - Current ray
*   Intersection   - Current intersection
*   Light_Ray_Flag - true if ray is a light source ray
*
* OUTPUT
*
*   Colour         - Color of the current ray
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Apply atmospheric effects to a finite ray.
*
* CHANGES
*
*   Feb 1995 : Creation.
*
******************************************************************************/

void Do_Finite_Atmosphere(RAY *Ray, INTERSECTION *Intersection, COLOUR Colour, int Light_Ray_Flag)
{
  IMEDIA *Media_List[2];

  if (!Light_Ray_Flag)
  {
    do_rainbow(Ray, Intersection, Colour);
  }

  Media_List[0] = Frame.Atmosphere;
  Media_List[1] = NULL;

  Simulate_Media(Media_List, Ray, Intersection, Colour, Light_Ray_Flag);

  do_fog(Ray, Intersection, Colour, Light_Ray_Flag);
}



/*****************************************************************************
*
* FUNCTION
*
*   do_fog
*
* INPUT
*
*   Ray            - current ray
*   Intersection   - current intersection
*   Light_Ray_Flag - true if ray is a light source ray
*
* OUTPUT
*
*   Colour         - color of current ray
*
* RETURNS
*
* AUTHOR
*
*   POV-Ray Team
*
* DESCRIPTION
*
*   Evaluate all fogs for the current ray and intersection.
*
* CHANGES
*
*   Dec 1994 : Rewritten to allow multiple fogs. [DB]
*
*   Apr 1995 : Added transmittance threshold and filtering. [DB]
*
*   Jun 1995 : Added code for alpha channel support. [DB]
*
******************************************************************************/

static void do_fog(RAY *Ray, INTERSECTION *Intersection, COLOUR Colour, int Light_Ray_Flag)
{
  DBL att, att_inv, width;
  COLOUR Col_Fog;
  COLOUR sum_att;  /* total attenuation. */
  COLOUR sum_col;  /* total color.       */
  FOG *Fog;

  /* Why are we here. */

  if (Frame.Fog == NULL)
  {
    return;
  }

  /* Init total attenuation and total color. */

  Make_ColourA(sum_att, 1.0, 1.0, 1.0, 1.0, 1.0);
  Make_ColourA(sum_col, 0.0, 0.0, 0.0, 0.0, 0.0);

  /* Loop over all fogs. */

  for (Fog = Frame.Fog; Fog != NULL; Fog = Fog->Next)
  {
    /* Don't care about fogs with zero distance. */

    if (fabs(Fog->Distance) > EPSILON)
    {
      width = Intersection->Depth;

      switch (Fog->Type)
      {
        case GROUND_MIST:

          att = ground_fog(Ray, 0.0, width, Fog, Col_Fog);

          break;

        default:

          att = constant_fog(Ray, 0.0, width, Fog, Col_Fog);

          break;
      }

      /* Check for minimum transmittance. */

      if (att < Col_Fog[pTRANSM])
      {
        att = Col_Fog[pTRANSM];
      }

      /* Get attenuation sum due to filtered/unfiltered translucency. */

      sum_att[pRED]    *= att * ((1.0 - Col_Fog[pFILTER]) + Col_Fog[pFILTER] * Col_Fog[pRED]);
      sum_att[pGREEN]  *= att * ((1.0 - Col_Fog[pFILTER]) + Col_Fog[pFILTER] * Col_Fog[pGREEN]);
      sum_att[pBLUE]   *= att * ((1.0 - Col_Fog[pFILTER]) + Col_Fog[pFILTER] * Col_Fog[pBLUE]);
      sum_att[pFILTER] *= att * Col_Fog[pFILTER];
      sum_att[pTRANSM] *= att * Col_Fog[pTRANSM];

      if (!Light_Ray_Flag)
      {
        att_inv = 1.0 - att;

        CRGBAddScaledEq(sum_col, att_inv, Col_Fog);
      }
    }
  }

  /* Add light coming from background. */

  Colour[pRED]    = sum_col[pRED]    + sum_att[pRED]    * Colour[pRED];
  Colour[pGREEN]  = sum_col[pGREEN]  + sum_att[pGREEN]  * Colour[pGREEN];
  Colour[pBLUE]   = sum_col[pBLUE]   + sum_att[pBLUE]   * Colour[pBLUE];
  Colour[pTRANSM] *= GREY_SCALE(sum_att);
}



/*****************************************************************************
*
* FUNCTION
*
*   do_rainbow
*
* INPUT
*
*   Ray          - Current ray
*   Intersection - Cuurent intersection
*
* OUTPUT
*
*   Colour       - Current colour
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Create a rainbow using an impressionistic model.
*
*   The model was taken from:
*
*     Musgrave, F. Kenton, "Prisms and Rainbows: a Dispersion Model
*     for Computer Graphics", Proceedings of Graphics Interface '89 -
*     Vision Interface '89, p. 227-234.
*
* CHANGES
*
*   Jul 1994 : Creation.
*
*   Dec 1994 : Modified to allow multiple rainbows. [DB]
*
*   Apr 1995 : Added rainbow arcs and filtering. [DB]
*
*   Jun 1995 : Added code for alpha channel support. [DB]
*
******************************************************************************/

static void do_rainbow(RAY *Ray, INTERSECTION *Intersection, COLOUR Colour)
{
  int n;
  DBL dot, k, ki, index, x, y, l, angle, fade, f;
  VECTOR Temp;
  COLOUR Cr, Ct;
  RAINBOW *Rainbow;

  /* Why are we here. */

  if (Frame.Rainbow == NULL)
  {
    return;
  }

  Make_ColourA(Ct, 0.0, 0.0, 0.0, 1.0, 1.0);

  n = 0;

  for (Rainbow = Frame.Rainbow; Rainbow != NULL; Rainbow = Rainbow->Next)
  {
    if ((Rainbow->Pigment != NULL) && (Rainbow->Distance != 0.0) && (Rainbow->Width != 0.0))
    {
      /* Get angle between ray direction and rainbow's up vector. */

      VDot(x, Ray->Direction, Rainbow->Right_Vector);
      VDot(y, Ray->Direction, Rainbow->Up_Vector);

      l = Sqr(x) + Sqr(y);

      if (l > 0.0)
      {
        l = sqrt(l);

        y /= l;
      }

      angle = fabs(acos(y));

      if (angle <= Rainbow->Arc_Angle)
      {
        /* Get dot product between ray direction and antisolar vector. */

        VDot(dot, Ray->Direction, Rainbow->Antisolar_Vector);

        if (dot >= 0.0)
        {
          /* Get index ([0;1]) into rainbow's colour map. */

          index = (acos(dot) - Rainbow->Angle) / Rainbow->Width;

          /* Jitter index. */

          if (Rainbow->Jitter > 0.0)
          {
            index += (2.0 * FRAND() - 1.0) * Rainbow->Jitter;
          }

          if ((index >= 0.0) && (index <= 1.0 - EPSILON))
          {
            /* Get colour from rainbow's colour map. */

            Make_Vector(Temp, index, 0.0, 0.0);

            Compute_Pigment(Cr, Rainbow->Pigment, Temp, Intersection);

            /* Get fading value for falloff. */

            if ((Rainbow->Falloff_Width > 0.0) && (angle > Rainbow->Falloff_Angle))
            {
              fade = (angle - Rainbow->Falloff_Angle) / Rainbow->Falloff_Width;

              fade = (3.0 - 2.0 * fade) * fade * fade;
            }
            else
            {
              fade = 0.0;
            }

            /* Get attenuation factor due to distance. */

            k = exp(-Intersection->Depth / Rainbow->Distance);

            /* Colour's transm value is used as minimum attenuation value. */

            k = max(k, fade * (1.0 - Cr[pTRANSM]) + Cr[pTRANSM]);

            /* Now interpolate the colours. */

            ki = 1.0 - k;

            /* Attenuate filter value. */

            f = Cr[pFILTER] * ki;

            Ct[pRED]    += k * Colour[pRED]   * ((1.0 - f) + f * Cr[pRED])   + ki * Cr[pRED];
            Ct[pGREEN]  += k * Colour[pGREEN] * ((1.0 - f) + f * Cr[pGREEN]) + ki * Cr[pGREEN];
            Ct[pBLUE]   += k * Colour[pBLUE]  * ((1.0 - f) + f * Cr[pBLUE])  + ki * Cr[pBLUE];
            Ct[pFILTER] *= k * Cr[pFILTER];
            Ct[pTRANSM] *= k * Cr[pTRANSM];

            n++;
          }
        }
      }
    }
  }

  if (n > 0)
  {
    COLC tmp = 1.0 / n;

    Colour[pRED] = Ct[pRED] * tmp;
    Colour[pGREEN] = Ct[pGREEN] * tmp;
    Colour[pBLUE] = Ct[pBLUE] * tmp;

    Colour[pFILTER] *= Ct[pFILTER];
    Colour[pTRANSM] *= Ct[pTRANSM];
  }
}



/*****************************************************************************
*
* FUNCTION
*
*   do_skysphere
*
* INPUT
*
*   Ray    - Current ray
*
* OUTPUT
*
*   Colour - Current color
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Calculate color of the sky.
*
*   Use the ray direction as a point on the skysphere. Thus the sky can
*   easily be colored with all kinds of pigments.
*
* CHANGES
*
*   Jul 1994 : Creation.
*
*   Dec 1994 : Modified to allow layered pigments. [DB]
*
*   Jun 1995 : Added code for alpha channel support. [DB]
*
******************************************************************************/

static void do_skysphere(RAY *Ray, COLOUR Colour)
{
  int i;
  DBL att, trans;
  COLOUR Col, Col_Temp, Filter;
  VECTOR P;
  SKYSPHERE *Skysphere;

  /* Why are we here. */

  if (Frame.Skysphere == NULL)
  {
    return;
  }

  Make_Colour(Col, 0.0, 0.0, 0.0);

  if (((Skysphere = Frame.Skysphere) != NULL) && (Skysphere->Pigments != NULL))
  {
    Make_ColourA(Filter, 1.0, 1.0, 1.0, 1.0, 1.0);

    trans = 1.0;

    /* Transform point on unit sphere. */

    if (Skysphere->Trans != NULL)
    {
      MInvTransPoint(P, Ray->Direction, Skysphere->Trans);
    }
    else
    {
      Assign_Vector(P, Ray->Direction);
    }

    for (i = Skysphere->Count-1; i >= 0; i--)
    {
      /* Compute sky colour from colour map. */

      /* NK 1998 - added NULL as final parameter */
      Compute_Pigment(Col_Temp, Skysphere->Pigments[i], P, NULL);
      /* NK ---- */

      att = trans * (1.0 - Col_Temp[pFILTER] - Col_Temp[pTRANSM]);

      CRGBAddScaledEq(Col, att, Col_Temp);

      Filter[pRED]    *= Col_Temp[pRED];
      Filter[pGREEN]  *= Col_Temp[pGREEN];
      Filter[pBLUE]   *= Col_Temp[pBLUE];
      Filter[pFILTER] *= Col_Temp[pFILTER];
      Filter[pTRANSM] *= Col_Temp[pTRANSM];

      trans = fabs(Filter[pFILTER]) + fabs(Filter[pTRANSM]);
    }

    Colour[pRED]    = Col[pRED]    + Colour[pRED]   * (Filter[pRED]   * Filter[pFILTER] + Filter[pTRANSM]);
    Colour[pGREEN]  = Col[pGREEN]  + Colour[pGREEN] * (Filter[pGREEN] * Filter[pFILTER] + Filter[pTRANSM]);
    Colour[pBLUE]   = Col[pBLUE]   + Colour[pBLUE]  * (Filter[pBLUE]  * Filter[pFILTER] + Filter[pTRANSM]);
    Colour[pFILTER] = Colour[pFILTER] * Filter[pFILTER];
    Colour[pTRANSM] = Colour[pTRANSM] * Filter[pTRANSM];
  }
}



/*****************************************************************************
*
* FUNCTION
*
*   constant_fog
*
* INPUT
*
*   Ray    - current ray
*   Depth  - intersection depth with fog's boundary
*   Width  - width of the fog along the ray
*   Fog    - current fog
*
* OUTPUT
*
*   Colour - color of the fog
*
* RETURNS
*
* AUTHOR
*
*   POV-Ray Team
*
* DESCRIPTION
*
*   Apply distance attenuated fog.
*
* CHANGES
*
*   Dec 1994 : Modified to work with multiple fogs. [DB]
*
******************************************************************************/

static DBL constant_fog(RAY *Ray, DBL Depth, DBL  Width, FOG *Fog, COLOUR Colour)
{
  DBL k;
  VECTOR P;

  if (Fog->Turb != NULL)
  {
    Depth += Width / 2.0;

    VEvaluateRay(P, Ray->Initial, Depth, Ray->Direction);

    VEvaluateEq(P, Fog->Turb->Turbulence);

    /* The further away the less influence turbulence has. */

    k = exp(-Width / Fog->Distance);

    Width *= 1.0 - k * min(1.0, Turbulence(P, Fog->Turb, NULL)*Fog->Turb_Depth);
  }

  Assign_Colour(Colour, Fog->Colour);

  return (exp(-Width / Fog->Distance));
}



/*****************************************************************************
*
* FUNCTION
*
*   ground_fog
*
* INPUT
*
*   Ray   - current ray
*   Depth - intersection depth with fog's boundary
*   Width - width of the fog along the ray
*   Fog   - current fog
*
* OUTPUT
*
*   Colour - color of the fog
*
* RETURNS
*
* AUTHOR
*
*   Eric Barish
*
* DESCRIPTION
*
*   Here is an ascii graph of the ground fog density, it has a maximum
*   density of 1.0 at Y <= 0, and approaches 0.0 as Y goes up:
*
*   ***********************************
*        |           |            |    ****
*        |           |            |        ***
*        |           |            |           ***
*        |           |            |            | ****
*        |           |            |            |     *****
*        |           |            |            |          *******
*   -----+-----------+------------+------------+-----------+-----
*       Y=-2        Y=-1         Y=0          Y=1         Y=2
*
*   ground fog density is 1 / (Y*Y+1) for Y >= 0 and equals 1.0 for Y <= 0.
*   (It behaves like regular fog for Y <= 0.)
*
*   The integral of the density is atan(Y) (for Y >= 0).
*
* CHANGES
*
*   Feb 1996 : Changed to behave like normal fog for Y <= 0.
*              Fixed bug with reversed offset effect. [DB]
*
******************************************************************************/

static DBL ground_fog(RAY *Ray, DBL Depth, DBL  Width, FOG *Fog, COLOUR Colour)
{
  DBL fog_density, delta;
  DBL start, end;
  DBL y1, y2, k;
  VECTOR P, P1, P2;

  /* Get start point. */

  VEvaluateRay(P1, Ray->Initial, Depth, Ray->Direction);

  /* Get end point. */

  VLinComb2(P2, 1.0, P1, Width, Ray->Direction);

  /*
   * Could preform transfomation here to translate Start and End
   * points into ground fog space.
   */

  VDot(y1, P1, Fog->Up);
  VDot(y2, P2, Fog->Up);

  start = (y1 - Fog->Offset) / Fog->Alt;
  end   = (y2 - Fog->Offset) / Fog->Alt;

  /* Get integral along y-axis from start to end. */

  if (start <= 0.0)
  {
    if (end <= 0.0)
    {
      fog_density = 1.0;
    }
    else
    {
      fog_density = (atan(end) - start) / (end - start);
    }
  }
  else
  {
    if (end <= 0.0)
    {
      fog_density = (atan(start) - end) / (start - end);
    }
    else
    {
      delta = start - end;

      if (fabs(delta) > EPSILON)
      {
        fog_density = (atan(start) - atan(end)) / delta;
      }
      else
      {
        fog_density = 1.0 / (Sqr(start) + 1.0);
      }
    }
  }

  /* Apply turbulence. */

  if (Fog->Turb != NULL)
  {
    VHalf(P, P1, P2);

    VEvaluateEq(P, Fog->Turb->Turbulence);

    /* The further away the less influence turbulence has. */

    k = exp(-Width / Fog->Distance);

    Width *= 1.0 - k * min(1.0, Turbulence(P, Fog->Turb, NULL)*Fog->Turb_Depth);
  }

  Assign_Colour(Colour, Fog->Colour);

  return (exp(-Width * fog_density / Fog->Distance));
}



/*****************************************************************************
*
* FUNCTION
*
*   Create_Fog
*
* INPUT
*
* OUTPUT
*
* RETURNS
*
*   FOG * - created fog
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Create a fog.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

FOG *Create_Fog()
{
  FOG *New;

  New = (FOG *)POV_MALLOC(sizeof(FOG), "fog");

  New->Type = ORIG_FOG;

  New->Distance = 0.0;
  New->Alt      = 0.0;
  New->Offset   = 0.0;

  Make_ColourA(New->Colour, 0.0, 0.0, 0.0, 0.0, 0.0);

  Make_Vector(New->Up, 0.0, 1.0, 0.0);

  New->Turb = NULL;
  New->Turb_Depth = 0.5;

  New->Next = NULL;

  return (New);
}



/*****************************************************************************
*
* FUNCTION
*
*   Copy_Fog
*
* INPUT
*
*   Old - fog to copy
*
* OUTPUT
*
* RETURNS
*
*   FOG * - new fog
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Copy a fog.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

FOG *Copy_Fog(FOG *Old)
{
  FOG *New;

  New = Create_Fog();

  *New = *Old;

  New->Turb = (TURB *)Copy_Warps(((WARP *)Old->Turb));

  return (New);
}



/*****************************************************************************
*
* FUNCTION
*
*   Destroy_Fog
*
* INPUT
*
*   Fog - fog to destroy
*
* OUTPUT
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Destroy a fog.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

void Destroy_Fog(FOG *Fog)
{
  if (Fog != NULL)
  {
    Destroy_Turb(Fog->Turb);

    POV_FREE(Fog);
  }
}



/*****************************************************************************
*
* FUNCTION
*
*   Create_Rainbow
*
* INPUT
*
* OUTPUT
*
* RETURNS
*
*   RAINBOW * - created rainbow
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Create a rainbow.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

RAINBOW *Create_Rainbow()
{
  RAINBOW *New;

  New = (RAINBOW *)POV_MALLOC(sizeof(RAINBOW), "fog");

  New->Distance = Max_Distance;
  New->Jitter   = 0.0;
  New->Angle    = 0.0;
  New->Width    = 0.0;

  New->Falloff_Width  = 0.0;
  New->Arc_Angle      = 180.0;
  New->Falloff_Angle  = 180.0;

  New->Pigment = NULL;

  Make_Vector(New->Antisolar_Vector, 0.0, 0.0, 0.0);

  Make_Vector(New->Right_Vector, 1.0, 0.0, 0.0);
  Make_Vector(New->Up_Vector, 0.0, 1.0, 0.0);

  New->Next = NULL;

  return (New);
}



/*****************************************************************************
*
* FUNCTION
*
*   Copy_Rainbow
*
* INPUT
*
*   Old - rainbow to copy
*
* OUTPUT
*
* RETURNS
*
*   RAINBOW * - new rainbow
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Copy a rainbow.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

RAINBOW *Copy_Rainbow(RAINBOW *Old)
{
  RAINBOW *New;

  New = Create_Rainbow();

  *New = *Old;

  return (New);
}



/*****************************************************************************
*
* FUNCTION
*
*   Destroy_Rainbow
*
* INPUT
*
*   Rainbow - rainbow to destroy
*
* OUTPUT
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Destroy a rainbow.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

void Destroy_Rainbow(RAINBOW *Rainbow)
{
  if (Rainbow != NULL)
  {
    Destroy_Pigment(Rainbow->Pigment);

    POV_FREE(Rainbow);
  }
}



/*****************************************************************************
*
* FUNCTION
*
*   Create_Skysphere
*
* INPUT
*
* OUTPUT
*
* RETURNS
*
*   SKYSPHERE * - created skysphere
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Create a skysphere.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

SKYSPHERE *Create_Skysphere()
{
  SKYSPHERE *New;

  New = (SKYSPHERE *)POV_MALLOC(sizeof(SKYSPHERE), "fog");

  New->Count = 0;

  New->Pigments = NULL;

  New->Trans = Create_Transform();

  return (New);
}



/*****************************************************************************
*
* FUNCTION
*
*   Copy_Skysphere
*
* INPUT
*
*   Old - skysphere to copy
*
* OUTPUT
*
* RETURNS
*
*   SKYSPHERE * - copied skysphere
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Copy a skysphere.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

SKYSPHERE *Copy_Skysphere(SKYSPHERE *Old)
{
  int i;
  SKYSPHERE *New;

  New = Create_Skysphere();

  Destroy_Transform(New->Trans);

  *New = *Old;

  New->Trans = Copy_Transform(Old->Trans);

  if (New->Count > 0)
  {
    New->Pigments = (PIGMENT **)POV_MALLOC(New->Count*sizeof(PIGMENT *), "skysphere pigment");

    for (i = 0; i < New->Count; i++)
    {
      New->Pigments[i] = Copy_Pigment(Old->Pigments[i]);
    }
  }

  return (New);
}



/*****************************************************************************
*
* FUNCTION
*
*   Destroy_Skysphere
*
* INPUT
*
*   Skysphere - skysphere to destroy
*
* OUTPUT
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Destroy a skysphere.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

void Destroy_Skysphere(SKYSPHERE *Skysphere)
{
  int i;

  if (Skysphere != NULL)
  {
    for (i = 0; i < Skysphere->Count; i++)
    {
      Destroy_Pigment(Skysphere->Pigments[i]);
    }

    POV_FREE(Skysphere->Pigments);

    Destroy_Transform(Skysphere->Trans);

    POV_FREE(Skysphere);
  }
}



/*****************************************************************************
*
* FUNCTION
*
*   Rotate_Skysphere
*
* INPUT
*
*   Vector - Rotation vector
*
* OUTPUT
*
*   Skysphere - Pointer to skysphere structure
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Rotate a skysphere.
*
* CHANGES
*
*   Feb 1996 : Creation.
*
******************************************************************************/

void Rotate_Skysphere(SKYSPHERE *Skysphere, VECTOR Vector)
{
  TRANSFORM Trans;

  Compute_Rotation_Transform(&Trans, Vector);

  Transform_Skysphere(Skysphere, &Trans);
}



/*****************************************************************************
*
* FUNCTION
*
*   Scale_Skysphere
*
* INPUT
*
*   Vector - Scaling vector
*
* OUTPUT
*
*   Skysphere - Pointer to skysphere structure
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Scale a skysphere.
*
* CHANGES
*
*   Feb 1996 : Creation.
*
******************************************************************************/

void Scale_Skysphere(SKYSPHERE *Skysphere, VECTOR Vector)
{
  TRANSFORM Trans;

  Compute_Scaling_Transform(&Trans, Vector);

  Transform_Skysphere(Skysphere, &Trans);
}



/*****************************************************************************
*
* FUNCTION
*
*   Translate_Skysphere
*
* INPUT
*
*   Vector - Translation vector
*
* OUTPUT
*
*   Skysphere - Pointer to skysphere structure
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Translate a skysphere.
*
* CHANGES
*
*   Feb 1996 : Creation.
*
******************************************************************************/

void Translate_Skysphere(SKYSPHERE *Skysphere, VECTOR Vector)
{
  TRANSFORM Trans;

  Compute_Translation_Transform(&Trans, Vector);

  Transform_Skysphere(Skysphere, &Trans);
}



/*****************************************************************************
*
* FUNCTION
*
*   Transform_Skysphere
*
* INPUT
*
*   Trans  - Pointer to transformation
*
* OUTPUT
*
*   Skysphere - Pointer to skysphere structure
*
* RETURNS
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Transform a skysphere.
*
* CHANGES
*
*   Feb 1996 : Creation.
*
******************************************************************************/

void Transform_Skysphere(SKYSPHERE *Skysphere, TRANSFORM *Trans)
{
  if (Skysphere->Trans == NULL)
  {
    Skysphere->Trans = Create_Transform();
  }

  Compose_Transforms(Skysphere->Trans, Trans);
}

END_POV_NAMESPACE
