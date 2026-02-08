# coffee_machine_api.api.ProcessApi

## Load the API package
```dart
import 'package:coffee_machine_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiProcessCompletePost**](ProcessApi.md#apiprocesscompletepost) | **POST** /api/Process/complete | 
[**apiProcessProcessIdGet**](ProcessApi.md#apiprocessprocessidget) | **GET** /api/Process/{processId} | 
[**apiProcessProcessIdMaterialsGet**](ProcessApi.md#apiprocessprocessidmaterialsget) | **GET** /api/Process/{processId}/materials | 
[**apiProcessProcessIdStepsGet**](ProcessApi.md#apiprocessprocessidstepsget) | **GET** /api/Process/{processId}/steps | 
[**apiProcessProductProductIdGet**](ProcessApi.md#apiprocessproductproductidget) | **GET** /api/Process/product/{productId} | 


# **apiProcessCompletePost**
> ProcessResponseDTO apiProcessCompletePost(completeProcessDTO)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProcessApi();
final CompleteProcessDTO completeProcessDTO = ; // CompleteProcessDTO | 

try {
    final response = api.apiProcessCompletePost(completeProcessDTO);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProcessApi->apiProcessCompletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **completeProcessDTO** | [**CompleteProcessDTO**](CompleteProcessDTO.md)|  | [optional] 

### Return type

[**ProcessResponseDTO**](ProcessResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProcessProcessIdGet**
> ProcessResponseDTO apiProcessProcessIdGet(processId)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProcessApi();
final int processId = 56; // int | 

try {
    final response = api.apiProcessProcessIdGet(processId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProcessApi->apiProcessProcessIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **processId** | **int**|  | 

### Return type

[**ProcessResponseDTO**](ProcessResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProcessProcessIdMaterialsGet**
> BuiltList<ProcessedMaterialResponseDTO> apiProcessProcessIdMaterialsGet(processId)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProcessApi();
final int processId = 56; // int | 

try {
    final response = api.apiProcessProcessIdMaterialsGet(processId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProcessApi->apiProcessProcessIdMaterialsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **processId** | **int**|  | 

### Return type

[**BuiltList&lt;ProcessedMaterialResponseDTO&gt;**](ProcessedMaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProcessProcessIdStepsGet**
> BuiltList<ProcessOperationResponseDTO> apiProcessProcessIdStepsGet(processId)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProcessApi();
final int processId = 56; // int | 

try {
    final response = api.apiProcessProcessIdStepsGet(processId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProcessApi->apiProcessProcessIdStepsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **processId** | **int**|  | 

### Return type

[**BuiltList&lt;ProcessOperationResponseDTO&gt;**](ProcessOperationResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProcessProductProductIdGet**
> BuiltList<ProcessResponseDTO> apiProcessProductProductIdGet(productId)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProcessApi();
final int productId = 56; // int | 

try {
    final response = api.apiProcessProductProductIdGet(productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProcessApi->apiProcessProductProductIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **int**|  | 

### Return type

[**BuiltList&lt;ProcessResponseDTO&gt;**](ProcessResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

