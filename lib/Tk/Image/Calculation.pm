#*** Calculation.pm ***#
# Copyright (C) 2006 by Torsten Knorr
# create-soft@tiscali.de
# All rights reserved!
#-------------------------------------------------
 package Tk::Image::Calculation;
#-------------------------------------------------
 use strict;
 use warnings;
#-------------------------------------------------
 $Tk::Image::Calculation::VERSION = '0.02';
#-------------------------------------------------
 sub new
 	{
 	my ($class) = @_;
 	my $self = {};
 	bless($self, $class || ref($class));
 	return($self);
 	}
#-------------------------------------------------
 sub GetPointsOval
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my (@points_out, @points_in, @lines_out, @lines_in, $d, $pos_x_p, $pos_x_n, $y, $y1, $y2);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2);
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([], [], [], []) if(($width < 5) || ($height < 5));
 	my $a = ($width / 2);
 	my $a2  = $a**2;
 	my $b = ($height / 2);
 	my $c = ($b / $a);
 	my $pos_x = ($a + $p_x1);
 	for(my $x = 0; $x <= $a; $x++)
 		{
 		$d = int($c * sqrt($a2 - ($x**2)));
 		$y1 = ($b - $d);
 		$y2 = ($b + $d);
		$pos_x_p = int($x + $pos_x);
 		$pos_x_n = int(-$x + $pos_x);
 		push(@lines_out, [$pos_x_p, $p_y1, $pos_x_p, ($y1 + $p_y1)]);
 		push(@lines_out, [$pos_x_n, $p_y1, $pos_x_n, ($y1 + $p_y1)]);
 		for($y = 0; $y <= $y1; $y++)
 			{
			push(@points_out, [$pos_x_p, ($y + $p_y1)]);
			push(@points_out, [$pos_x_n, ($y + $p_y1)]);
 			} 
 		push(@lines_in, [$pos_x_p, ($y1 + $p_y1), $pos_x_p, ($y2 + $p_y1)]);
 		push(@lines_in, [$pos_x_n, ($y1 + $p_y1), $pos_x_n, ($y2 + $p_y1)]);
 		for($y = $y1; $y <= $y2; $y++)
 			{
 			push(@points_in, [$pos_x_p, ($y + $p_y1)]);
 			push(@points_in, [$pos_x_n, ($y + $p_y1)]);
 			}
 		push(@lines_out, [$pos_x_p, ($y2 + $p_y1), $pos_x_p, ($height + $p_y1)]);
 		push(@lines_out, [$pos_x_n, ($y2 + $p_y1), $pos_x_n, ($height + $p_y1)]);
 		for($y = $y2; $y <= $height; $y++)
 			{
 			push(@points_out, [$pos_x_p, ($y + $p_y1)]);
 			push(@points_out, [$pos_x_n, ($y + $p_y1)]);
 			}
 		}
 	return(\@points_out, \@points_in, \@lines_out, \@lines_in);
 	}
#-------------------------------------------------
 sub GetPointsInOval
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my ($d, $pos_x_p, $pos_x_n, $y, $y1, $y2);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2);
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([]) if(($width < 5) || ($height < 5));
 	my $a = ($width / 2);
 	my $a2  = ($a**2);
 	my $b = ($height / 2);
 	my $c = ($b / $a);
 	my $pos_x = ($a + $p_x1);
 	my @points_in;
 	for(my $x = 0; $x <= $a; $x++)
 		{
 		$d = int($c * sqrt($a2 - ($x**2)));
 		$y1 = ($b - $d);
 		$y2 = ($b + $d);
		$pos_x_p = int($x + $pos_x);
 		$pos_x_n = int(-$x + $pos_x);
 		for($y = $y1; $y <= $y2; $y++)
 			{
 			push(@points_in, [$pos_x_p, ($y + $p_y1)]);
 			push(@points_in, [$pos_x_n, ($y + $p_y1)]);
 			}
 		}
 	return(\@points_in);
 	}
