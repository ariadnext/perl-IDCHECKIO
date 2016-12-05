=begin comment

IdCheck.IO API

Check identity documents

OpenAPI spec version: 0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
package IdcheckioPerl::Client::SandboxApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use IdcheckioPerl::Client::ApiClient;
use IdcheckioPerl::Client::Configuration;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class   = shift;
    my (%self) = (
        'api_client' => IdcheckioPerl::Client::ApiClient->instance,
        @_
    );

    #my $self = {
    #    #api_client => $options->{api_client}
    #    api_client => $default_api_client
    #}; 

    bless \%self, $class;

}


#
# get_image
#
# HTTP GET image
# 
# @param string $image_uid EnumDemoDocsImage (required)
# @param string $raw_type Image raw type (optional)
# @param string $face Image face (optional)
# @param string $light Image light (optional)
{
    my $params = {
    'image_uid' => {
        data_type => 'string',
        description => 'EnumDemoDocsImage',
        required => '1',
    },
    'raw_type' => {
        data_type => 'string',
        description => 'Image raw type',
        required => '0',
    },
    'face' => {
        data_type => 'string',
        description => 'Image face',
        required => '0',
    },
    'light' => {
        data_type => 'string',
        description => 'Image light',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_image' } = { 
    	summary => 'HTTP GET image',
        params => $params,
        returns => 'ARRAY[string]',
        };
}
# @return ARRAY[string]
#
sub get_image {
    my ($self, %args) = @_;

    # verify the required parameter 'image_uid' is set
    unless (exists $args{'image_uid'}) {
      croak("Missing the required parameter 'image_uid' when calling get_image");
    }

    # parse inputs
    my $_resource_path = '/v0/sandbox/image/{imageUid}';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('*/*');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'raw_type'}) {
        $query_params->{'rawType'} = $self->{api_client}->to_query_value($args{'raw_type'});
    }

    # query params
    if ( exists $args{'face'}) {
        $query_params->{'face'} = $self->{api_client}->to_query_value($args{'face'});
    }

    # query params
    if ( exists $args{'light'}) {
        $query_params->{'light'} = $self->{api_client}->to_query_value($args{'light'});
    }

    # path params
    if ( exists $args{'image_uid'}) {
        my $_base_variable = "{" . "imageUid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'image_uid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[string]', $response);
    return $_response_object;
}

#
# get_image_list
#
# HTTP GET images list
# 
{
    my $params = {
    };
    __PACKAGE__->method_documentation->{ 'get_image_list' } = { 
    	summary => 'HTTP GET images list',
        params => $params,
        returns => 'ImageListResponse',
        };
}
# @return ImageListResponse
#
sub get_image_list {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v0/sandbox/imagelist';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json; charset=utf-8');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ImageListResponse', $response);
    return $_response_object;
}

#
# get_mrz
#
# HTTP GET mrz
# 
# @param string $mrz_uid EnumDemoDocsMrz (required)
{
    my $params = {
    'mrz_uid' => {
        data_type => 'string',
        description => 'EnumDemoDocsMrz',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_mrz' } = { 
    	summary => 'HTTP GET mrz',
        params => $params,
        returns => 'MrzResponse',
        };
}
# @return MrzResponse
#
sub get_mrz {
    my ($self, %args) = @_;

    # verify the required parameter 'mrz_uid' is set
    unless (exists $args{'mrz_uid'}) {
      croak("Missing the required parameter 'mrz_uid' when calling get_mrz");
    }

    # parse inputs
    my $_resource_path = '/v0/sandbox/mrz/{mrzUid}';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json; charset=utf-8');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # path params
    if ( exists $args{'mrz_uid'}) {
        my $_base_variable = "{" . "mrzUid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'mrz_uid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('MrzResponse', $response);
    return $_response_object;
}

#
# get_mrz_list
#
# HTTP GET mrz list
# 
{
    my $params = {
    };
    __PACKAGE__->method_documentation->{ 'get_mrz_list' } = { 
    	summary => 'HTTP GET mrz list',
        params => $params,
        returns => 'MrzListResponse',
        };
}
# @return MrzListResponse
#
sub get_mrz_list {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v0/sandbox/mrzlist';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json; charset=utf-8');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('MrzListResponse', $response);
    return $_response_object;
}

1;
