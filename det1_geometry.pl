use strict;
our %detector;
our %configuration;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'det1';

my $offset=70.9;

my $offset_inner=40.3;

sub det1
{
det1_dipolebig_fieldbox();
det1_plane();
}

sub det1_dipolebig_fieldbox
{
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_dipolebig_fieldbox";
    $detector{"mother"}      = "$DetectorMother" ;
    $detector{"description"} = "$DetectorName\_dipolebig_fieldbox";
    $detector{"pos"}        = "0*cm 0*cm 450*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";   
    $detector{"color"}      = "000000";
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "0*cm 300*cm 150*cm 0*deg 360*deg";
    $detector{"material"}   = "G4_Galactic";
    $detector{"mfield"}     = "det1_dipolebig_simple";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 0;
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
    $detector{"identifiers"} = "no";
    print_det(\%configuration, \%detector);
}


sub det1_plane
{
 my $NUM  = 3;
 my @z    = (200,350,450);
 my @Rin  = (10,10,10);
 my @Rout = (55,60,90);
 my @Dz   = (0.001,0.001,0.001);
 my @name = ("plane1","plane2","plane3"); 
 my @mother = ("$DetectorMother","$DetectorMother","$DetectorMother"); 
 my @mat  = ("G4_Galactic","G4_Galactic","G4_Galactic");
 my @rot  = (0,0,0);
 my @x    = (0,0,0);
 
 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";   
    $detector{"color"}      = "000000";
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
    $detector{"material"}   = $mat[$n-1];
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "flux";
    $detector{"hit_type"}    = "flux";
    $detector{"identifiers"} = "id manual $n";
    print_det(\%configuration, \%detector);
 }
}