#-------------------------------------------------
 sub GetPointsOutOval
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my ($d, $pos_x_p, $pos_x_n, $y, $y1, $y2);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2);
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([]) if(($width < 5) || ($height < 5));
 	my $a = ($width / 2);
 	my $a2  = ($a**2);
 	my $b = ($height / 2);
 	my $c = ($b / $a);
 	my $pos_x = ($a + $p_x1);
 	my @points_out;
 	for(my $x = 0; $x <= $a; $x++)
 		{
 		$d = int($c * sqrt($a2 - ($x**2)));
 		$y1 = ($b - $d);
 		$y2 = ($b + $d);
		$pos_x_p = int($x + $pos_x);
 		$pos_x_n = int(-$x + $pos_x);
 		for($y = 0; $y <= $y1; $y++)
 			{
			push(@points_out, [$pos_x_p, ($y + $p_y1)]);
			push(@points_out, [$pos_x_n, ($y + $p_y1)]);
 			} 
 		for($y = $y2; $y <= $height; $y++)
 			{
 			push(@points_out, [$pos_x_p, ($y + $p_y1)]);
 			push(@points_out, [$pos_x_n, ($y + $p_y1)]);
 			}
 		}
 	return(\@points_out);
 	}
#-------------------------------------------------
 sub GetLinesInOval
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my ($d, $pos_x_p, $pos_x_n, $y, $y1, $y2);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2);
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([]) if(($width < 5) || ($height < 5));
 	my $a = ($width / 2);
 	my $a2  = ($a**2);
 	my $b = ($height / 2);
 	my $c = ($b / $a);
 	my $pos_x = ($a + $p_x1);
 	my @lines_in;
 	for(my $x = 0; $x <= $a; $x++)
 		{
 		$d = int($c * sqrt($a2 - ($x**2)));
 		$y1 = ($b - $d);
 		$y2 = ($b + $d);
		$pos_x_p = int($x + $pos_x);
 		$pos_x_n = int(-$x + $pos_x);
 		push(@lines_in, [$pos_x_p, ($y1 + $p_y1), $pos_x_p, ($y2 + $p_y1)]);
 		push(@lines_in, [$pos_x_n, ($y1 + $p_y1), $pos_x_n, ($y2 + $p_y1)]);
 		}
 	return(\@lines_in);
 	}
#-------------------------------------------------
 sub GetLinesOutOval
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my ($d, $pos_x_p, $pos_x_n, $y, $y1, $y2);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2);
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([]) if(($width < 5) || ($height < 5));
 	my $a = ($width / 2);
 	my $a2  = ($a**2);
 	my $b = ($height / 2);
 	my $c = ($b / $a);
 	my $pos_x = ($a + $p_x1);
 	my @lines_out;
 	for(my $x = 0; $x <= $a; $x++)
 		{
 		$d = int($c * sqrt($a2 - ($x**2)));
 		$y1 = ($b - $d);
 		$y2 = ($b + $d);
		$pos_x_p = int($x + $pos_x);
 		$pos_x_n = int(-$x + $pos_x);
 		push(@lines_out, [$pos_x_p, $p_y1, $pos_x_p, ($y1 + $p_y1)]);
 		push(@lines_out, [$pos_x_n, $p_y1, $pos_x_n, ($y1 + $p_y1)]); 
 		push(@lines_out, [$pos_x_p, ($y2 + $p_y1), $pos_x_p, ($height + $p_y1)]);
 		push(@lines_out, [$pos_x_n, ($y2 + $p_y1), $pos_x_n, ($height + $p_y1)]);
 		}
 	return(\@lines_out);
 	}
