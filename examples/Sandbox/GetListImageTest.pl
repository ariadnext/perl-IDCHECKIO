use lib 'lib';
use strict;
use warnings;
use Data::Dumper;

use IdcheckioPerl::Client::Configuration;
use IdcheckioPerl::Client::SandboxApi;

my $tokens = {
    username => 'exemple@exemple.com',
    password => 'exemple'
};

IdcheckioPerl::Client::Configuration::accept_tokens(tokens => $tokens);

my $apiClient = IdcheckioPerl::Client::ApiClient->instance(base_url => 'https://api.idcheck.io:443/rest');
my $api = IdcheckioPerl::Client::SandboxApi->new( api_client => $apiClient);

my $result = $api->get_image_list();
print Dumper($result);
