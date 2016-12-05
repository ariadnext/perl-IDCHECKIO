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


my $recto_image_cropped = 'false';
my $face_image_cropped = 'false';
my $signature_image_cropped = 'false';
my $accept_language = 'en';
# $uid from a resultResponse
my $result2 = $api->get_result(analysis_ref_uid => $uid, accept_language => $accept_language, recto_image_cropped => $recto_image_cropped, face_image_cropped => $face_image_cropped, signature_image_cropped => $signature_image_cropped);
print Dumper($result);