#-------------------------------------------------
 sub GetPointsCircle
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my (@points_out, @points_in, @lines_out, @lines_in, $x2py2, $pos_x, $pos_y, $diff_y);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2); 
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([], [], [], []) if(($width < 5) || ($height < 5));
 	my $r = int($width / 2);
 	my $r2 = ($r**2);  
 	my $coord_x = ($p_x1 + $r);
 	my $coord_y = ($p_y1 + $r);
 	for(my $i_x = -$r; $i_x <= $r; $i_x++)
 		{
 		$pos_x = ($coord_x + $i_x);
 		$diff_y = sqrt($r2 - ($i_x**2));
 		push(@lines_out, [$pos_x, $p_y1, $pos_x, ($coord_y - $diff_y)]);
 		push(@lines_out, [$pos_x, ($coord_y + $diff_y), $pos_x, $p_y2]);
 		push(@lines_in, [$pos_x, ($coord_y - $diff_y), $pos_x, ($coord_y + $diff_y)]);
 		for(my $i_y = $r; $i_y >= -$r; $i_y--)
 			{
 			$pos_y = ($coord_y + $i_y);
 			$x2py2 = (($i_x**2) + ($i_y**2));
 			if($x2py2 < $r2)
 				{
 				push(@points_in, [$pos_x, $pos_y]);
 				}
 			elsif($x2py2 > $r2)
 				{
 				push(@points_out, [$pos_x, $pos_y]);
 				}
 			} 
 		}
 	return(\@points_out, \@points_in, \@lines_out, \@lines_in);
 	}
#-------------------------------------------------
 sub GetPointsInCircle
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my ($x2py2, $pos_x, $pos_y);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2); 
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([]) if(($width < 5) || ($height < 5));
 	my $r = int($width / 2);
 	my $r2 = ($r**2);  
 	my $coord_x = ($p_x1 + $r);
 	my $coord_y = ($p_y1 + $r);
 	my @points_in;
 	for(my $i_x = -$r; $i_x <= $r; $i_x++)
 		{
 		$pos_x = ($coord_x + $i_x);
 		for(my $i_y = $r; $i_y >= -$r; $i_y--)
 			{
 			$pos_y = ($coord_y + $i_y);
 			$x2py2 = (($i_x**2) + ($i_y**2));
 			if($x2py2 < $r2)
 				{
 				push(@points_in, [$pos_x, $pos_y]);
 				} 			} 
 		}
 	return(\@points_in);
 	}
#-------------------------------------------------
 sub GetPointsOutCircle
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my ($x2py2, $pos_x, $pos_y);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2); 
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([]) if(($width < 5) || ($height < 5));
 	my $r = int($width / 2);
 	my $r2 = ($r**2);  
 	my $coord_x = ($p_x1 + $r);
 	my $coord_y = ($p_y1 + $r);
 	my @points_out;
 	for(my $i_x = -$r; $i_x <= $r; $i_x++)
 		{
 		$pos_x = ($coord_x + $i_x);
 		for(my $i_y = $r; $i_y >= -$r; $i_y--)
 			{
 			$pos_y = ($coord_y + $i_y);
 			$x2py2 = (($i_x**2) + ($i_y**2));
 			if($x2py2 > $r2)
 				{
 				push(@points_out, [$pos_x, $pos_y]);
 				}
 			} 
 		}
 	return(\@points_out);
 	}
#-------------------------------------------------
 sub GetLinesInCircle
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my ($x2py2, $pos_x, $pos_y, $diff_y);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2); 
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([]) if(($width < 5) || ($height < 5));
 	my $r = int($width / 2);
 	my $r2 = ($r**2);  
 	my $coord_x = ($p_x1 + $r);
 	my $coord_y = ($p_y1 + $r);
 	my @lines_in;
 	for(my $i_x = -$r; $i_x <= $r; $i_x++)
 		{
 		$pos_x = ($coord_x + $i_x);
 		$diff_y = sqrt($r2 - ($i_x**2));
 		push(@lines_in, [$pos_x, ($coord_y - $diff_y), $pos_x, ($coord_y + $diff_y)]);
 		}
 	return(\@lines_in);
 	}
