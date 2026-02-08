# coffee_machine_api.api.ProductsApi

## Load the API package
```dart
import 'package:coffee_machine_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiProductsActiveGet**](ProductsApi.md#apiproductsactiveget) | **GET** /api/Products/active | 
[**apiProductsCategoryCategoryGet**](ProductsApi.md#apiproductscategorycategoryget) | **GET** /api/Products/category/{category} | 
[**apiProductsGet**](ProductsApi.md#apiproductsget) | **GET** /api/Products | 
[**apiProductsIdAvailabilityGet**](ProductsApi.md#apiproductsidavailabilityget) | **GET** /api/Products/{id}/availability | 
[**apiProductsIdDelete**](ProductsApi.md#apiproductsiddelete) | **DELETE** /api/Products/{id} | 
[**apiProductsIdDetailGet**](ProductsApi.md#apiproductsiddetailget) | **GET** /api/Products/{id}/detail | 
[**apiProductsIdGet**](ProductsApi.md#apiproductsidget) | **GET** /api/Products/{id} | 
[**apiProductsIdMaterialRequirementsGet**](ProductsApi.md#apiproductsidmaterialrequirementsget) | **GET** /api/Products/{id}/material-requirements | 
[**apiProductsIdPut**](ProductsApi.md#apiproductsidput) | **PUT** /api/Products/{id} | 
[**apiProductsIdToggleStatusPatch**](ProductsApi.md#apiproductsidtogglestatuspatch) | **PATCH** /api/Products/{id}/toggle-status | 
[**apiProductsMaterialsMapByNameGet**](ProductsApi.md#apiproductsmaterialsmapbynameget) | **GET** /api/Products/materials-map-by-name | 
[**apiProductsMaterialsMapGet**](ProductsApi.md#apiproductsmaterialsmapget) | **GET** /api/Products/materials-map | 
[**apiProductsPost**](ProductsApi.md#apiproductspost) | **POST** /api/Products | 
[**apiProductsSearchSearchTermGet**](ProductsApi.md#apiproductssearchsearchtermget) | **GET** /api/Products/search/{searchTerm} | 
[**apiProductsTypeTypeGet**](ProductsApi.md#apiproductstypetypeget) | **GET** /api/Products/type/{type} | 


# **apiProductsActiveGet**
> BuiltList<ProductResponseDTO> apiProductsActiveGet()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();

try {
    final response = api.apiProductsActiveGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsActiveGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ProductResponseDTO&gt;**](ProductResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsCategoryCategoryGet**
> BuiltList<ProductResponseDTO> apiProductsCategoryCategoryGet(category)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final String category = category_example; // String | 

try {
    final response = api.apiProductsCategoryCategoryGet(category);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsCategoryCategoryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**|  | 

### Return type

[**BuiltList&lt;ProductResponseDTO&gt;**](ProductResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsGet**
> BuiltList<ProductResponseDTO> apiProductsGet()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();

try {
    final response = api.apiProductsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ProductResponseDTO&gt;**](ProductResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsIdAvailabilityGet**
> apiProductsIdAvailabilityGet(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final int id = 56; // int | 

try {
    api.apiProductsIdAvailabilityGet(id);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsIdAvailabilityGet: $e\n');
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

# **apiProductsIdDelete**
> apiProductsIdDelete(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final int id = 56; // int | 

try {
    api.apiProductsIdDelete(id);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsIdDelete: $e\n');
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

# **apiProductsIdDetailGet**
> ProductDetailDTO apiProductsIdDetailGet(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final int id = 56; // int | 

try {
    final response = api.apiProductsIdDetailGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsIdDetailGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ProductDetailDTO**](ProductDetailDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsIdGet**
> ProductResponseDTO apiProductsIdGet(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final int id = 56; // int | 

try {
    final response = api.apiProductsIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ProductResponseDTO**](ProductResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsIdMaterialRequirementsGet**
> BuiltMap<String, double> apiProductsIdMaterialRequirementsGet(id)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final int id = 56; // int | 

try {
    final response = api.apiProductsIdMaterialRequirementsGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsIdMaterialRequirementsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**BuiltMap&lt;String, double&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsIdPut**
> ProductResponseDTO apiProductsIdPut(id, productCode, productName, productType, category, price, description, isActive, imageUrl, contentType, contentDisposition, headers, length, name, fileName)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final int id = 56; // int | 
final String productCode = productCode_example; // String | 
final String productName = productName_example; // String | 
final String productType = productType_example; // String | 
final String category = category_example; // String | 
final double price = 1.2; // double | 
final String description = description_example; // String | 
final bool isActive = true; // bool | 
final String imageUrl = imageUrl_example; // String | 
final String contentType = contentType_example; // String | 
final String contentDisposition = contentDisposition_example; // String | 
final BuiltMap<String, BuiltList<String>> headers = ; // BuiltMap<String, BuiltList<String>> | 
final int length = 789; // int | 
final String name = name_example; // String | 
final String fileName = fileName_example; // String | 

try {
    final response = api.apiProductsIdPut(id, productCode, productName, productType, category, price, description, isActive, imageUrl, contentType, contentDisposition, headers, length, name, fileName);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **productCode** | **String**|  | [optional] 
 **productName** | **String**|  | [optional] 
 **productType** | **String**|  | [optional] 
 **category** | **String**|  | [optional] 
 **price** | **double**|  | [optional] 
 **description** | **String**|  | [optional] 
 **isActive** | **bool**|  | [optional] 
 **imageUrl** | **String**|  | [optional] 
 **contentType** | **String**|  | [optional] 
 **contentDisposition** | **String**|  | [optional] 
 **headers** | [**BuiltMap&lt;String, BuiltList&lt;String&gt;&gt;**](BuiltMap.md)|  | [optional] 
 **length** | **int**|  | [optional] 
 **name** | **String**|  | [optional] 
 **fileName** | **String**|  | [optional] 

### Return type

[**ProductResponseDTO**](ProductResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsIdToggleStatusPatch**
> apiProductsIdToggleStatusPatch(id, body)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final int id = 56; // int | 
final bool body = true; // bool | 

try {
    api.apiProductsIdToggleStatusPatch(id, body);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsIdToggleStatusPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **body** | **bool**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsMaterialsMapByNameGet**
> ProductMaterialMapDTO apiProductsMaterialsMapByNameGet()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();

try {
    final response = api.apiProductsMaterialsMapByNameGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsMaterialsMapByNameGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProductMaterialMapDTO**](ProductMaterialMapDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsMaterialsMapGet**
> BuiltMap<String, BuiltList<MaterialRequirementDTO>> apiProductsMaterialsMapGet()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();

try {
    final response = api.apiProductsMaterialsMapGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsMaterialsMapGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltMap&lt;String, BuiltList&lt;MaterialRequirementDTO&gt;&gt;**](BuiltList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsPost**
> ProductResponseDTO apiProductsPost(productCode, productName, productType, category, price, description, isActive, imageUrl, contentType, contentDisposition, headers, length, name, fileName)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final String productCode = productCode_example; // String | 
final String productName = productName_example; // String | 
final String productType = productType_example; // String | 
final String category = category_example; // String | 
final double price = 1.2; // double | 
final String description = description_example; // String | 
final bool isActive = true; // bool | 
final String imageUrl = imageUrl_example; // String | 
final String contentType = contentType_example; // String | 
final String contentDisposition = contentDisposition_example; // String | 
final BuiltMap<String, BuiltList<String>> headers = ; // BuiltMap<String, BuiltList<String>> | 
final int length = 789; // int | 
final String name = name_example; // String | 
final String fileName = fileName_example; // String | 

try {
    final response = api.apiProductsPost(productCode, productName, productType, category, price, description, isActive, imageUrl, contentType, contentDisposition, headers, length, name, fileName);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productCode** | **String**|  | [optional] 
 **productName** | **String**|  | [optional] 
 **productType** | **String**|  | [optional] 
 **category** | **String**|  | [optional] 
 **price** | **double**|  | [optional] 
 **description** | **String**|  | [optional] 
 **isActive** | **bool**|  | [optional] 
 **imageUrl** | **String**|  | [optional] 
 **contentType** | **String**|  | [optional] 
 **contentDisposition** | **String**|  | [optional] 
 **headers** | [**BuiltMap&lt;String, BuiltList&lt;String&gt;&gt;**](BuiltMap.md)|  | [optional] 
 **length** | **int**|  | [optional] 
 **name** | **String**|  | [optional] 
 **fileName** | **String**|  | [optional] 

### Return type

[**ProductResponseDTO**](ProductResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsSearchSearchTermGet**
> BuiltList<ProductResponseDTO> apiProductsSearchSearchTermGet(searchTerm)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final String searchTerm = searchTerm_example; // String | 

try {
    final response = api.apiProductsSearchSearchTermGet(searchTerm);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsSearchSearchTermGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchTerm** | **String**|  | 

### Return type

[**BuiltList&lt;ProductResponseDTO&gt;**](ProductResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductsTypeTypeGet**
> BuiltList<ProductResponseDTO> apiProductsTypeTypeGet(type)



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getProductsApi();
final String type = type_example; // String | 

try {
    final response = api.apiProductsTypeTypeGet(type);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProductsApi->apiProductsTypeTypeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | 

### Return type

[**BuiltList&lt;ProductResponseDTO&gt;**](ProductResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

