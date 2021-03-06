/****************************************************************************
 *                  interior.cpp
 *
 * This module contains all functions for interior stuff.
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
 * $File: //depot/povray/3.5/source/interior.cpp $
 * $Revision: #15 $
 * $Change: 3010 $
 * $DateTime: 2004/07/27 14:06:43 $
 * $Author: thorsten $
 * $Log$
 *****************************************************************************/

#include "frame.h"
#include "vector.h"
#include "chi2.h"
#include "colour.h"
#include "povray.h"
#include "texture.h"
#include "pigment.h"
#include "objects.h"
#include "lighting.h"
#include "matrices.h"
#include "interior.h"
#include "povray.h"
#include "point.h"
#include "texture.h"
#include "ray.h"

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



/*****************************************************************************
*
* FUNCTION
*
*   Init_Interior
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
*   Initialize interior.
*
* CHANGES
*
*   Jan 1997 : Creation.
*
******************************************************************************/

void Init_Interior(INTERIOR *)
{
}



/*****************************************************************************
*
* FUNCTION
*
*   Create_Interior
*
* INPUT
*
* OUTPUT
*
* RETURNS
*
*   INTERIOR * - created interior
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Create a interior.
*
* CHANGES
*
*   Dec 1994 : Creation.
*   Sep 1999 : Fade_Colour added - Edward Coffey
*
******************************************************************************/

INTERIOR *Create_Interior()
{
  INTERIOR *New;

  New = (INTERIOR *)POV_MALLOC(sizeof(INTERIOR), "interior");
  
  New->References = 1;

  New->IOR = 0.0;
  New->Old_Refract = 1.0;

  New->Dispersion  = 1.0;
  New->Disp_NElems = DEFAULT_DISP_NELEMS;

  New->Caustics = 0.0;

  New->Fade_Distance = 0.0;
  New->Fade_Power    = 0.0;
  Make_Colour(New->Fade_Colour, 0.0, 0.0, 0.0);

  New->IMedia = NULL;

  return(New);
}



/*****************************************************************************
*
* FUNCTION
*
*   Copy_Interior
*
* INPUT
*
*   Old - interior to copy
*
* OUTPUT
*
* RETURNS
*
*   INTERIOR * - new interior
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Copy an interior.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

INTERIOR *Copy_Interior(INTERIOR *Old)
{
  INTERIOR *New;

  if (Old != NULL)
  {
    New = Create_Interior();

    *New = *Old;

    New->IMedia = Copy_Media(Old->IMedia);

    return(New);
  }
  else
  {
    return(NULL);
  }
}

/*****************************************************************************
*
* FUNCTION
*
*   Copy_Interior_Pointer
*
* INPUT
*
*   Old - interior to copy
*
* OUTPUT
*
* RETURNS
*
*   INTERIOR * - new interior
*
* AUTHOR
*
*   Dieter Bayer
*
* DESCRIPTION
*
*   Copy an interior by increasing number of references.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

INTERIOR *Copy_Interior_Pointer(INTERIOR *Old)
{
  if (Old != NULL)
  {
    Old->References++;
  }

  return(Old);
}



/*****************************************************************************
*
* FUNCTION
*
*   Destroy_Interior
*
* INPUT
*
*   Interior - interior to destroy
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
*   Destroy an interior.
*
* CHANGES
*
*   Dec 1994 : Creation.
*
******************************************************************************/

void Destroy_Interior(INTERIOR *Interior)
{
  if ((Interior != NULL) && (--(Interior->References) == 0))
  {
    Destroy_Media(Interior->IMedia);

    POV_FREE(Interior);
  }
}



/*****************************************************************************
*
* FUNCTION
*
*   Transform_Interior
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
*   Transform interior.
*
* CHANGES
*
*   Jan 1997 : Creation.
*
******************************************************************************/

void Transform_Interior(INTERIOR *Interior, TRANSFORM *Trans)
{
  if (Interior != NULL)
  {
    if (Interior->IMedia != NULL)
    {
      Transform_Media(Interior->IMedia, Trans);
    }
  }
}


MATERIAL *Create_Material()
{
  MATERIAL *New;

  New = (MATERIAL *)POV_MALLOC(sizeof(MATERIAL), "material");
  
  New->Texture  = NULL;
  New->Interior_Texture  = NULL;
  New->Interior = NULL;

  return(New);
}


MATERIAL *Copy_Material(MATERIAL *Old)
{
  MATERIAL *New;

  if (Old != NULL)
  {
    New = Create_Material();

    *New = *Old;

    New->Texture  = Copy_Textures(Old->Texture);
    New->Interior_Texture  = Copy_Textures(Old->Interior_Texture);
    New->Interior = Copy_Interior(Old->Interior);

    return(New);
  }
  else
  {
    return(NULL);
  }
}

void Destroy_Material(MATERIAL *Material)
{
  if (Material != NULL) 
  {
    Destroy_Textures(Material->Texture);
    Destroy_Textures(Material->Interior_Texture);
    Destroy_Interior(Material->Interior);

    POV_FREE(Material);
  }
}

END_POV_NAMESPACE
