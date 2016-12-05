use lib 'lib';
use strict;
use warnings;
use Data::Dumper;

use IdcheckioPerl::Client::Configuration;
use IdcheckioPerl::Client::AnalysisApi;
use IdcheckioPerl::Client::Object::MrzRequest;

my $tokens = {
    username => 'exemple@exemple.com',
    password => 'exemple'
};

IdcheckioPerl::Client::Configuration::accept_tokens(tokens => $tokens);

my $apiClient = IdcheckioPerl::Client::ApiClient->instance(base_url => 'https://api.idcheck.io:443/rest');
my $api = IdcheckioPerl::Client::AnalysisApi->new( api_client => $apiClient);

my $body = IdcheckioPerl::Client::Object::MrzRequest->new(line1 => 'IDFRABERTHIER<<<<<<<<<<<<<<<<<<<<<<<', line2 => '9409923102854CORINNE<<<<<<<6512068F4');
my $async_mode = 'false';
my $accept_language = 'en';
my $result = $api->post_mrz(body => $body, async_mode => $async_mode, accept_language => $accept_language);
print Dumper($result);
