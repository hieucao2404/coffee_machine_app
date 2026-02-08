# coffee_machine_api.api.MaterialApi

## Load the API package
```dart
import 'package:coffee_machine_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiMaterialGet**](MaterialApi.md#apimaterialget) | **GET** /api/Material | 
[**apiMaterialIdDelete**](MaterialApi.md#apimaterialiddelete) | **DELETE** /api/Material/{id} | 
[**apiMaterialIdGet**](MaterialApi.md#apimaterialidget) | **GET** /api/Material/{id} | 
[**apiMaterialIdPut**](MaterialApi.md#apimaterialidput) | **PUT** /api/Material/{id} | 
[**apiMaterialPost**](MaterialApi.md#apimaterialpost) | **POST** /api/Material | 


# **apiMaterialGet**
> BuiltList<MaterialResponseDTO> apiMaterialGet()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialApi();

try {
    final response = api.apiMaterialGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialApi->apiMaterialGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;MaterialResponseDTO&gt;**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMaterialIdDelete**
> apiMaterialIdDelete(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialApi();
final int id = 56; // int | 

try {
    api.apiMaterialIdDelete(id);
} on DioException catch (e) {
    print('Exception when calling MaterialApi->apiMaterialIdDelete: $e\n');
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

# **apiMaterialIdGet**
> MaterialResponseDTO apiMaterialIdGet(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialApi();
final int id = 56; // int | 

try {
    final response = api.apiMaterialIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialApi->apiMaterialIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**MaterialResponseDTO**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMaterialIdPut**
> MaterialResponseDTO apiMaterialIdPut(id, materialName, materialUnit, costPerUnit, stockQuantity, isConsumable, imageUrl, contentType, contentDisposition, headers, length, name, fileName)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialApi();
final int id = 56; // int | 
final String materialName = materialName_example; // String | 
final String materialUnit = materialUnit_example; // String | 
final double costPerUnit = 1.2; // double | 
final double stockQuantity = 1.2; // double | 
final bool isConsumable = true; // bool | 
final String imageUrl = imageUrl_example; // String | 
final String contentType = contentType_example; // String | 
final String contentDisposition = contentDisposition_example; // String | 
final BuiltMap<String, BuiltList<String>> headers = ; // BuiltMap<String, BuiltList<String>> | 
final int length = 789; // int | 
final String name = name_example; // String | 
final String fileName = fileName_example; // String | 

try {
    final response = api.apiMaterialIdPut(id, materialName, materialUnit, costPerUnit, stockQuantity, isConsumable, imageUrl, contentType, contentDisposition, headers, length, name, fileName);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialApi->apiMaterialIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **materialName** | **String**|  | [optional] 
 **materialUnit** | **String**|  | [optional] 
 **costPerUnit** | **double**|  | [optional] 
 **stockQuantity** | **double**|  | [optional] 
 **isConsumable** | **bool**|  | [optional] 
 **imageUrl** | **String**|  | [optional] 
 **contentType** | **String**|  | [optional] 
 **contentDisposition** | **String**|  | [optional] 
 **headers** | [**BuiltMap&lt;String, BuiltList&lt;String&gt;&gt;**](BuiltMap.md)|  | [optional] 
 **length** | **int**|  | [optional] 
 **name** | **String**|  | [optional] 
 **fileName** | **String**|  | [optional] 

### Return type

[**MaterialResponseDTO**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMaterialPost**
> MaterialResponseDTO apiMaterialPost(materialName, materialUnit, costPerUnit, stockQuantity, isConsumable, imageUrl, contentType, contentDisposition, headers, length, name, fileName)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialApi();
final String materialName = materialName_example; // String | 
final String materialUnit = materialUnit_example; // String | 
final double costPerUnit = 1.2; // double | 
final double stockQuantity = 1.2; // double | 
final bool isConsumable = true; // bool | 
final String imageUrl = imageUrl_example; // String | 
final String contentType = contentType_example; // String | 
final String contentDisposition = contentDisposition_example; // String | 
final BuiltMap<String, BuiltList<String>> headers = ; // BuiltMap<String, BuiltList<String>> | 
final int length = 789; // int | 
final String name = name_example; // String | 
final String fileName = fileName_example; // String | 

try {
    final response = api.apiMaterialPost(materialName, materialUnit, costPerUnit, stockQuantity, isConsumable, imageUrl, contentType, contentDisposition, headers, length, name, fileName);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialApi->apiMaterialPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **materialName** | **String**|  | [optional] 
 **materialUnit** | **String**|  | [optional] 
 **costPerUnit** | **double**|  | [optional] 
 **stockQuantity** | **double**|  | [optional] 
 **isConsumable** | **bool**|  | [optional] 
 **imageUrl** | **String**|  | [optional] 
 **contentType** | **String**|  | [optional] 
 **contentDisposition** | **String**|  | [optional] 
 **headers** | [**BuiltMap&lt;String, BuiltList&lt;String&gt;&gt;**](BuiltMap.md)|  | [optional] 
 **length** | **int**|  | [optional] 
 **name** | **String**|  | [optional] 
 **fileName** | **String**|  | [optional] 

### Return type

[**MaterialResponseDTO**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

