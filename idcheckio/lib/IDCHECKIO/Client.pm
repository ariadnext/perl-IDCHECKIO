package IDCHECKIO::Client;

#use strict;
use REST::Client;
use MIME::Base64;
use Cpanel::JSON::XS qw(encode_json);
use IDCHECKIO::ResponseIDCIO;
use JSON::Parse 'parse_json';

=head1 NAME

IDCHECKIO::Client - Client to use the IDCHECKIO API easily

=head1 SYNOPSIS

To complete

=head1 DESCRIPTION

...

=cut


our $VERSION = '0.04';

sub new {
  my $class = shift;
  my $self = {
    _user      => shift,
    _pwd       => shift,
    _mode      => shift,
    _language  => shift,
    _host      => shift,
    _protocol  => shift,
    _port      => shift,
    _verify    => shift,
  };
  $self->{_language} = "en" if !defined($self->{_language});
  $self->{_mode} = "PROD" if !defined($self->{_mode});
  $self->{_protocol} = "https" if !defined($self->{_protocol});
  $self->{_port} = "443" if !defined($self->{_port});
  $self->{_verify} = "True" if !defined($self->{_verify});
  if ($self->{_verify} == "False") {
    $ENV{PERL_LWP_SSL_VERIFY_HOSTNAME}=0;
  }
  if ($self->{_mode} eq "SANDBOX") {
    $self->{_host} = "sandbox.idcheck.io" if !defined($self->{_host});
  } elsif ($self->{_mode} eq "TEST") {
    $self->{_host} = "api-test.idcheck.io" if !defined($self->{_host});
  } else {
    $self->{_host} = "api.idcheck.io" if !defined($self->{_host});
  }

  $self->{_client} = REST::Client->new();
  $self->{_client}->setHost("$self->{_protocol}://$self->{_host}:$self->{_port}");
  if ($self->{_verify} == "False") {
    $self->{_client}->getUseragent()->ssl_opts(verify_hostname => 0);
    $self->{_client}->getUseragent()->ssl_opts(SSL_verify_mode => 0);
  }
  $self->{_client}->addHeader("Content-Type", "application/json");
  $self->{_client}->addHeader("Authorization", "");

  my $auth = encode_base64("$self->{_user}:$self->{_pwd}");
  $self->{_client}->addHeader("Content-Type", "application/json");
  $self->{_client}->addHeader("Authorization", "Basic $auth");
  $self->{_client}->addHeader("Accept-Language", "$self->{_language}");

  bless $self, $class;
  return $self;
}

################################################################################
############################### ANALYSIS METHOD ################################
################################################################################

sub analyze_mrz {
  my ( $self, $line1, $line2, $line3, $async ) = @_;
  $async = "False" if !defined($async);
  $line3 = "" if !defined($line3);

  my $method = "/rest/v0/task/mrz";
  my $arguments = "?async=$async";
  my $url = "$method$arguments";

  my $data = {
    'line1' => $line1,
    'line2' => $line2,
    'line3' => $line3,
  };
  my $json_data = encode_json $data;

  my $result;
  $self->{_client}->POST($url, $json_data);
  my $json = parse_json($self->{_client}->responseContent());
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}


sub analyze_image {
  my ( $self, $recto, $verso, $async, $base64 ) = @_;
  $async = "False" if !defined($async);
  $verso = "" if !defined($verso);
  $base64 = "False" if !defined($async);

  my $method = "/rest/v0/task/image";
  my $arguments = "?async=$async";
  my $url = "$method$arguments";

  my ( $frontImage, $backImage ) = ( "", "" );

  my $buffer;
  my $temp;
  my $encoded_recto = "";
  my $encoded_verso = "";
  if ( $base64 ){
    $encoded_recto = $recto;
    $encoded_verso = $verso;
  } else {
    seek($recto, 0, 0);
    binmode $recto;
    while ( read( $recto, $buffer, 4194304 ) ) {
    #while ( read( INFILE, $buffer, 4096 ) ) {
      $temp = encode_base64($buffer, "");
      $encoded_recto = "$encoded_recto$temp";
    }
    if ( $verso != "" ){
      #open INFILE, '<', $verso or die "Unable to open file $verso";
      #binmode INFILE;
      seek($verso, 0, 0);
      binmode $verso;
      #while ( read( INFILE, $buffer, 4096 ) ) {
      while ( read( $verso, $buffer, 4194304 ) ) {
        $temp = encode_base64($buffer, "");
        $encoded_verso = "$encoded_verso$temp";
      }
    }
  }
  my $data = {
    'frontImage' => $encoded_recto,
    'backImage'  => $encoded_verso,
  };
  my $json_data = encode_json $data;
  my $result;
  $self->{_client}->POST($url, $json_data);

  my $json = parse_json($self->{_client}->responseContent());
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}


