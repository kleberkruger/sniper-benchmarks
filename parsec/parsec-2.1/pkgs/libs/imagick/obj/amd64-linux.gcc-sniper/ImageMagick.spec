Summary: ImageMagick® is a software suite to create, edit, and compose bitmap images. It can read, convert and write images in a variety of formats (about 200) including GIF, JPEG, JPEG-2000, PNG, PDF, PhotoCD, TIFF, and DPX. Use ImageMagick to translate, flip, mirror, rotate, scale, shear and transform images, adjust image colors, apply various special effects, or draw text, lines, polygons, ellipses and Bézier curves.
Name: ImageMagick
Version: 6.3.6
Release: 1
License: Apache-style
Group: Applications/Multimedia
Source: ftp://ftp.imagemagick.org/pub/ImageMagick/%{name}/%{name}-%{version}.tar.bz2
Url: http://www.imagemagick.org/
Buildroot: %{_tmppath}/%{name}-%{version}-root
BuildPrereq: bzip2-devel, freetype2-devel, libjpeg-devel, libpng-devel
BuildPrereq: libtiff-devel, zlib-devel, perl
BuildRequires: freetype-devel >= 1.0.2
BuildRequires: automake >= 1.7 autoconf >= 2.58 libtool >= 1.5
BuildRequires: ghostscript-devel
BuildRequires: libwmf-devel
BuildRequires: XFree86-devel
%define _unpackaged_files_terminate_build 0

%description
ImageMagick® is a software suite to create, edit, and compose bitmap images. It can read, convert and write images in a variety of formats (about 100) including DPX, GIF, JPEG, JPEG-2000, PDF, PhotoCD, PNG, Postscript, SVG, and TIFF. Use ImageMagick to translate, flip, mirror, rotate, scale, shear and transform images, adjust image colors, apply various special effects, or draw text, lines, polygons, ellipses and Bézier curves.

The functionality of ImageMagick is typically utilized from the command line or you can use the features from programs written in your favorite programming language. Choose from these interfaces: G2F (Ada), MagickCore (C), MagickWand (C), ChMagick (Ch), Magick++ (C++), JMagick (Java), L-Magick (Lisp), nMagick (Neko/haXe), PascalMagick (Pascal), PerlMagick (Perl), MagickWand for PHP (PHP), PythonMagick (Python), RMagick (Ruby), or TclMagick (Tcl/TK). With a language interface, use ImageMagick to modify or create images automagically and dynamically.

ImageMagick is free software delivered as a ready-to-run binary distribution or as source code that you can freely use, copy, modify, and distribute. Its license is compatible with the GPL. It runs on all major operating systems.

%package devel
Summary: Static libraries and header files for ImageMagick application development.
Group: Development/Libraries
Requires: %{name} = %{version}-%{release}
Requires: XFree86-devel
Requires: ghostscript-devel

%description devel
ImageMagick-devel contains the static libraries and header files you'll need to develop ImageMagick applications. ImageMagick is an image manipulation program.

If you want to create applications that will use ImageMagick code or APIs, you need to install ImageMagick-devel as well as ImageMagick.  You do not need to install it if you just want to use ImageMagick,
however.

%package perl
Summary: ImageMagick Perl bindings
Group: System Environment/Libraries
Requires: %{name} = %{version}-%{release}
Requires: perl >= 5.6.0
%define perl_vendorarch %(perl -MConfig -le 'print $Config{installvendorarch}')
Prereq: %{perl_vendorarch}

%description perl
Perl bindings to ImageMagick.

Install ImageMagick-perl if you want to use any Perl scripts that use ImageMagick.

%package c++
Summary: ImageMagick Magick++ library (C++ bindings)
Group: System Environment/Libraries
Requires: %{name} = %{version}-%{release}

%description c++
This package contains the Magick++ library, a C++ binding to the ImageMagick graphics manipulation library.

Install ImageMagick-c++ if you want to use any applications that use Magick++.

%package c++-devel
Summary: C++ bindings for the ImageMagick library
Group: Development/Libraries
Requires: %{name}-c++ = %{version}
Requires: %{name}-devel = %{version}

%description c++-devel
ImageMagick-devel contains the static libraries and header files you'll need to develop ImageMagick applications using the Magick++ C++ bindings.  ImageMagick is an image manipulation program.

If you want to create applications that will use Magick++ code or APIs, you'll need to install ImageMagick-c++-devel, ImageMagick-devel and ImageMagick.  You don't need to install it if you just want to use ImageMagick, or if you want to develop/compile applications using the ImageMagick C interface, however.

