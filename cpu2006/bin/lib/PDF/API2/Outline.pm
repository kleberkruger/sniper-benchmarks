#=======================================================================
#    ____  ____  _____              _    ____ ___   ____
#   |  _ \|  _ \|  ___|  _   _     / \  |  _ \_ _| |___ \
#   | |_) | | | | |_    (_) (_)   / _ \ | |_) | |    __) |
#   |  __/| |_| |  _|    _   _   / ___ \|  __/| |   / __/
#   |_|   |____/|_|     (_) (_) /_/   \_\_|  |___| |_____|
#
#   A Perl Module Chain to faciliate the Creation and Modification
#   of High-Quality "Portable Document Format (PDF)" Files.
#
#   Copyright 1999-2005 Alfred Reibenschuh <areibens@cpan.org>.
#
#=======================================================================
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU Lesser General Public
#   License as published by the Free Software Foundation; either
#   version 2 of the License, or (at your option) any later version.
#
#   This library is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public
#   License along with this library; if not, write to the
#   Free Software Foundation, Inc., 59 Temple Place - Suite 330,
#   Boston, MA 02111-1307, USA.
#
#   $Id: Outline.pm,v 2.0 2005/11/16 02:16:00 areibens Exp $
#
#=======================================================================

package PDF::API2::Outline;

BEGIN {
    use strict;
    use vars qw( @ISA $VERSION);
    use PDF::API2::Util;
    use PDF::API2::Basic::PDF::Utils;
    use PDF::API2::Basic::PDF::Dict;

    @ISA = qw(PDF::API2::Basic::PDF::Dict);

    ( $VERSION ) = sprintf '%i.%03i', split(/\./,('$Revision: 2.0 $' =~ /Revision: (\S+)\s/)[0]); # $Date: 2005/11/16 02:16:00 $

}

no warnings qw[ deprecated recursion uninitialized ];

=head1 $otl = PDF::API2::Outline->new $api,$parent,$prev

Returns a new outline object (called from $otls->outline).

=cut

sub new {
    my ($class,$api,$parent,$prev)=@_;
    my $self = $class->SUPER::new;
    $self->{' apipdf'}=$api->{pdf};
    $self->{' api'}=$api;
    $self->{Parent}=$parent if(defined $parent);
    $self->{Prev}=$prev if(defined $prev);
    return($self);
}

sub parent {
    my $self=shift @_;
    if(defined $_[0]) {
        $self->{Parent}=shift @_;
    }
    return $self->{Parent};
}

sub prev {
    my $self=shift @_;
    if(defined $_[0]) {
        $self->{Prev}=shift @_;
    }
    return $self->{Prev};
}

sub next {
    my $self=shift @_;
    if(defined $_[0]) {
        $self->{Next}=shift @_;
    }
    return $self->{Next};
}

sub first {
    my $self=shift @_;
    $self->{First}=$self->{' childs'}->[0] if(defined $self->{' childs'} && defined $self->{' childs'}->[0]);
    return $self->{First} ;
}

sub last {
    my $self=shift @_;
    $self->{Last}=$self->{' childs'}->[-1] if(defined $self->{' childs'} && defined $self->{' childs'}->[-1]);
    return $self->{Last};
}

sub count {
    my $self=shift @_;
    my $cnt=scalar @{$self->{' childs'}||[]};
    map { $cnt+=$_->count();} @{$self->{' childs'}};
    $self->{Count}=PDFNum($self->{' closed'} ? -$cnt : $cnt) if($cnt>0);
    return $cnt;
}

sub fix_outline {
    my ($self)=@_;
    $self->first;
    $self->last;
    $self->count;
}

=item $otl->title $text

Set the title of the outline.

=cut

sub title {
    my ($self,$txt)=@_;
    $self->{Title}=PDFStr($txt);
    return($self);
}

=item $otl->closed

Set the status of the outline to closed.

=cut

sub closed {
    my $self=shift @_;
    $self->{' closed'}=1;
    return $self;
}

=item $otl->open

Set the status of the outline to open.

=cut

sub open {
    my $self=shift @_;
    delete $self->{' closed'};
    return $self;
}

=item $sotl=$otl->outline

Returns a new sub-outline.

=cut

sub outline {
    my $self=shift @_;
    my $obj=PDF::API2::Outline->new($self->{' api'},$self);
    $obj->prev($self->{' childs'}->[-1]) if(defined $self->{' childs'});
    $self->{' childs'}->[-1]->next($obj) if(defined $self->{' childs'});
    push(@{$self->{' childs'}},$obj);
    $self->{' api'}->{pdf}->new_obj($obj) if(!$obj->is_obj($self->{' api'}->{pdf}));
    return $obj;
}

