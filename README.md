# NAME

IdcheckioPerl::Client::Role - a Moose role for the IdCheck.IO API

Check identity documents

# VERSION

Automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 0.0
- Package version: 1.0.0
- Build date: 2016-12-05T15:34:28.119+01:00
- Build package: class io.swagger.codegen.languages.PerlClientCodegen

## A note on Moose

This role is the only component of the library that uses Moose. See 
IdcheckioPerl::Client::ApiFactory for non-Moosey usage. 

# SYNOPSIS

The Perl Swagger Codegen project builds a library of Perl modules to interact with 
a web service defined by a OpenAPI Specification. See below for how to build the 
library.

This module provides an interface to the generated library. All the classes, 
objects, and methods (well, not quite \*all\*, see below) are flattened into this 
role. 

        package MyApp;
        use Moose;
        with 'IdcheckioPerl::Client::Role';
        
        package main;
        
        my $api = MyApp->new({ tokens => $tokens });
        
        my $pet = $api->get_pet_by_id(pet_id => $pet_id);
        

## Structure of the library

The library consists of a set of API classes, one for each endpoint. These APIs
implement the method calls available on each endpoint. 

Additionally, there is a set of "object" classes, which represent the objects 
returned by and sent to the methods on the endpoints. 

An API factory class is provided, which builds instances of each endpoint API. 

This Moose role flattens all the methods from the endpoint APIs onto the consuming 
class. It also provides methods to retrieve the endpoint API objects, and the API 
factory object, should you need it. 

For documentation of all these methods, see AUTOMATIC DOCUMENTATION below.

## Configuring authentication

In the normal case, the OpenAPI Spec will describe what parameters are
required and where to put them. You just need to supply the tokens.

    my $tokens = {
        # basic
        username => $username,
        password => $password,
        
        # oauth
        access_token => $oauth_token,
        
        # keys
        $some_key => { token => $token,
                       prefix => $prefix, 
                       in => $in,             # 'head||query',     
                       },
                       
        $another => { token => $token,
                      prefix => $prefix, 
                      in => $in,              # 'head||query',      
                      },                   
        ...,
        
        };
        
        my $api = MyApp->new({ tokens => $tokens });

Note these are all optional, as are `prefix` and `in`, and depend on the API
you are accessing. Usually `prefix` and `in` will be determined by the code generator from
the spec and you will not need to set them at run time. If not, `in` will
default to 'head' and `prefix` to the empty string. 

The tokens will be placed in the `IdcheckioPerl::Client::Configuration` namespace
as follows, but you don't need to know about this. 

- `$IdcheckioPerl::Client::Configuration::username`

    String. The username for basic auth.

- `$IdcheckioPerl::Client::Configuration::password`

    String. The password for basic auth.

- `$IdcheckioPerl::Client::Configuration::api_key`

    Hashref. Keyed on the name of each key (there can be multiple tokens).

            $IdcheckioPerl::Client::Configuration::api_key = {
                    secretKey => 'aaaabbbbccccdddd',
                    anotherKey => '1111222233334444',
                    };

- `$IdcheckioPerl::Client::Configuration::api_key_prefix`

    Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
    all api keys require a prefix.

            $IdcheckioPerl::Client::Configuration::api_key_prefix = {
                    secretKey => 'string',
                    anotherKey => 'same or some other string',
                    };

- `$IdcheckioPerl::Client::Configuration::access_token`

    String. The OAuth access token. 

# METHODS

## `base_url`

The generated code has the `base_url` already set as a default value. This method 
returns (and optionally sets, but only if the API client has not been 
created yet) the current value of `base_url`.

## `api_factory`

Returns an API factory object. You probably won't need to call this directly. 

        $self->api_factory('Pet'); # returns a IdcheckioPerl::Client::PetApi instance
        
        $self->pet_api;            # the same

# MISSING METHODS

Most of the methods on the API are delegated to individual endpoint API objects
(e.g. Pet API, Store API, User API etc). Where different endpoint APIs use the
same method name (e.g. `new()`), these methods can't be delegated. So you need
to call `$api->pet_api->new()`.

In principle, every API is susceptible to the presence of a few, random, undelegatable 
method names. In practice, because of the way method names are constructed, it's 
unlikely in general that any methods will be undelegatable, except for: 

        new()
        class_documentation()
        method_documentation()

To call these methods, you need to get a handle on the relevant object, either
by calling `$api->foo_api` or by retrieving an object, e.g.
`$api->get_pet_by_id(pet_id => $pet_id)`. They are class methods, so
you could also call them on class names.

# BUILDING YOUR LIBRARY

See the homepage `https://github.com/swagger-api/swagger-codegen` for full details. 
But briefly, clone the git repository, build the codegen codebase, set up your build 
config file, then run the API build script. You will need git, Java 7 or 8 and Apache
maven 3.0.3 or better already installed.

The config file should specify the project name for the generated library: 

        {"moduleName":"WWW::MyProjectName"}

