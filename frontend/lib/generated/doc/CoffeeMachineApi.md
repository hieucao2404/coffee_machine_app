# coffee_machine_api.api.CoffeeMachineApi

## Load the API package
```dart
import 'package:coffee_machine_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**welcome**](CoffeeMachineApi.md#welcome) | **GET** / | 


# **welcome**
> welcome()



### Example
```dart
import 'package:coffee_machine_api/api.dart';

final api = CoffeeMachineApi().getCoffeeMachineApi();

try {
    api.welcome();
} on DioException catch (e) {
    print('Exception when calling CoffeeMachineApi->welcome: $e\n');
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

