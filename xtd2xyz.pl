#!perl

use strict;
use warnings;
use MaterialsScript qw(:all);

#Convert the format of the trajectory file from xtd to xyz format

my $doc=$Documents{"test.xtd"};
my $n=1494;  #the number for the system; you can edit this
my $atoms=$doc->UnitCell->Atoms;
my $atom=undef;
my $numFrames=$doc->Trajectory->NumFrames;
for (my $counter=1; $counter<=$numberFrames; ++$counter){
  $doc->Trajectory->CurrentFrame=$counter;
  printf "%f\n",$n;
  print "number        ";
  printf"%f\n",$counter;
  foreach $atom(@$atoms){
    printf "%s %f %f %f\n", $atom->ElementSymbol, $atom->X, $atom->Y, $atom->Z;
  }
}