Your library files will be built under `WWW::MyProjectName`.

          $ git clone https://github.com/swagger-api/swagger-codegen.git
          $ cd swagger-codegen
          $ mvn package
          $ java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
    -i [URL or file path to JSON swagger API spec] \
    -l perl \
    -c /path/to/config/file.json \
    -o /path/to/output/folder

Bang, all done. Run the `autodoc` script in the `bin` directory to see the API 
you just built. 

# AUTOMATIC DOCUMENTATION

You can print out a summary of the generated API by running the included
`autodoc` script in the `bin` directory of your generated library. A few
output formats are supported:

          Usage: autodoc [OPTION]

    -w           wide format (default)
    -n           narrow format
    -p           POD format 
    -H           HTML format 
    -m           Markdown format
    -h           print this help message
    -c           your application class
    

The `-c` option allows you to load and inspect your own application. A dummy
namespace is used if you don't supply your own class.

# DOCUMENTATION FROM THE OpenAPI Spec

Additional documentation for each class and method may be provided by the Swagger 
spec. If so, this is available via the `class_documentation()` and 
`method_documentation()` methods on each generated object class, and the 
`method_documentation()` method on the endpoint API classes: 

        my $cmdoc = $api->pet_api->method_documentation->{$method_name}; 
        
        my $odoc = $api->get_pet_by_id->(pet_id => $pet_id)->class_documentation;                                  
        my $omdoc = $api->get_pet_by_id->(pet_id => $pet_id)->method_documentation->{method_name}; 
        

Each of these calls returns a hashref with various useful pieces of information.

# LOAD THE MODULES

To load the API packages:
```perl
use IdcheckioPerl::Client::AdministrationApi;
use IdcheckioPerl::Client::AnalysisApi;
use IdcheckioPerl::Client::SandboxApi;

```

To load the models:
```perl
use IdcheckioPerl::Client::Object::CheckSummaryOfTheSubmittedDocument;
use IdcheckioPerl::Client::Object::ClassificationOfTheSubmittedDocument;
use IdcheckioPerl::Client::Object::Control;
use IdcheckioPerl::Client::Object::ControlGroup;
use IdcheckioPerl::Client::Object::DetailedInformationOfTheHolderOfTheSubmittedDocument;
use IdcheckioPerl::Client::Object::DetailedInformationOfTheSubmittedDocument;
use IdcheckioPerl::Client::Object::ErrorResponse;
use IdcheckioPerl::Client::Object::EventDate;
use IdcheckioPerl::Client::Object::ExtractedImage;
use IdcheckioPerl::Client::Object::GenericData;
use IdcheckioPerl::Client::Object::HealthResponse;
use IdcheckioPerl::Client::Object::Image;
use IdcheckioPerl::Client::Object::ImageIndicator;
use IdcheckioPerl::Client::Object::ImageListResponse;
use IdcheckioPerl::Client::Object::ImageRequest;
use IdcheckioPerl::Client::Object::Mrz;
use IdcheckioPerl::Client::Object::MrzListResponse;
use IdcheckioPerl::Client::Object::MrzRequest;
use IdcheckioPerl::Client::Object::MrzResponse;
use IdcheckioPerl::Client::Object::ReportResponse;
use IdcheckioPerl::Client::Object::ResultResponse;
use IdcheckioPerl::Client::Object::TaskResponse;
use IdcheckioPerl::Client::Object::UserResponse;

````

# GETTING STARTED
Put the Perl SDK under the 'lib' folder in your project directory, then run the following
```perl
#!/usr/bin/perl
use lib 'lib';
use strict;
use warnings;
# load the API package
use IdcheckioPerl::Client::AdministrationApi;
use IdcheckioPerl::Client::AnalysisApi;
use IdcheckioPerl::Client::SandboxApi;

# load the models
use IdcheckioPerl::Client::Object::CheckSummaryOfTheSubmittedDocument;
use IdcheckioPerl::Client::Object::ClassificationOfTheSubmittedDocument;
use IdcheckioPerl::Client::Object::Control;
use IdcheckioPerl::Client::Object::ControlGroup;
use IdcheckioPerl::Client::Object::DetailedInformationOfTheHolderOfTheSubmittedDocument;
use IdcheckioPerl::Client::Object::DetailedInformationOfTheSubmittedDocument;
use IdcheckioPerl::Client::Object::ErrorResponse;
use IdcheckioPerl::Client::Object::EventDate;
use IdcheckioPerl::Client::Object::ExtractedImage;
use IdcheckioPerl::Client::Object::GenericData;
use IdcheckioPerl::Client::Object::HealthResponse;
use IdcheckioPerl::Client::Object::Image;
use IdcheckioPerl::Client::Object::ImageIndicator;
use IdcheckioPerl::Client::Object::ImageListResponse;
use IdcheckioPerl::Client::Object::ImageRequest;
use IdcheckioPerl::Client::Object::Mrz;
use IdcheckioPerl::Client::Object::MrzListResponse;
use IdcheckioPerl::Client::Object::MrzRequest;
use IdcheckioPerl::Client::Object::MrzResponse;
use IdcheckioPerl::Client::Object::ReportResponse;
use IdcheckioPerl::Client::Object::ResultResponse;
use IdcheckioPerl::Client::Object::TaskResponse;
use IdcheckioPerl::Client::Object::UserResponse;

