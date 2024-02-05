#!/usr/bin/perl

$report_name         = "this_test";     # create a name for this test
$restart_test        = "yes";           # this should always be "yes"
$save_baseline       = "yes";           # save a new baseline
$compare_baseline    = "yes";           # compare to existing baseline
$compare_baseline_to = "prev.baseline"; # name in baselines directory to compare

$executable = "/Users/barlage/work/models/ufs-land-driver/run/ufsLand.exe";
$parameters = "/Users/barlage/work/models/ufs-land-driver/ccpp-physics/physics/SFC_Models/Land/Noahmp/noahmptable.tbl";

$mpi_test        = "yes";

$namelist_suffix = "noregrid";

##################
## restart test ##
##################

if($restart_test eq "yes") {

  ###########################
  # clean up previous tests #
  ###########################

  system("rm workshop/6hr.test/*");
  system("rm workshop/3hr.restart/*");

  ###########################
  # run six hour simulation #
  ###########################

  system("cp $executable workshop/6hr.test") ;
  system("cp $parameters workshop/6hr.test") ;
  system("cp namelists/ufs-land.namelist.6hr.test.$namelist_suffix workshop/6hr.test/ufs-land.namelist") ;
  chdir("workshop/6hr.test") ;

  if($mpi_test eq "yes") {
    system("mpirun -np 2 ./ufsLand.exe") ;
  }else{
    system("./ufsLand.exe") ;
  }

  system("cp ufs_land_restart.2010-01-01_02-00-00.nc ../../workshop/3hr.restart") ;

  chdir("../..") ;

  #####################################
  # run three hour restart simulation #
  #####################################

  system("cp $executable workshop/3hr.restart") ;
  system("cp $parameters workshop/3hr.restart") ;
  system("cp namelists/ufs-land.namelist.3hr.restart.$namelist_suffix workshop/3hr.restart/ufs-land.namelist") ;
  chdir("workshop/3hr.restart") ;

  if($mpi_test eq "yes") {
    system("mpirun -np 2 ./ufsLand.exe") ;
  }else{
    system("./ufsLand.exe") ;
  }

  ####################################
  # create report to file and screen #
  ####################################

  chdir("../..") ;
  system("nccmp -dsSfq workshop/6hr.test/ufs_land_output.2010-01-01_06-00-00.nc workshop/3hr.restart/ufs_land_output.2010-01-01_06-00-00.nc > reports/${report_name}.restart");

  open(REPORT,"reports/${report_name}.restart");
  $line2read = readline(REPORT);
  if ($line2read =~ /identical/ ) {   
    print "+++++++++++++++++++++++++++++\n" ;
    print "++++ RESTART TEST PASSED ++++\n" ;
    print "+++++++++++++++++++++++++++++\n" ;
  } else {
    print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n" ;
    print "!!!! RESTART TEST FAILED !!!!\n" ;
    print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n" ;
  }

  ######################
  ## baseline compare ##
  ######################

  if($compare_baseline eq "yes") {

    system("nccmp -dsSfq workshop/6hr.test/ufs_land_output.2010-01-01_06-00-00.nc baselines/$compare_baseline_to/ufs_land_output.2010-01-01_06-00-00.nc > reports/${report_name}.compare_baseline.$compare_baseline_to");

    open(REPORT,"reports/${report_name}.compare_baseline.$compare_baseline_to");
    $line2read = readline(REPORT);
    if ($line2read =~ /identical/ ) {   
      print "\n" ;
      print "++++++++++++++++++++++++++++++++++++\n" ;
      print "++++ BASELINE COMPARE IDENTICAL ++++\n" ;
      print "++++++++++++++++++++++++++++++++++++\n" ;
    } else {
      print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n" ;
      print "!!!! BASELINE COMPARE DIFFERENT !!!!\n" ;
      print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n" ;
    }
      print "\n" ;

  } # end compare_baseline

  ####################################
  # mv output to baselines directory #
  ####################################

  if($save_baseline eq "yes") {

    system("mkdir baselines/$report_name");
    system("cp workshop/6hr.test/ufs_land_output.2010-01-01_06-00-00.nc baselines/$report_name");

  } # end save_baseline block

  ###########################
  # clean up previous tests #
  ###########################

  system("rm workshop/6hr.test/*");
  system("rm workshop/3hr.restart/*");

} # end restart block

