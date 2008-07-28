use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => 'LEOCHARRE::Test',
   VERSION_FROM => 'lib/LEOCHARRE/Test.pm',


   # gen /usr/bin/pmused by Mon Jul 28 16:31:34 EDT 2008 
   PREREQ_PM => {
      'Carp'                              => '1.04',
      'Exporter'                          => '5.58',
      'Test::Simple'                      => '0.74',
   },


   EXE_FILES => [],
);


