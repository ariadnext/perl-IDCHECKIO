# IdcheckioPerl::Client::AdministrationApi

## Load the API package
```perl
use IdcheckioPerl::Client::Object::AdministrationApi;
```

All URIs are relative to *https://localhost/rest*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_health**](AdministrationApi.md#get_health) | **GET** /v0/admin/health | HTTP GET health
[**get_user**](AdministrationApi.md#get_user) | **GET** /v0/admin/user | HTTP GET user


# **get_health**
> HealthResponse get_health()

HTTP GET health

GET server health (OK 200)

### Example 
```perl
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

### Parameters
This endpoint does not need any parameter.

### Return type

[**HealthResponse**](HealthResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_user**
> UserResponse get_user(accept_language => $accept_language)

HTTP GET user

Get user informations

### Example 
```perl
use Data::Dumper;

# Configure HTTP basic authorization: basic
$IdcheckioPerl::Client::Configuration::username = 'YOUR_USERNAME';
$IdcheckioPerl::Client::Configuration::password = 'YOUR_PASSWORD';

my $api_instance = IdcheckioPerl::Client::AdministrationApi->new();
my $accept_language = 'accept_language_example'; # string | Accept language header

eval { 
    my $result = $api_instance->get_user(accept_language => $accept_language);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AdministrationApi->get_user: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accept_language** | **string**| Accept language header | [optional] 

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[basic](../README.md#basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

