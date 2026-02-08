# coffee_machine_api.api.BrewApi

## Load the API package
```dart
import 'package:coffee_machine_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiBrewCleanPost**](BrewApi.md#apibrewcleanpost) | **POST** /api/Brew/clean | 
[**apiBrewInitPost**](BrewApi.md#apibrewinitpost) | **POST** /api/Brew/init | 
[**apiBrewPreviewProcessIdGet**](BrewApi.md#apibrewpreviewprocessidget) | **GET** /api/Brew/preview/{processId} | 
[**apiBrewProcessProcessIdPost**](BrewApi.md#apibrewprocessprocessidpost) | **POST** /api/Brew/process/{processId} | 


# **apiBrewCleanPost**
> apiBrewCleanPost()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getBrewApi();

try {
    api.apiBrewCleanPost();
} on DioException catch (e) {
    print('Exception when calling BrewApi->apiBrewCleanPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiBrewInitPost**
> apiBrewInitPost()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getBrewApi();

try {
    api.apiBrewInitPost();
} on DioException catch (e) {
    print('Exception when calling BrewApi->apiBrewInitPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiBrewPreviewProcessIdGet**
> apiBrewPreviewProcessIdGet(processId)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getBrewApi();
final int processId = 56; // int | 

try {
    api.apiBrewPreviewProcessIdGet(processId);
} on DioException catch (e) {
    print('Exception when calling BrewApi->apiBrewPreviewProcessIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **processId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiBrewProcessProcessIdPost**
> apiBrewProcessProcessIdPost(processId)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getBrewApi();
final int processId = 56; // int | 

try {
    api.apiBrewProcessProcessIdPost(processId);
} on DioException catch (e) {
    print('Exception when calling BrewApi->apiBrewProcessProcessIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **processId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

