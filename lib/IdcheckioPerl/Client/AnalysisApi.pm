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
package IdcheckioPerl::Client::AnalysisApi;

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
# get_report
#
# HTTP GET report (demo)
# 
# @param string $analysis_ref_uid Report analysisRefUid (required)
# @param string $accept_language Accept language header (optional)
{
    my $params = {
    'analysis_ref_uid' => {
        data_type => 'string',
        description => 'Report analysisRefUid',
        required => '1',
    },
    'accept_language' => {
        data_type => 'string',
        description => 'Accept language header',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_report' } = { 
    	summary => 'HTTP GET report (demo)',
        params => $params,
        returns => 'ReportResponse',
        };
}
# @return ReportResponse
#
sub get_report {
    my ($self, %args) = @_;

    # verify the required parameter 'analysis_ref_uid' is set
    unless (exists $args{'analysis_ref_uid'}) {
      croak("Missing the required parameter 'analysis_ref_uid' when calling get_report");
    }

    # parse inputs
    my $_resource_path = '/v0/pdfreport/{analysisRefUid}';
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

    # header params
    if ( exists $args{'accept_language'}) {
        $header_params->{'Accept-Language'} = $self->{api_client}->to_header_value($args{'accept_language'});
    }

    # path params
    if ( exists $args{'analysis_ref_uid'}) {
        my $_base_variable = "{" . "analysisRefUid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'analysis_ref_uid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(basic )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ReportResponse', $response);
    return $_response_object;
}

#
# get_result
#
# HTTP GET result
# 
# @param string $analysis_ref_uid Result analysisRefUid (required)
# @param string $accept_language Accept language header (optional)
# @param boolean $recto_image_cropped True to obtain recto image cropped if applicable (optional, default to false)
# @param boolean $face_image_cropped True to obtain face image cropped if applicable (optional, default to false)
# @param boolean $signature_image_cropped True to obtain signature image cropped if applicable (optional, default to false)
{
    my $params = {
    'analysis_ref_uid' => {
        data_type => 'string',
        description => 'Result analysisRefUid',
        required => '1',
    },
    'accept_language' => {
        data_type => 'string',
        description => 'Accept language header',
        required => '0',
    },
    'recto_image_cropped' => {
        data_type => 'boolean',
        description => 'True to obtain recto image cropped if applicable',
        required => '0',
    },
    'face_image_cropped' => {
        data_type => 'boolean',
        description => 'True to obtain face image cropped if applicable',
        required => '0',
    },
    'signature_image_cropped' => {
        data_type => 'boolean',
        description => 'True to obtain signature image cropped if applicable',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_result' } = { 
    	summary => 'HTTP GET result',
        params => $params,
        returns => 'ResultResponse',
        };
}
# @return ResultResponse
#
sub get_result {
    my ($self, %args) = @_;

    # verify the required parameter 'analysis_ref_uid' is set
    unless (exists $args{'analysis_ref_uid'}) {
      croak("Missing the required parameter 'analysis_ref_uid' when calling get_result");
    }

    # parse inputs
    my $_resource_path = '/v0/result/{analysisRefUid}';
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

    # query params
    if ( exists $args{'recto_image_cropped'}) {
        $query_params->{'rectoImageCropped'} = $self->{api_client}->to_query_value($args{'recto_image_cropped'});
    }

    # query params
    if ( exists $args{'face_image_cropped'}) {
        $query_params->{'faceImageCropped'} = $self->{api_client}->to_query_value($args{'face_image_cropped'});
    }

    # query params
    if ( exists $args{'signature_image_cropped'}) {
        $query_params->{'signatureImageCropped'} = $self->{api_client}->to_query_value($args{'signature_image_cropped'});
    }

    # header params
    if ( exists $args{'accept_language'}) {
        $header_params->{'Accept-Language'} = $self->{api_client}->to_header_value($args{'accept_language'});
    }

    # path params
    if ( exists $args{'analysis_ref_uid'}) {
        my $_base_variable = "{" . "analysisRefUid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'analysis_ref_uid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(basic )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ResultResponse', $response);
    return $_response_object;
}

#
# get_task
#
# HTTP GET task
# 
# @param string $analysis_ref_uid Task analysisRefUid (required)
# @param string $accept_language Accept language header (optional)
# @param int $wait specify a maximum wait time in milliseconds (optional)
{
    my $params = {
    'analysis_ref_uid' => {
        data_type => 'string',
        description => 'Task analysisRefUid',
        required => '1',
    },
    'accept_language' => {
        data_type => 'string',
        description => 'Accept language header',
        required => '0',
    },
    'wait' => {
        data_type => 'int',
        description => 'specify a maximum wait time in milliseconds',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_task' } = { 
    	summary => 'HTTP GET task',
        params => $params,
        returns => 'TaskResponse',
        };
}
# @return TaskResponse
#
sub get_task {
    my ($self, %args) = @_;

    # verify the required parameter 'analysis_ref_uid' is set
    unless (exists $args{'analysis_ref_uid'}) {
      croak("Missing the required parameter 'analysis_ref_uid' when calling get_task");
    }

    # parse inputs
    my $_resource_path = '/v0/task/{analysisRefUid}';
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

    # query params
    if ( exists $args{'wait'}) {
        $query_params->{'wait'} = $self->{api_client}->to_query_value($args{'wait'});
    }

    # header params
    if ( exists $args{'accept_language'}) {
        $header_params->{'Accept-Language'} = $self->{api_client}->to_header_value($args{'accept_language'});
    }

    # path params
    if ( exists $args{'analysis_ref_uid'}) {
        my $_base_variable = "{" . "analysisRefUid" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'analysis_ref_uid'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(basic )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('TaskResponse', $response);
    return $_response_object;
}

#
# post_image
#
# HTTP POST task image
# 
# @param ImageRequest $body Image request (required)
# @param boolean $async_mode true to activate asynchrone mode (optional)
# @param string $accept_language Accept language header (optional)
{
    my $params = {
    'body' => {
        data_type => 'ImageRequest',
        description => 'Image request',
        required => '1',
    },
    'async_mode' => {
        data_type => 'boolean',
        description => 'true to activate asynchrone mode',
        required => '0',
    },
    'accept_language' => {
        data_type => 'string',
        description => 'Accept language header',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'post_image' } = { 
    	summary => 'HTTP POST task image',
        params => $params,
        returns => 'ResultResponse',
        };
}
# @return ResultResponse
#
sub post_image {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling post_image");
    }

    # parse inputs
    my $_resource_path = '/v0/task/image';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json; charset=utf-8');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'async_mode'}) {
        $query_params->{'asyncMode'} = $self->{api_client}->to_query_value($args{'async_mode'});
    }

    # header params
    if ( exists $args{'accept_language'}) {
        $header_params->{'Accept-Language'} = $self->{api_client}->to_header_value($args{'accept_language'});
    }

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(basic )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ResultResponse', $response);
    return $_response_object;
}

#
# post_mrz
#
# HTTP POST task mrz
# 
# @param MrzRequest $body Mrz request (required)
# @param boolean $async_mode true to activate asynchrone mode (optional)
# @param string $accept_language Accept language header (optional)
{
    my $params = {
    'body' => {
        data_type => 'MrzRequest',
        description => 'Mrz request',
        required => '1',
    },
    'async_mode' => {
        data_type => 'boolean',
        description => 'true to activate asynchrone mode',
        required => '0',
    },
    'accept_language' => {
        data_type => 'string',
        description => 'Accept language header',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'post_mrz' } = { 
    	summary => 'HTTP POST task mrz',
        params => $params,
        returns => 'ResultResponse',
        };
}
# @return ResultResponse
#
sub post_mrz {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling post_mrz");
    }

    # parse inputs
    my $_resource_path = '/v0/task/mrz';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json; charset=utf-8');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'async_mode'}) {
        $query_params->{'asyncMode'} = $self->{api_client}->to_query_value($args{'async_mode'});
    }

    # header params
    if ( exists $args{'accept_language'}) {
        $header_params->{'Accept-Language'} = $self->{api_client}->to_header_value($args{'accept_language'});
    }

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(basic )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ResultResponse', $response);
    return $_response_object;
}

1;
