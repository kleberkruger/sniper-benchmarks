This is the SPEC CPU2006 perl benchmark, based upon perl V5.8.5.
Please see the comments in spec_config.h for details.

Note that Paragraph 3 of the Artistic license (included in the source 
directory) says:

> 3. You may otherwise modify your copy of this Package in any way, provided
> that you insert a prominent notice in each changed file stating how and
> when you changed that file, and provided that you do at least ONE of the
> following:
...
>     c) rename any non-standard executables so the names do not conflict
>     with standard executables, which must also be provided, and provide
>     a separate manual page for each non-standard executable that clearly
>     documents how it differs from the Standard Version.

In an attempt to meet the spirit of paragraph 3c, the following measures
are employed:

 - The executable built by the enclosed Makefile is named "perlbench".

 - Please consider this README plus the comments in spec_config.h to 
   constitute the documentation of how perlbench differs from perl.  

   In brief: perlbench is a constrained version of perl which tries 
   to remove most operating-system-specific functions, while 
   hopefully leaving behind a set of features which are 
   interesting as a CPU benchmark.  The CPU suite intentionally
   does not spend significant time in operating system services
   or IO; see for example Q5 at http://www.spec.org/osg/cpu95/qanda.html

 - If you would like to build the standard perl executable rather than
   the benchmark version, perl-5.8.5.tar.bz2 is in
   $SPEC/redistributable_sources/original/400.perlbench/ on your 
   SPEC CPU2006 DVD

   It's unlikely that this is a current version, though.  For the latest
   version of Perl, please check the Comprehensive Perl Archive Network
   at http://www.cpan.org/

----------------------------------------------

The YACC sources for the perl parser (perly.y) are included in the src
directory for users of non-ASCII systems who wish to attempt to port
400.perlbench to their platform.  During a normal benchmark build, this
file is not used and is provided for reference only.  Review of a submission
using a parser generated from this file would also necessarily involve a
review of the generated parser as well.

