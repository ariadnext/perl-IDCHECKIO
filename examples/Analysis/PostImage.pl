use lib 'lib';
use strict;
use warnings;
use Data::Dumper;
use MIME::Base64;

use IdcheckioPerl::Client::Configuration;
use IdcheckioPerl::Client::AnalysisApi;
use IdcheckioPerl::Client::Object::ImageRequest;

my $tokens = {
    username => 'exemple@exemple.com',
    password => 'exemple'
};

IdcheckioPerl::Client::Configuration::accept_tokens(tokens => $tokens);

my $apiClient = IdcheckioPerl::Client::ApiClient->instance(base_url => 'https://api.idcheck.io:443/rest');
my $api = IdcheckioPerl::Client::AnalysisApi->new( api_client => $apiClient);

my $buffer;
my $temp;
my $encoded_front_image = "";

open my $front_image, '<', "/tmp/recto.jpg" or die "Unable to open file";
seek($front_image, 0, 0);
binmode $front_image;
while ( read( $front_image, $buffer, 4194304 ) ) {
  $temp = encode_base64($buffer, "");
  $encoded_front_image = "$encoded_front_image$temp";
}
close $front_image;

my $body = IdcheckioPerl::Client::Object::ImageRequest->new(frontImage => $encoded_front_image);
my $async_mode = 'false';
my $accept_language = 'en';
my $result = $api->post_image(body => $body, async_mode => $async_mode, accept_language => $accept_language);
print Dumper($result);