#-------------------------------------------------
 sub GetLinesOutCircle
 	{
 	my ($self, $p_x1, $p_y1, $p_x2, $p_y2) = @_;
 	my ($x2py2, $pos_x, $pos_y, $diff_y);
 	($p_x1, $p_x2) = ($p_x2, $p_x1) if($p_x1 > $p_x2); 
 	($p_y1, $p_y2) = ($p_y2, $p_y1) if($p_y1 > $p_y2);
 	my $width = ($p_x2 - $p_x1);
 	my $height= ($p_y2 - $p_y1);
 	return([]) if(($width < 5) || ($height < 5));
 	my $r = int($width / 2);
 	my $r2 = ($r**2);  
 	my $coord_x = ($p_x1 + $r);
 	my $coord_y = ($p_y1 + $r);
 	my @lines_out;
 	for(my $i_x = -$r; $i_x <= $r; $i_x++)
 		{
 		$pos_x = ($coord_x + $i_x);
 		$diff_y = sqrt($r2 - ($i_x**2));
 		push(@lines_out, [$pos_x, $p_y1, $pos_x, ($coord_y - $diff_y)]);
 		push(@lines_out, [$pos_x, ($coord_y + $diff_y), $pos_x, $p_y2]);
 		}
 	return(\@lines_out)
 	}
#-------------------------------------------------
1;
#-------------------------------------------------
__END__

=head1 NAME

Tk::Image::Calculation - Perl extension for graphic calculations

=head1 SYNOPSIS

 use Tk::Image::Calculation;
 my $cal = Tk::Image::Calculation->new();	
 my $ref_array_points = $cal->GetPointsInOval(10, 20, 110, 210); 
 for(@{$ref_array_points})
 	{
 	print("x : $_->[0]		y : $y_->[1]\n");
 	}
 my $ref_array_lines = $cal->GetLinesInOval(10, 20, 110, 210);
 for(@{$ref_array_lines})
 	{
 	print("x1 : $_->[0]	y1 : $_->[1]	x2 : $_->[2]	y2 : $_->[3]\n");
 	}

=head1 DESCRIPTION

 This module calculates points and lines inside or outside from simple graphic objects.

=head1 CONSTRUCTOR

 my $object = Tk::Image::Calculation->new();

=head1 FUNCTIONS

 Two points are handed over to the functions for Oval and Circle. 
 In the following form ($x1, $y1, $x2, $y2).
 The first point to the left up and the second point to the right below of a thought rectangle,
 in that the graphic object does fitting.
 The returned values are array references of points or lines.
 Points [x, y]
 Lines [x1, y1, x2, y2]

=item GetPointsOval

 Takes over two points as parameters.
 Returns four array references in the following sequence.
 ($ref_points_outside, $ref_points_inside, $ref_lines_outside, $ref_lines_inside) 

=item GetPointsInOval, GetPointsOutOval, GetLinesInOval, GetLinesOutOval

 Takes over two points as parameters.
 Returns a array reference of Points or Lines inside or outside of the Oval. 

=item GetPointsCircle

 Just the same as GetPointsOval.

=item GetPointsInCircle, GetPointsOutCircle, GetLinesInCircle, GetLinesOutCircle

 Takes over two points as parameters.
 Returns a array reference of Points or Lines inside or outside of the Circle. 

=head2 EXPORT

None by default.

=head1 SEE ALSO

 Tk::Image::Cut
 http://www.planet-interkom.de/t.knorr/index.html

=head1 KEYWORDS

 graphic, calculation 

=head1 	BUGS

 Maybe you'll find some. Please let me know.

=head1 AUTHOR

Torsten Knorr, E<lt>torstenknorr@tiscali.deE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2006 by Torsten Knorr

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.9.2 or,
at your option, any later version of Perl 5 you may have available.


=cut




