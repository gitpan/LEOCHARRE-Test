use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => 'LEOCHARRE::Test',
   VERSION_FROM => 'lib/LEOCHARRE/Test.pm',


   # gen /usr/bin/pmused by Tue Oct  7 10:39:31 EDT 2008 
   PREREQ_PM => {
      'Carp'                              => '1',
      'Test::Builder::Module'             => '0.80',
   },


   EXE_FILES => [],
);


