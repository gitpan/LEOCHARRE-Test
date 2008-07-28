package LEOCHARRE::Test;

use Exporter;
use vars qw(@EXPORT @ISA $VERSION $PART_NUMBER);
use strict;
no warnings 'redefine';
@EXPORT = qw(ok_part);
$VERSION = sprintf "%d.%02d", q$Revision: 1.2 $ =~ /(\d+)/g;
@ISA = qw/Exporter/;
use Carp;



sub ok_part {
   my $msg = shift;
   $msg ||='';
   my @arg= ('PART', $PART_NUMBER++, uc($msg));
   
   carp("\n\n\n======================================\n@arg");
   return 1;
}





1;


__END__


=pod

=head1 NAME

LEOCHARRE::Test - personal testing subs

=head1 SUBS

All are exported.

=head1 ok_part()

Optional arg is message, helps read test output.
Just a separator.
