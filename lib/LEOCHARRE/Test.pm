package LEOCHARRE::Test;
use strict 'vars';
use Test::Builder::Module;
use vars qw(@EXPORT @ISA $VERSION $PART_NUMBER);
@EXPORT = qw(ok_part ok test_is_interactive);
$VERSION = sprintf "%d.%02d", q$Revision: 1.3 $ =~ /(\d+)/g;
@ISA    = qw(Test::Builder::Module);
use Carp;


my $CLASS = __PACKAGE__;

sub ok ($;$) {
    $CLASS->builder->ok(@_);
}
sub ok_part {
   my $msg = shift;
   $msg ||='';
   my @arg= ('PART', $PART_NUMBER++, uc($msg));
   
   carp("\n\n\n======================================\n@arg");
   return 1;
}


sub test_is_interactive { 
   return -t STDIN && -t STDOUT;
}



1;


__END__


=pod

=head1 NAME

LEOCHARRE::Test - personal testing subs

=head1 SUBS

All are exported.

=head2 ok()

Like Test::Simple

=head2 ok_part()

Optional arg is message, helps read test output.
Just a separator.

=head2 test_is_interactive()

Returns boolean. If run from a terminal, returns true, if from cpan, false.