=item $otl->dest $pageobj [, %opts]

Sets the destination page of the outline.

=item $otl->dest( $page, -fit => 1 )

Display the page designated by page, with its contents magnified just enough to
fit the entire page within the window both horizontally and vertically. If the
required horizontal and vertical magnification factors are different, use the
smaller of the two, centering the page within the window in the other dimension.

=item $otl->dest( $page, -fith => $top )

Display the page designated by page, with the vertical coordinate top positioned
at the top edge of the window and the contents of the page magnified just enough
to fit the entire width of the page within the window.

=item $otl->dest( $page, -fitv => $left )

Display the page designated by page, with the horizontal coordinate left positioned
at the left edge of the window and the contents of the page magnified just enough
to fit the entire height of the page within the window.

=item $otl->dest( $page, -fitr => [ $left, $bottom, $right, $top ] )

Display the page designated by page, with its contents magnified just enough to
fit the rectangle specified by the coordinates left, bottom, right, and top
entirely within the window both horizontally and vertically. If the required
horizontal and vertical magnification factors are different, use the smaller of
the two, centering the rectangle within the window in the other dimension.

=item $otl->dest( $page, -fitb => 1 )

Display the page designated by page, with its contents magnified just
enough to fit its bounding box entirely within the window both horizontally and
vertically. If the required horizontal and vertical magnification factors are
different, use the smaller of the two, centering the bounding box within the
window in the other dimension.

=item $otl->dest( $page, -fitbh => $top )

Display the page designated by page, with the vertical coordinate top
positioned at the top edge of the window and the contents of the page magnified
just enough to fit the entire width of its bounding box within the window.

=item $otl->dest( $page, -fitbv => $left )

Display the page designated by page, with the horizontal coordinate
left positioned at the left edge of the window and the contents of the page
magnified just enough to fit the entire height of its bounding box within the
window.

=item $otl->dest( $page, -xyz => [ $left, $top, $zoom ] )

Display the page designated by page, with the coordinates (left, top) positioned
at the top-left corner of the window and the contents of the page magnified by
the factor zoom. A zero (0) value for any of the parameters left, top, or zoom
specifies that the current value of that parameter is to be retained unchanged.

=item $otl->dest( $name )

(PDF 1.2) Connect the Outline to a "Named Destination" defined elswere.

=cut

sub dest 
{
    my ($self,$page,%opts)=@_;

    if(ref $page)
    {
        $opts{-xyz}=[undef,undef,undef] if(scalar(keys %opts)<1);

        if(defined $opts{-fit}) 
        {
            $self->{Dest}=PDFArray($page,PDFName('Fit'));
        } 
        elsif(defined $opts{-fith}) 
        {
            $self->{Dest}=PDFArray($page,PDFName('FitH'),PDFNum($opts{-fith}));
        } 
        elsif(defined $opts{-fitb}) 
        {
            $self->{Dest}=PDFArray($page,PDFName('FitB'));
        } 
        elsif(defined $opts{-fitbh}) 
        {
            $self->{Dest}=PDFArray($page,PDFName('FitBH'),PDFNum($opts{-fitbh}));
        } 
        elsif(defined $opts{-fitv}) 
        {
            $self->{Dest}=PDFArray($page,PDFName('FitV'),PDFNum($opts{-fitv}));
        } 
        elsif(defined $opts{-fitbv}) 
        {
            $self->{Dest}=PDFArray($page,PDFName('FitBV'),PDFNum($opts{-fitbv}));
        } 
        elsif(defined $opts{-fitr}) 
        {
            die "insufficient parameters to ->dest( page, -fitr => [] ) " unless(scalar @{$opts{-fitr}} == 4);
            $self->{Dest}=PDFArray($page,PDFName('FitR'),map {PDFNum($_)} @{$opts{-fitr}});
        } 
        elsif(defined $opts{-xyz}) 
        {
            die "insufficient parameters to ->dest( page, -xyz => [] ) " unless(scalar @{$opts{-xyz}} == 3);
            $self->{Dest}=PDFArray($page,PDFName('XYZ'),map {defined $_ ? PDFNum($_) : PDFNull()} @{$opts{-xyz}});
        }
    }
    else
    {
        $self->{Dest}=PDFStr($page);
    }
    return($self);
}

=item $otl->url $url, %opts

Defines the outline as launch-url with url $url.

=cut

sub url {
    my ($self,$url,%opts)=@_;
    delete $self->{Dest};
    $self->{A}=PDFDict();
    $self->{A}->{S}=PDFName('URI');
    $self->{A}->{URI}=PDFStr($url);
    return($self);
}

=item $otl->file $file, %opts

Defines the outline as launch-file with filepath $file.

=cut

