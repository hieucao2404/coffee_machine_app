# coffee_machine_api.api.OperationsApi

## Load the API package
```dart
import 'package:coffee_machine_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiOperationsGet**](OperationsApi.md#apioperationsget) | **GET** /api/Operations | 
[**apiOperationsIdDelete**](OperationsApi.md#apioperationsiddelete) | **DELETE** /api/Operations/{id} | 
[**apiOperationsIdGet**](OperationsApi.md#apioperationsidget) | **GET** /api/Operations/{id} | 
[**apiOperationsIdPut**](OperationsApi.md#apioperationsidput) | **PUT** /api/Operations/{id} | 
[**apiOperationsPost**](OperationsApi.md#apioperationspost) | **POST** /api/Operations | 
[**apiOperationsSearchNameGet**](OperationsApi.md#apioperationssearchnameget) | **GET** /api/Operations/search/{name} | 
[**apiOperationsTypeTypeGet**](OperationsApi.md#apioperationstypetypeget) | **GET** /api/Operations/type/{type} | 


# **apiOperationsGet**
> BuiltList<OperationResponseDTO> apiOperationsGet()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getOperationsApi();

try {
    final response = api.apiOperationsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling OperationsApi->apiOperationsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;OperationResponseDTO&gt;**](OperationResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOperationsIdDelete**
> apiOperationsIdDelete(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getOperationsApi();
final int id = 56; // int | 

try {
    api.apiOperationsIdDelete(id);
} on DioException catch (e) {
    print('Exception when calling OperationsApi->apiOperationsIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOperationsIdGet**
> OperationResponseDTO apiOperationsIdGet(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getOperationsApi();
final int id = 56; // int | 

try {
    final response = api.apiOperationsIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OperationsApi->apiOperationsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**OperationResponseDTO**](OperationResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOperationsIdPut**
> OperationResponseDTO apiOperationsIdPut(id, operationUpdateDTO)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getOperationsApi();
final int id = 56; // int | 
final OperationUpdateDTO operationUpdateDTO = ; // OperationUpdateDTO | 

try {
    final response = api.apiOperationsIdPut(id, operationUpdateDTO);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OperationsApi->apiOperationsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **operationUpdateDTO** | [**OperationUpdateDTO**](OperationUpdateDTO.md)|  | [optional] 

### Return type

[**OperationResponseDTO**](OperationResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOperationsPost**
> OperationResponseDTO apiOperationsPost(operationCreateDTO)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getOperationsApi();
final OperationCreateDTO operationCreateDTO = ; // OperationCreateDTO | 

try {
    final response = api.apiOperationsPost(operationCreateDTO);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OperationsApi->apiOperationsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **operationCreateDTO** | [**OperationCreateDTO**](OperationCreateDTO.md)|  | [optional] 

### Return type

[**OperationResponseDTO**](OperationResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOperationsSearchNameGet**
> OperationResponseDTO apiOperationsSearchNameGet(name)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getOperationsApi();
final String name = name_example; // String | 

try {
    final response = api.apiOperationsSearchNameGet(name);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OperationsApi->apiOperationsSearchNameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 

### Return type

[**OperationResponseDTO**](OperationResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOperationsTypeTypeGet**
> BuiltList<OperationResponseDTO> apiOperationsTypeTypeGet(type)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getOperationsApi();
final String type = type_example; // String | 

try {
    final response = api.apiOperationsTypeTypeGet(type);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OperationsApi->apiOperationsTypeTypeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | 

### Return type

[**BuiltList&lt;OperationResponseDTO&gt;**](OperationResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