sub get_result {
  my ( $self, $uid, $rectoImageCropped, $faceImageCropped, $signatureImageCropped ) = @_;
  $rectoImageCropped = "False" if !defined($rectoImageCropped);
  $faceImageCropped = "False" if !defined($faceImageCropped);
  $signatureImageCropped = "False" if !defined($signatureImageCropped);

  my $method = "/rest/v0/result/";
  my $arguments = "?rectoImageCropped=$rectoImageCropped&faceImageCropped=$faceImageCropped&signatureImageCropped=$signatureImageCropped";
  my $url = "$method$uid/$arguments";

  my $result;
  $self->{_client}->GET($url);
  my $json = parse_json($self->{_client}->responseContent());
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

sub get_report {
  my ( $self, $uid, $path ) = @_;
  $path = "" if !defined($path);

  my $method = "/rest/v0/pdfreport/";
  my $arguments = "";
  my $url = "$method$uid$arguments";

  my $result;
  $self->{_client}->GET($url);
  my $json = parse_json($self->{_client}->responseContent());
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

sub get_status {
  my ( $self, $uid, $wait ) = @_;
  $wait = 0 if !defined($wait);

  my $method = "/rest/v0/task/";
  my $arguments = "?wait=$wait";
  my $url = "$method$uid/$arguments";

  my $result;
  $self->{_client}->GET($url);
  my $json = parse_json($self->{_client}->responseContent());
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

################################################################################
############################ ADMINISTRATION METHOD #############################
################################################################################

sub healthcheck {
  my ( $self ) = @_;

  my $method = "/rest/v0/admin/health";
  my $url = "$method";

  my $result;
  $self->{_client}->GET($url);
  my $json = parse_json($self->{_client}->responseContent());
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

sub get_credits {
  my ( $self ) = @_;

  my $method = "/rest/v0/admin/user";
  my $url = "$method";

  my $result;
  $self->{_client}->GET($url);
  my $json = parse_json($self->{_client}->responseContent());
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

################################################################################
################################ SANDBOX METHOD ################################
################################################################################

sub get_mrzlist {
  my ( $self ) = @_;

  my $method = "/rest/v0/sandbox/mrzlist";
  my $url = "$method";

  my $result;
  $self->{_client}->GET($url);

  if( $self->{_client}->responseCode() eq '200' ){
    my $json = parse_json($self->{_client}->responseContent());
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  elsif($self->{_client}->responseCode() eq '404'){
    my $json = {"errorMessage" => "Not supported method"};
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  else {
    my $json = parse_json($self->{_client}->responseContent());
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

sub get_imagelist {
  my ( $self ) = @_;

  my $method = "/rest/v0/sandbox/imagelist";
  my $url = "$method";

  my $result;
  $self->{_client}->GET($url);
  if( $self->{_client}->responseCode() eq '200' ){
    my $json = parse_json($self->{_client}->responseContent());
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  elsif($self->{_client}->responseCode() eq '404'){
    my $json = {"errorMessage" => "Not supported method"};
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  else {
    my $json = parse_json($self->{_client}->responseContent());
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

sub get_mrz {
  my ( $self, $mrzUid ) = @_;
  $mrzUid = "" if !defined($mrzUid);

  my $method = "/rest/v0/sandbox/mrz/";
  my $arguments = "";
  my $url = "$method$mrzUid";

  my $result;
  $self->{_client}->GET($url);
  my $json = parse_json($self->{_client}->responseContent());
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  elsif($self->{_client}->responseCode() eq '404'){
    my $json = {"errorMessage" => "Not supported method"};
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

sub get_image {
  my ( $self, $imageUid, $rawType, $face, $light ) = @_;
  $imageUid = "" if !defined($imageUid);
  $rawType = "BASE64" if !defined($rawType);
  $face = "RECTO" if !defined($face);
  $light = "DL" if !defined($light);

  my $method = "/rest/v0/sandbox/image/";
  my $arguments = "?rawType=$rawType&face=$face&light=$light";
  my $url = "$method$imageUid$arguments";

  my $result;
  $self->{_client}->GET($url);
  my $json = {'image' => $self->{_client}->responseContent()};
  if( $self->{_client}->responseCode() eq '200' ){
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), $json->{uid}, $json);
  }
  elsif($self->{_client}->responseCode() eq '404'){
    my $json = {"errorMessage" => "Not supported method"};
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  else {
    $result = IDCHECKIO::ResponseIDCIO->new($self->{_client}->responseCode(), 0, $json);
  }
  return $result;
}

1;
