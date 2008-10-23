package LEOCHARRE::Test;
use strict 'vars';
use Test::Builder::Module;
use vars qw(@EXPORT @ISA $VERSION $PART_NUMBER);
@EXPORT = qw(ok_part ok test_is_interactive ok_mysqld);
$VERSION = sprintf "%d.%02d", q$Revision: 1.9 $ =~ /(\d+)/g;
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

sub ok_mysqld {
   my $host = shift;
   $host ||= 'localhost';


   if ( $host eq 'localhost' ){
      my $daemon ='/etc/init.d/mysqld';
      if (-e $daemon ){
         my $response = `$daemon status`;
         return ok( $response!~/stopped/, "mysqld daemon on host '$host' $daemon is running?");
      }
   }

   require DBI;
   require DBD::mysql;

   # make a bogus connect on purpose
   my $user = 'a'.time().( int rand(20) );
   my $pass = 'b'.time().( int rand(20) );
   my $name = 'c'.time().( int rand(20) );

   my $h = "DBI:mysql:database=$name;host=$host";
   
   my $dbh = DBI->connect($h, $user, $pass,{ RaiseError => 0, PrintError => 0});
   my $err = $DBI::errstr;

   my $result;

   if($err=~/Unknown MySQL server host|Can\'t connect to local MySQL server/i){
      $result = 0;;
   }
   elsif ( $err=~/Access denied for user/i ){
      $result = 1;
   }
   else {
      warn("dont know how to interpret this error: '$err'");
      $result = 0;
   }

   return ok($result, "[$result] mysql host '$host' is up ? " . ($result ? 'yes' : "no. 
   Check your /etc/init.d/mysqld status or equivalent."));





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

=head2 ok_mysqld()

Argument is hostname.
Tests if a mysqld host server is up.



