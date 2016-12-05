# IdcheckioPerl::Client::SandboxApi

## Load the API package
```perl
use IdcheckioPerl::Client::Object::SandboxApi;
```

All URIs are relative to *https://localhost/rest*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_image**](SandboxApi.md#get_image) | **GET** /v0/sandbox/image/{imageUid} | HTTP GET image
[**get_image_list**](SandboxApi.md#get_image_list) | **GET** /v0/sandbox/imagelist | HTTP GET images list
[**get_mrz**](SandboxApi.md#get_mrz) | **GET** /v0/sandbox/mrz/{mrzUid} | HTTP GET mrz
[**get_mrz_list**](SandboxApi.md#get_mrz_list) | **GET** /v0/sandbox/mrzlist | HTTP GET mrz list


# **get_image**
> ARRAY[string] get_image(image_uid => $image_uid, raw_type => $raw_type, face => $face, light => $light)

HTTP GET image

GET image

### Example 
```perl
use Data::Dumper;

my $api_instance = IdcheckioPerl::Client::SandboxApi->new();
my $image_uid = 'image_uid_example'; # string | EnumDemoDocsImage
my $raw_type = 'raw_type_example'; # string | Image raw type
my $face = 'face_example'; # string | Image face
my $light = 'light_example'; # string | Image light

eval { 
    my $result = $api_instance->get_image(image_uid => $image_uid, raw_type => $raw_type, face => $face, light => $light);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SandboxApi->get_image: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image_uid** | **string**| EnumDemoDocsImage | 
 **raw_type** | **string**| Image raw type | [optional] 
 **face** | **string**| Image face | [optional] 
 **light** | **string**| Image light | [optional] 

### Return type

**ARRAY[string]**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_image_list**
> ImageListResponse get_image_list()

HTTP GET images list

GET images list

### Example 
```perl
use Data::Dumper;

my $api_instance = IdcheckioPerl::Client::SandboxApi->new();

eval { 
    my $result = $api_instance->get_image_list();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SandboxApi->get_image_list: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ImageListResponse**](ImageListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_mrz**
> MrzResponse get_mrz(mrz_uid => $mrz_uid)

HTTP GET mrz

GET mrz

### Example 
```perl
use Data::Dumper;

my $api_instance = IdcheckioPerl::Client::SandboxApi->new();
my $mrz_uid = 'mrz_uid_example'; # string | EnumDemoDocsMrz

eval { 
    my $result = $api_instance->get_mrz(mrz_uid => $mrz_uid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SandboxApi->get_mrz: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mrz_uid** | **string**| EnumDemoDocsMrz | 

### Return type

[**MrzResponse**](MrzResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_mrz_list**
> MrzListResponse get_mrz_list()

HTTP GET mrz list

GET mrz list

### Example 
```perl
use Data::Dumper;

my $api_instance = IdcheckioPerl::Client::SandboxApi->new();

eval { 
    my $result = $api_instance->get_mrz_list();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SandboxApi->get_mrz_list: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MrzListResponse**](MrzListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