%prep
%setup -q -n %{name}-%{version}
%define _docdir %{_usr}/share/doc

%build
%define optflags -O2 -g -pipe -Wall
%configure --enable-shared \
           --with-modules \
           --with-perl \
           --with-x \
           --with-threads \
           --with-magick_plus_plus \
           --with-perl-options="INSTALLDIRS=vendor %{?perl_prefix} CC='%__cc -L$PWD/magick/.libs' LD='%__ld -L$PWD/magick/.libs'"

make

%install
rm -rf $RPM_BUILD_ROOT

make install DESTDIR=$RPM_BUILD_ROOT

# perlmagick: fix perl path of demo files
%{__perl} -MExtUtils::MakeMaker -e 'MY->fixin(@ARGV)' PerlMagick/demo/*.pl

find $RPM_BUILD_ROOT -name "*.bs" |xargs rm -f
find $RPM_BUILD_ROOT -name ".packlist" |xargs rm -f
find $RPM_BUILD_ROOT -name "perllocal.pod" |xargs rm -f

# perlmagick: build files list
echo "%defattr(-,root,root)" > perl-pkg-files
find $RPM_BUILD_ROOT/%{_libdir}/perl* -type f -print | \
	sed "s@^$RPM_BUILD_ROOT@@g" > perl-pkg-files 
find $RPM_BUILD_ROOT%{perl_vendorarch} -type d -print | \
	sed "s@^$RPM_BUILD_ROOT@%dir @g" | \
 	grep -v '^%dir %{perl_vendorarch}$' | \
	grep -v '/auto$' >> perl-pkg-files 
if [ -z perl-pkg-files ] ; then
  echo "ERROR: EMPTY FILE LIST"
  exit -1
fi

rm -rf $RPM_BUILD_ROOT%{_libdir}/ImageMagick
# Keep config
rm -rf $RPM_BUILD_ROOT%{_datadir}/%{name}-%{version}/[a-b,d-z,A-Z]*
rm -rf $RPM_BUILD_ROOT%{_libdir}/libltdl.*
rm -f  $RPM_BUILD_ROOT%{_libdir}/ImageMagick-*/modules*/*/*.a
rm -f  $RPM_BUILD_ROOT%{_libdir}/*.la

# link docs
ln -sf %{_docdir}/%{name}-%{version} $RPM_BUILD_ROOT%{_libdir}/ImageMagick-%{version}/doc

%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/ldconfig

%post c++ -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%postun c++ -p /sbin/ldconfig

%files
%defattr(-,root,root)
%doc index.html www/ images/ 
%doc QuickStart.txt ChangeLog Platforms.txt
%doc README.txt LICENSE NOTICE AUTHORS NEWS
%attr(755,root,root) %{_libdir}/libMagick.so.*
%attr(755,root,root) %{_libdir}/libWand.so.*
%{_bindir}/[a-z]*
%{_libdir}/ImageMagick*
%{_datadir}/ImageMagick*
%{_mandir}/man[145]/[a-z]*
%{_mandir}/man1/ImageMagick.*

%files devel
%defattr(-,root,root)
%{_bindir}/Magick-config
%{_bindir}/Wand-config
%{_libdir}/libMagick.a
%{_libdir}/libMagick.so
%{_libdir}/libWand.a
%{_libdir}/libWand.so
%{_libdir}/pkgconfig/ImageMagick.pc
%{_libdir}/pkgconfig/Wand.pc
%{_includedir}/magick
%{_includedir}/wand
%{_mandir}/man1/Magick-config.*
%{_mandir}/man1/Wand-config.*

%files c++
%defattr(-,root,root)
%{_libdir}/libMagick++.so.*

%files c++-devel
%defattr(-,root,root)
%{_bindir}/Magick++-config
%{_includedir}/Magick++
%{_includedir}/Magick++.h
%{_libdir}/libMagick++.a
%{_libdir}/libMagick++.so
%{_libdir}/pkgconfig/ImageMagick++.pc
%{_mandir}/man1/Magick++-config.*

%files perl -f perl-pkg-files
%defattr(-,root,root)
%{_mandir}/man3/*
%doc PerlMagick/demo/ PerlMagick/Changelog PerlMagick/README.txt

%changelog
* Sun May 01 2005 Cristy <cristy@mystic.es.dupont.com> 1.0-0
*  Port of Redhat's RPM script to support ImageMagick.
