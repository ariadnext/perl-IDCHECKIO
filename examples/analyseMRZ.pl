use strict;
use IDCHECKIO::Client;
use Data::Dumper;

my $object = new IDCHECKIO::Client('example@exemple.com', 'example');
my $res = $object->analyse_mrz("P<UTOBANDERAS<<LILIAN<<<<<<<<<<<<<<<<<<<<<<<","01234567894UTO8001014F2501017<<<<<<<<<<<<<06");

print Dumper $object->get_result($res->get_uid())->get_body();
