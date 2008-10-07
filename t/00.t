use lib './lib';
use LEOCHARRE::Test 'no_plan';



ok(1,'testing.. ');

ok_part('interactivity');

if( test_is_interactive() ){ ok 1,"test is interactive" }

ok_part('hey');


