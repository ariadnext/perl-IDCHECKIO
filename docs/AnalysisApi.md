# IdcheckioPerl::Client::AnalysisApi

## Load the API package
```perl
use IdcheckioPerl::Client::Object::AnalysisApi;
```

All URIs are relative to *https://localhost/rest*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_report**](AnalysisApi.md#get_report) | **GET** /v0/pdfreport/{analysisRefUid} | HTTP GET report (demo)
[**get_result**](AnalysisApi.md#get_result) | **GET** /v0/result/{analysisRefUid} | HTTP GET result
[**get_task**](AnalysisApi.md#get_task) | **GET** /v0/task/{analysisRefUid} | HTTP GET task
[**post_image**](AnalysisApi.md#post_image) | **POST** /v0/task/image | HTTP POST task image
[**post_mrz**](AnalysisApi.md#post_mrz) | **POST** /v0/task/mrz | HTTP POST task mrz


# **get_report**
> ReportResponse get_report(analysis_ref_uid => $analysis_ref_uid, accept_language => $accept_language)

HTTP GET report (demo)

Get a pdf report (base64 encoded) (demo)

### Example 
```perl
use Data::Dumper;

# Configure HTTP basic authorization: basic
$IdcheckioPerl::Client::Configuration::username = 'YOUR_USERNAME';
$IdcheckioPerl::Client::Configuration::password = 'YOUR_PASSWORD';

my $api_instance = IdcheckioPerl::Client::AnalysisApi->new();
my $analysis_ref_uid = 'analysis_ref_uid_example'; # string | Report analysisRefUid
my $accept_language = 'accept_language_example'; # string | Accept language header

eval { 
    my $result = $api_instance->get_report(analysis_ref_uid => $analysis_ref_uid, accept_language => $accept_language);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AnalysisApi->get_report: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **analysis_ref_uid** | **string**| Report analysisRefUid | 
 **accept_language** | **string**| Accept language header | [optional] 

### Return type

[**ReportResponse**](ReportResponse.md)

### Authorization

[basic](../README.md#basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_result**
> ResultResponse get_result(analysis_ref_uid => $analysis_ref_uid, accept_language => $accept_language, recto_image_cropped => $recto_image_cropped, face_image_cropped => $face_image_cropped, signature_image_cropped => $signature_image_cropped)

HTTP GET result

Get result controls

### Example 
```perl
use Data::Dumper;

# Configure HTTP basic authorization: basic
$IdcheckioPerl::Client::Configuration::username = 'YOUR_USERNAME';
$IdcheckioPerl::Client::Configuration::password = 'YOUR_PASSWORD';

my $api_instance = IdcheckioPerl::Client::AnalysisApi->new();
my $analysis_ref_uid = 'analysis_ref_uid_example'; # string | Result analysisRefUid
my $accept_language = 'accept_language_example'; # string | Accept language header
my $recto_image_cropped = 1; # boolean | True to obtain recto image cropped if applicable
my $face_image_cropped = 1; # boolean | True to obtain face image cropped if applicable
my $signature_image_cropped = 1; # boolean | True to obtain signature image cropped if applicable

eval { 
    my $result = $api_instance->get_result(analysis_ref_uid => $analysis_ref_uid, accept_language => $accept_language, recto_image_cropped => $recto_image_cropped, face_image_cropped => $face_image_cropped, signature_image_cropped => $signature_image_cropped);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AnalysisApi->get_result: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **analysis_ref_uid** | **string**| Result analysisRefUid | 
 **accept_language** | **string**| Accept language header | [optional] 
 **recto_image_cropped** | **boolean**| True to obtain recto image cropped if applicable | [optional] [default to false]
 **face_image_cropped** | **boolean**| True to obtain face image cropped if applicable | [optional] [default to false]
 **signature_image_cropped** | **boolean**| True to obtain signature image cropped if applicable | [optional] [default to false]

### Return type

[**ResultResponse**](ResultResponse.md)

### Authorization

[basic](../README.md#basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_task**
> TaskResponse get_task(analysis_ref_uid => $analysis_ref_uid, accept_language => $accept_language, wait => $wait)

HTTP GET task

Get task status

### Example 
```perl
use Data::Dumper;

# Configure HTTP basic authorization: basic
$IdcheckioPerl::Client::Configuration::username = 'YOUR_USERNAME';
$IdcheckioPerl::Client::Configuration::password = 'YOUR_PASSWORD';

my $api_instance = IdcheckioPerl::Client::AnalysisApi->new();
my $analysis_ref_uid = 'analysis_ref_uid_example'; # string | Task analysisRefUid
my $accept_language = 'accept_language_example'; # string | Accept language header
my $wait = 789; # int | specify a maximum wait time in milliseconds

eval { 
    my $result = $api_instance->get_task(analysis_ref_uid => $analysis_ref_uid, accept_language => $accept_language, wait => $wait);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AnalysisApi->get_task: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **analysis_ref_uid** | **string**| Task analysisRefUid | 
 **accept_language** | **string**| Accept language header | [optional] 
 **wait** | **int**| specify a maximum wait time in milliseconds | [optional] 

### Return type

[**TaskResponse**](TaskResponse.md)

### Authorization

[basic](../README.md#basic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **post_image**
> ResultResponse post_image(body => $body, async_mode => $async_mode, accept_language => $accept_language)

HTTP POST task image

POST an image check task

### Example 
```perl
use Data::Dumper;

# Configure HTTP basic authorization: basic
$IdcheckioPerl::Client::Configuration::username = 'YOUR_USERNAME';
$IdcheckioPerl::Client::Configuration::password = 'YOUR_PASSWORD';

my $api_instance = IdcheckioPerl::Client::AnalysisApi->new();
my $body = IdcheckioPerl::Client::Object::ImageRequest->new(); # ImageRequest | Image request
my $async_mode = 1; # boolean | true to activate asynchrone mode
my $accept_language = 'accept_language_example'; # string | Accept language header

eval { 
    my $result = $api_instance->post_image(body => $body, async_mode => $async_mode, accept_language => $accept_language);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AnalysisApi->post_image: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ImageRequest**](ImageRequest.md)| Image request | 
 **async_mode** | **boolean**| true to activate asynchrone mode | [optional] 
 **accept_language** | **string**| Accept language header | [optional] 

### Return type

[**ResultResponse**](ResultResponse.md)

### Authorization

[basic](../README.md#basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **post_mrz**
> ResultResponse post_mrz(body => $body, async_mode => $async_mode, accept_language => $accept_language)

HTTP POST task mrz

POST a mrz check task

### Example 
```perl
use Data::Dumper;

# Configure HTTP basic authorization: basic
$IdcheckioPerl::Client::Configuration::username = 'YOUR_USERNAME';
$IdcheckioPerl::Client::Configuration::password = 'YOUR_PASSWORD';

my $api_instance = IdcheckioPerl::Client::AnalysisApi->new();
my $body = IdcheckioPerl::Client::Object::MrzRequest->new(); # MrzRequest | Mrz request
my $async_mode = 1; # boolean | true to activate asynchrone mode
my $accept_language = 'accept_language_example'; # string | Accept language header

eval { 
    my $result = $api_instance->post_mrz(body => $body, async_mode => $async_mode, accept_language => $accept_language);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AnalysisApi->post_mrz: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**MrzRequest**](MrzRequest.md)| Mrz request | 
 **async_mode** | **boolean**| true to activate asynchrone mode | [optional] 
 **accept_language** | **string**| Accept language header | [optional] 

### Return type

[**ResultResponse**](ResultResponse.md)

### Authorization

[basic](../README.md#basic)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

