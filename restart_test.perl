#!/usr/bin/perl

@nums = ("00","01","02","03","04","05","06","07","08","09",
         "10","11","12","13","14","15","16","17","18","19",
         "20","21","22","23","24","25","26","27","28","29",
         "30","31","32","33","34","35","36","37","38","39");

$restart_test    = "yes";
$save_output     = "no";   # only done if restart_test is done
$compare_output  = "no";   # not doing anything yet

$mpi_test        = "yes";

$report_name = "test";
$compare_baseline = "main";

$executable = "/path/ufs-land-driver/run/ufsLand.exe";

$namelist_suffix = "regrid.cdas";

if($restart_test eq "yes") {

# clean up previous tests
  system("rm workshop/6hr.test/*");
  system("rm workshop/3hr.restart/*");

# run six hour simulation
  system("cp $executable workshop/6hr.test") ;
  system("cp namelists/ufs-land.namelist.6hr.test.$namelist_suffix workshop/6hr.test/ufs-land.namelist") ;
  chdir("workshop/6hr.test") ;
  if($mpi_test eq "yes") {
    system("mpirun -np 2 ./ufsLand.exe") ;
  }{
    system("./ufsLand.exe") ;
  }
  system("cp ufs_land_restart.2011-01-01_02-00-00.nc ../../workshop/3hr.restart") ;

  chdir("../..") ;

# run three hour restart simulation
  system("cp $executable workshop/3hr.restart") ;
  system("cp namelists/ufs-land.namelist.3hr.restart.$namelist_suffix workshop/3hr.restart/ufs-land.namelist") ;
  chdir("workshop/3hr.restart") ;
  if($mpi_test eq "yes") {
    system("mpirun -np 2 ./ufsLand.exe") ;
  }{
    system("./ufsLand.exe") ;
  }


# create report to file and screen
  chdir("../..") ;
  system("nccmp -dsSfq workshop/6hr.test/ufs_land_output.2011-01-01_06-00-00.nc workshop/3hr.restart/ufs_land_output.2011-01-01_06-00-00.nc > reports/$report_name");

  open(REPORT,"reports/$report_name");
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

  if($save_output eq "yes") {

# mv output to baselines directory
    system("mkdir baselines/$report_name");
    system("cp workshop/6hr.test/* baselines/$report_name");

  } # end save_output block

# clean up previous tests
  system("rm workshop/6hr.test/*");
  system("rm workshop/3hr.restart/*");

} # end restart block

