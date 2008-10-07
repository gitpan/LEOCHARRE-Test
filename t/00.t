use lib './lib';
use LEOCHARRE::Test 'no_plan';



ok(1,'testing.. ');

ok_part('interactivity');

if( test_is_interactive() ){ ok 1,"test is interactive" }
else { ok 1, "skipping ok_mysqld() test etc, non interactive." }

ok_part('hey');

ok_mysqld('localhost');

#ok( ! eval ok_mysqld('localhostess') );
