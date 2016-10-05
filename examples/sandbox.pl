use strict;
use IDCHECKIO::Client;
use Data::Dumper;
use JSON::Parse 'parse_json';

my $object = new IDCHECKIO::Client('example@example.com', 'example', 'SANDBOX');

# Get server status
my $status = $object->get_credits();
print Dumper $status->get_body();

# Get number of credits
my $credits = $object->healthcheck();
print Dumper $credits->get_body();

# Test sandbox MRZ
my $listmrz = $object->get_mrzlist();
my $mrz = $object->get_mrz($listmrz->get_body()->{mrz}[0]);
my $resmrz = $object->analyze_mrz($mrz->get_body()->{mrz}->{line1}, $mrz->get_body()->{mrz}->{line2}, $mrz->get_body()->{mrz}->{line3});
print Dumper $resmrz->get_body();

# Test sandbox image
my $listimage = $object->get_imagelist();
my $image = $object->get_image($listimage->get_body()->{images}[2]->{doc});
my $resimage = $object->analyze_image($image->get_body()->{image}, '', 'False', 'True');
print Dumper $resimage->get_body();
