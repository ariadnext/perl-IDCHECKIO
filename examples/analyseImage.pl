use strict;
use IDCHECKIO::Client;
use Data::Dumper;


my $object = new IDCHECKIO::Client('example@example.com', 'example');

open my $recto, '<', "/tmp/recto.jpg" or die "Unable to open file";
open my $verso, '<', "/tmp/verso.jpg" or die "Unable to open file";

my $res = $object->analyse_image($recto,$verso);

close $recto;
close $verso;

print Dumper $object->get_result($res->get_uid())->get_body();