# for displaying the API response data
use Data::Dumper;

my $api_instance = IdcheckioPerl::Client::AdministrationApi->new();

eval {
    my $result = $api_instance->get_health();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AdministrationApi->get_health: $@\n";
}

```

# DOCUMENTATION FOR API ENDPOINTS

All URIs are relative to *https://localhost/rest*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AdministrationApi* | [**get_health**](docs/AdministrationApi.md#get_health) | **GET** /v0/admin/health | HTTP GET health
*AdministrationApi* | [**get_user**](docs/AdministrationApi.md#get_user) | **GET** /v0/admin/user | HTTP GET user
*AnalysisApi* | [**get_report**](docs/AnalysisApi.md#get_report) | **GET** /v0/pdfreport/{analysisRefUid} | HTTP GET report (demo)
*AnalysisApi* | [**get_result**](docs/AnalysisApi.md#get_result) | **GET** /v0/result/{analysisRefUid} | HTTP GET result
*AnalysisApi* | [**get_task**](docs/AnalysisApi.md#get_task) | **GET** /v0/task/{analysisRefUid} | HTTP GET task
*AnalysisApi* | [**post_image**](docs/AnalysisApi.md#post_image) | **POST** /v0/task/image | HTTP POST task image
*AnalysisApi* | [**post_mrz**](docs/AnalysisApi.md#post_mrz) | **POST** /v0/task/mrz | HTTP POST task mrz
*SandboxApi* | [**get_image**](docs/SandboxApi.md#get_image) | **GET** /v0/sandbox/image/{imageUid} | HTTP GET image
*SandboxApi* | [**get_image_list**](docs/SandboxApi.md#get_image_list) | **GET** /v0/sandbox/imagelist | HTTP GET images list
*SandboxApi* | [**get_mrz**](docs/SandboxApi.md#get_mrz) | **GET** /v0/sandbox/mrz/{mrzUid} | HTTP GET mrz
*SandboxApi* | [**get_mrz_list**](docs/SandboxApi.md#get_mrz_list) | **GET** /v0/sandbox/mrzlist | HTTP GET mrz list


# DOCUMENTATION FOR MODELS
 - [IdcheckioPerl::Client::Object::CheckSummaryOfTheSubmittedDocument](docs/CheckSummaryOfTheSubmittedDocument.md)
 - [IdcheckioPerl::Client::Object::ClassificationOfTheSubmittedDocument](docs/ClassificationOfTheSubmittedDocument.md)
 - [IdcheckioPerl::Client::Object::Control](docs/Control.md)
 - [IdcheckioPerl::Client::Object::ControlGroup](docs/ControlGroup.md)
 - [IdcheckioPerl::Client::Object::DetailedInformationOfTheHolderOfTheSubmittedDocument](docs/DetailedInformationOfTheHolderOfTheSubmittedDocument.md)
 - [IdcheckioPerl::Client::Object::DetailedInformationOfTheSubmittedDocument](docs/DetailedInformationOfTheSubmittedDocument.md)
 - [IdcheckioPerl::Client::Object::ErrorResponse](docs/ErrorResponse.md)
 - [IdcheckioPerl::Client::Object::EventDate](docs/EventDate.md)
 - [IdcheckioPerl::Client::Object::ExtractedImage](docs/ExtractedImage.md)
 - [IdcheckioPerl::Client::Object::GenericData](docs/GenericData.md)
 - [IdcheckioPerl::Client::Object::HealthResponse](docs/HealthResponse.md)
 - [IdcheckioPerl::Client::Object::Image](docs/Image.md)
 - [IdcheckioPerl::Client::Object::ImageIndicator](docs/ImageIndicator.md)
 - [IdcheckioPerl::Client::Object::ImageListResponse](docs/ImageListResponse.md)
 - [IdcheckioPerl::Client::Object::ImageRequest](docs/ImageRequest.md)
 - [IdcheckioPerl::Client::Object::Mrz](docs/Mrz.md)
 - [IdcheckioPerl::Client::Object::MrzListResponse](docs/MrzListResponse.md)
 - [IdcheckioPerl::Client::Object::MrzRequest](docs/MrzRequest.md)
 - [IdcheckioPerl::Client::Object::MrzResponse](docs/MrzResponse.md)
 - [IdcheckioPerl::Client::Object::ReportResponse](docs/ReportResponse.md)
 - [IdcheckioPerl::Client::Object::ResultResponse](docs/ResultResponse.md)
 - [IdcheckioPerl::Client::Object::TaskResponse](docs/TaskResponse.md)
 - [IdcheckioPerl::Client::Object::UserResponse](docs/UserResponse.md)


# DOCUMENTATION FOR AUTHORIATION

## basic

- **Type**: HTTP basic authentication



