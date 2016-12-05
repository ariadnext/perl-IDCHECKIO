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

my $raw_type = 'BASE64';
my $face = 'RECTO';
my $light = 'DL';
# $image_uid from a get_image_list response
my $result = $api->get_image(image_uid => $image_uid, raw_type => $raw_type, face => $face, light => $light);
print Dumper($result);
