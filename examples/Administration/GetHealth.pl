use lib 'lib';
use strict;
use warnings;
use Data::Dumper;

use IdcheckioPerl::Client::AdministrationApi;

my $apiClient = IdcheckioPerl::Client::ApiClient->instance(base_url => 'https://api.idcheck.io:443/rest');
my $api = IdcheckioPerl::Client::AdministrationApi->new( api_client => $apiClient);

my $result = $api->get_health();
print Dumper($result->status);
