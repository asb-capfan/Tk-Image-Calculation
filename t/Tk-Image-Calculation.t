# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Tk-Image-Calculation.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

 use Test::More tests => 54789;
# use Test::More "no_plan";
BEGIN { use_ok('Tk::Image::Calculation') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
 ok(my $cal = Tk::Image::Calculation->new());
 isa_ok($cal, "Tk::Image::Calculation");
 can_ok($cal, "GetPointsOval");
 my @results;
 ok(($results[0], $results[1], $results[2], $results[3]) = $cal->GetPointsOval(10, 20, 50, 80));
 ok(($results[4], $results[5], $results[6], $results[7]) = $cal->GetPointsOval(10, 20, 50, 80));
 ok(ComparePoints($results[0], $results[4]));
 ok(ComparePoints($results[1], $results[5]));
 ok(CompareLines($results[2], $results[6]));
 ok(CompareLines($results[3], $results[7]));

 can_ok($cal, "GetPointsInOval");
 ok($results[0] = $cal->GetPointsInOval(11, 21, 51, 81));
 ok($results[1] = $cal->GetPointsInOval(11, 21, 51, 81));
 ok(ComparePoints($results[0], $results[1]));

 can_ok($cal, "GetPointsOutOval");
 ok($results[0] = $cal->GetPointsOutOval(12, 22, 52, 82));
 ok($results[1] = $cal->GetPointsOutOval(12, 22, 52, 82));
 ok(ComparePoints($results[0], $results[1]));

 can_ok($cal, "GetLinesInOval");
 ok($results[0] = $cal->GetLinesInOval(13, 23, 53, 83));
 ok($results[1] = $cal->GetLinesInOval(13, 23, 53, 83));
 ok(CompareLines($results[0], $results[1]));

 can_ok($cal, "GetLinesOutOval");
 ok($results[0] = $cal->GetLinesOutOval(14, 24, 54, 84));
 ok($results[1] = $cal->GetLinesOutOval(14, 24, 54, 84));
 ok(CompareLines($results[0], $results[1]));

 can_ok($cal, "GetPointsCircle");
 ok(($results[0], $results[1], $results[2], $results[3]) = $cal->GetPointsCircle(14, 24, 114, 124));
 ok(($results[4], $results[5], $results[6], $results[7]) = $cal->GetPointsCircle(14, 24, 114, 124));
 ok(ComparePoints($results[0], $results[4]));
 ok(ComparePoints($results[1], $results[5]));
 ok(CompareLines($results[2], $results[6]));
 ok(CompareLines($results[3], $results[7]));

 can_ok($cal, "GetPointsInCircle");
 ok($results[0] = $cal->GetPointsInCircle(15, 25, 115, 125));
 ok($results[1] = $cal->GetPointsInCircle(15, 25, 115, 125));
 ok(ComparePoints($results[0], $results[1]));


 can_ok($cal, "GetPointsOutCircle");
 ok($results[0] = $cal->GetPointsOutCircle(16, 26, 116, 126));
 ok($results[1] = $cal->GetPointsOutCircle(16, 26, 116, 126));
 ok(ComparePoints($results[0], $results[1]));

 can_ok($cal, "GetLinesInCircle");
 ok($results[0] = $cal->GetLinesInCircle(17, 27, 117, 127));
 ok($results[1] = $cal->GetLinesInCircle(17, 27, 117, 127));
 ok(CompareLines($results[0], $results[1]));

 can_ok($cal, "GetLinesOutCircle");
 ok($results[0] = $cal->GetLinesOutCircle(18, 28, 118, 128));
 ok($results[1] = $cal->GetLinesOutCircle(18, 28, 118, 128));
 ok(CompareLines($results[0], $results[1]));
#-------------------------------------------------
 sub ComparePoints
 	{
 	 for(my $i = 0; $i <= $#{$_[0]}; $i++)
 		{
 		cmp_ok($_[0][$i]->[0], '==', $_[1][$i]->[0], "should equal");
 		cmp_ok($_[0][$i]->[1], '==', $_[1][$i]->[1], "should equal");
 		}
 	return(1);
 	}
#-------------------------------------------------
 sub CompareLines
 	{
 	 for(my $i = 0; $i <= $#{$_[0]}; $i++)
 		{
 		cmp_ok($_[0][$i]->[0], '==', $_[1][$i]->[0], "should equal");
 		cmp_ok($_[0][$i]->[1], '==', $_[1][$i]->[1], "should equal");
		cmp_ok($_[0][$i]->[2], '==', $_[1][$i]->[2], "should equal");
 		cmp_ok($_[0][$i]->[3], '==', $_[1][$i]->[3], "should equal");
 		}
 	return(1);
 	}
#-------------------------------------------------

