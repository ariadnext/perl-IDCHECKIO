use strict;
use warnings;
 
use ExtUtils::MakeMaker;
WriteMakefile
(
  NAME         => 'idcheckio',
  VERSION_FROM => 'lib/IDCheckIO.pm',
  BUILD_REQUIRES => {
    'REST::Client'     => '273',
    'JSON::Parse'      => '0.39',
    'Cpanel::JSON::XS' => '3.0211'
  },
);