sub file {
    my ($self,$file,%opts)=@_;
    delete $self->{Dest};
    $self->{A}=PDFDict();
    $self->{A}->{S}=PDFName('Launch');
    $self->{A}->{F}=PDFStr($file);
    return($self);
}

=item $otl->pdfile $pdfile, $pagenum, %opts

Defines the destination of the outline as pdf-file with filepath $pdfile, $pagenum
and options %opts (same as dest).

=cut

sub pdfile {
    my ($self,$file,$pnum,%opts)=@_;
    delete $self->{Dest};
    $self->{A}=PDFDict();
    $self->{A}->{S}=PDFName('GoToR');
    $self->{A}->{F}=PDFStr($file);
    if(defined $opts{-fit}) {
        $self->{A}->{D}=PDFArray(PDFNum($pnum),PDFName('Fit'));
    } elsif(defined $opts{-fith}) {
        $self->{A}->{D}=PDFArray(PDFNum($pnum),PDFName('FitH'),PDFNum($opts{-fith}));
    } elsif(defined $opts{-fitb}) {
        $self->{A}->{D}=PDFArray(PDFNum($pnum),PDFName('FitB'));
    } elsif(defined $opts{-fitbh}) {
        $self->{A}->{D}=PDFArray(PDFNum($pnum),PDFName('FitBH'),PDFNum($opts{-fitbh}));
    } elsif(defined $opts{-fitv}) {
        $self->{A}->{D}=PDFArray(PDFNum($pnum),PDFName('FitV'),PDFNum($opts{-fitv}));
    } elsif(defined $opts{-fitbv}) {
        $self->{A}->{D}=PDFArray(PDFNum($pnum),PDFName('FitBV'),PDFNum($opts{-fitbv}));
    } elsif(defined $opts{-fitr}) {
        die "insufficient parameters to ->dest( page, -fitr => [] ) " unless(scalar @{$opts{-fitr}} == 4);
        $self->{A}->{D}=PDFArray(PDFNum($pnum),PDFName('FitR'),map {PDFNum($_)} @{$opts{-fitr}});
    } elsif(defined $opts{-xyz}) {
        die "insufficient parameters to dest( page, -xyz => [] ) " unless(scalar @{$opts{-fitr}} == 3);
        $self->{A}->{D}=PDFArray(PDFNum($pnum),PDFName('XYZ'),map {PDFNum($_)} @{$opts{-xyz}});
    }
    return($self);
}

sub out_obj {
    my ($self,@param)=@_;
    $self->fix_outline;
    return $self->SUPER::out_obj(@param);
}

sub outobjdeep {
    my ($self,@param)=@_;
    $self->fix_outline;
    foreach my $k (qw/ api apipdf apipage /) {
        $self->{" $k"}=undef;
        delete($self->{" $k"});
    }
    my @ret=$self->SUPER::outobjdeep(@param);
    foreach my $k (qw/ First Parent Next Last Prev /) {
        $self->{$k}=undef;
        delete($self->{$k});
    }
    return @ret;
}

1;

__END__

=head1 AUTHOR

alfred reibenschuh

=head1 HISTORY

    $Log: Outline.pm,v $
    Revision 2.0  2005/11/16 02:16:00  areibens
    revision workaround for SF cvs import not to screw up CPAN

    Revision 1.2  2005/11/16 01:27:48  areibens
    genesis2

    Revision 1.1  2005/11/16 01:19:24  areibens
    genesis

    Revision 1.13  2005/06/17 19:43:47  fredo
    fixed CPAN modulefile versioning (again)

    Revision 1.12  2005/06/17 18:53:33  fredo
    fixed CPAN modulefile versioning (dislikes cvs)

    Revision 1.11  2005/03/14 22:01:05  fredo
    upd 2005

    Revision 1.10  2005/01/03 00:33:32  fredo
    added named destination support

    Revision 1.9  2004/12/16 00:30:51  fredo
    added no warn for recursion

    Revision 1.8  2004/07/29 10:47:39  fredo
    fixed "null vs. 0" bug of -xyz option

    Revision 1.7  2004/06/15 09:11:38  fredo
    removed cr+lf

    Revision 1.6  2004/06/07 19:44:12  fredo
    cleaned out cr+lf for lf

    Revision 1.5  2004/03/18 06:47:57  fredo
    fixed yank/paste error in dest method with -xyz parameter

    Revision 1.4  2003/12/08 13:05:19  Administrator
    corrected to proper licencing statement

    Revision 1.3  2003/11/30 17:13:39  Administrator
    merged into default

    Revision 1.2.2.1  2003/11/30 16:56:21  Administrator
    merged into default

    Revision 1.2  2003/11/30 11:32:40  Administrator
    added CVS id/log


=cut
