#!perl

#purpose: calculate statistics (Min/Max/Mean) on the Hydrogen Bonds in a structure.
#Put the reults in a Study Table.

use strict;
use warnings;
use MaterialsScript qw(:all);

#Initialize variables for the stats calculations
my $totalLength = 0;
my $minlength = 99999.9; #Arbitrary Big Num
my $maxlength = 0;
my $row = 0;

#Get all the HBonds in the UnitCell
my $hbonds = $Documents{"urea.xsd"}->UnitCell->HydrogenBonds;

#create a new study table for the results
my $statsDoc = Documents->New("HBondStats");

foreach my $hbond(@$hbonds){
  #output the bond length for each HBond
  $statsDoc->Cell($row,0) = "HBond $row";
  $statsDoc->Cell($row,1) = $hbond->Length;
  
  #Update the statistics information
  $totalLength += $hbond->Length;
  
  if($hbond->Length < minLength){
    $minLength = $hbond->Length;
  }
  elsif($hbond->Length > $maxLength){
    $maxLength = $hbond->Length;
  }
  ++$row;
}

#printout the overall statistics
$statsDoc->Cell($row, 0) = "Average";
$statsDoc->Cell($row, 1) = $totalLength/$row;
$statsDoc->Cell($row, 2) = "Min";
$statsDoc->Cell($row, 3) = $minLength;
$statsDoc->Cell($row, 4) = "Max";
$statsDoc->Cell($row, 5) = $maxLength;
