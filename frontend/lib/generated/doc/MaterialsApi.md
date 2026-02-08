# coffee_machine_api.api.MaterialsApi

## Load the API package
```dart
import 'package:coffee_machine_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiMaterialsAdjustStockPost**](MaterialsApi.md#apimaterialsadjuststockpost) | **POST** /api/Materials/adjust-stock | 
[**apiMaterialsBulkAdjustStockPost**](MaterialsApi.md#apimaterialsbulkadjuststockpost) | **POST** /api/Materials/bulk-adjust-stock | 
[**apiMaterialsConsumableGet**](MaterialsApi.md#apimaterialsconsumableget) | **GET** /api/Materials/consumable | 
[**apiMaterialsGet**](MaterialsApi.md#apimaterialsget) | **GET** /api/Materials | 
[**apiMaterialsIdDelete**](MaterialsApi.md#apimaterialsiddelete) | **DELETE** /api/Materials/{id} | 
[**apiMaterialsIdGet**](MaterialsApi.md#apimaterialsidget) | **GET** /api/Materials/{id} | 
[**apiMaterialsIdPut**](MaterialsApi.md#apimaterialsidput) | **PUT** /api/Materials/{id} | 
[**apiMaterialsLowStockGet**](MaterialsApi.md#apimaterialslowstockget) | **GET** /api/Materials/low-stock | 
[**apiMaterialsPost**](MaterialsApi.md#apimaterialspost) | **POST** /api/Materials | 
[**apiMaterialsSearchNameGet**](MaterialsApi.md#apimaterialssearchnameget) | **GET** /api/Materials/search/{name} | 


# **apiMaterialsAdjustStockPost**
> MaterialResponseDTO apiMaterialsAdjustStockPost(stockAdjustmentDTO)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();
final StockAdjustmentDTO stockAdjustmentDTO = ; // StockAdjustmentDTO | 

try {
    final response = api.apiMaterialsAdjustStockPost(stockAdjustmentDTO);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsAdjustStockPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **stockAdjustmentDTO** | [**StockAdjustmentDTO**](StockAdjustmentDTO.md)|  | [optional] 

### Return type

[**MaterialResponseDTO**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMaterialsBulkAdjustStockPost**
> apiMaterialsBulkAdjustStockPost(stockAdjustmentDTO)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();
final BuiltList<StockAdjustmentDTO> stockAdjustmentDTO = ; // BuiltList<StockAdjustmentDTO> | 

try {
    api.apiMaterialsBulkAdjustStockPost(stockAdjustmentDTO);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsBulkAdjustStockPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **stockAdjustmentDTO** | [**BuiltList&lt;StockAdjustmentDTO&gt;**](StockAdjustmentDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMaterialsConsumableGet**
> BuiltList<MaterialResponseDTO> apiMaterialsConsumableGet()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();

try {
    final response = api.apiMaterialsConsumableGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsConsumableGet: $e\n');
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

# **apiMaterialsGet**
> BuiltList<MaterialResponseDTO> apiMaterialsGet()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();

try {
    final response = api.apiMaterialsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsGet: $e\n');
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

# **apiMaterialsIdDelete**
> apiMaterialsIdDelete(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();
final int id = 56; // int | 

try {
    api.apiMaterialsIdDelete(id);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsIdDelete: $e\n');
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

# **apiMaterialsIdGet**
> MaterialResponseDTO apiMaterialsIdGet(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();
final int id = 56; // int | 

try {
    final response = api.apiMaterialsIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsIdGet: $e\n');
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

# **apiMaterialsIdPut**
> MaterialResponseDTO apiMaterialsIdPut(id, materialUpdateDTO)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();
final int id = 56; // int | 
final MaterialUpdateDTO materialUpdateDTO = ; // MaterialUpdateDTO | 

try {
    final response = api.apiMaterialsIdPut(id, materialUpdateDTO);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **materialUpdateDTO** | [**MaterialUpdateDTO**](MaterialUpdateDTO.md)|  | [optional] 

### Return type

[**MaterialResponseDTO**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMaterialsLowStockGet**
> BuiltList<MaterialResponseDTO> apiMaterialsLowStockGet(threshold)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();
final double threshold = 1.2; // double | 

try {
    final response = api.apiMaterialsLowStockGet(threshold);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsLowStockGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threshold** | **double**|  | [optional] [default to 10]

### Return type

[**BuiltList&lt;MaterialResponseDTO&gt;**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMaterialsPost**
> MaterialResponseDTO apiMaterialsPost(materialCreateDTO)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();
final MaterialCreateDTO materialCreateDTO = ; // MaterialCreateDTO | 

try {
    final response = api.apiMaterialsPost(materialCreateDTO);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **materialCreateDTO** | [**MaterialCreateDTO**](MaterialCreateDTO.md)|  | [optional] 

### Return type

[**MaterialResponseDTO**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMaterialsSearchNameGet**
> MaterialResponseDTO apiMaterialsSearchNameGet(name)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getMaterialsApi();
final String name = name_example; // String | 

try {
    final response = api.apiMaterialsSearchNameGet(name);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MaterialsApi->apiMaterialsSearchNameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 

### Return type

[**MaterialResponseDTO**](MaterialResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

