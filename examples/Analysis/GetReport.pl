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

my $accept_language = 'en';
# $uid from a resultResponse
my $report = $api->get_report(analysis_ref_uid => $uid, accept_language => $accept_language);
my $decoded = decode_base64($report->report);

open my $ofh, '>:raw', "/tmp/report.pdf" or die "Could not write: $!";
print {$ofh} $decoded;
close $ofh;
