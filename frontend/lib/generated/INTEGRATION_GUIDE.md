# Coffee Machine API Integration Guide

This directory contains **auto-generated** Dart models and API clients from your .NET backend Swagger spec.

## ✅ What Was Generated

### Models (lib/src/model/)
All your C# DTOs are now available as Dart classes:
- `ProductResponseDTO` → `product_response_dto.dart`
- `ProductDetailDTO` → `product_detail_dto.dart`
- `MaterialResponseDTO` → `material_response_dto.dart`
- `ProcessResponseDTO` → `process_response_dto.dart`
- And 15+ more...

### API Clients (lib/src/api/)
- `ProductsApi` - All product endpoints
- `MaterialsApi` - Material inventory management
- `BrewApi` - Brewing operations
- `ProcessApi` - Process management
- `OperationsApi` - Operation management

## 🔄 Regenerating Models

When your backend DTOs change, regenerate with:

```bash
cd frontend
docker run --rm --network=host -v "${PWD}:/local" \
  openapitools/openapi-generator-cli generate \
  -i http://localhost:5000/swagger/v1/swagger.json \
  -g dart-dio \
  -o /local/lib/generated \
  --additional-properties=pubName=coffee_machine_api,nullSafe=true
```

**Important:** Make sure your backend is running first!

## 📖 Usage Example

```dart
import 'package:coffee_machine_api/coffee_machine_api.dart';
import 'package:dio/dio.dart';

// Initialize API client
final dio = Dio(BaseOptions(baseUrl: 'http://localhost:5000'));
final productsApi = ProductsApi(dio);

// Fetch all products
final products = await productsApi.apiProductsGet();
print('Products: ${products.data}');

// Get product detail
final productDetail = await productsApi.apiProductsIdDetailGet(id: 1);
print('Product: ${productDetail.data?.productName}');

// Create material with image
final formData = FormData.fromMap({
  'MaterialName': 'Arabica Beans',
  'MaterialUnit': 'g',
  'StockQuantity': 1000,
  'IsConsumable': true,
  'image': await MultipartFile.fromFile('path/to/image.jpg'),
});
await materialsApi.apiMaterialPost(body: formData);
```

## 🏗️ Integration with Your App

### Don't use generated code directly in UI
Create wrapper services:

```dart
// lib/services/product_service.dart
class ProductService {
  final ProductsApi _api;
  
  ProductService(this._api);
  
  Future<List<ProductResponseDTO>> getAllProducts() async {
    final response = await _api.apiProductsGet();
    return response.data ?? [];
  }
  
  Future<ProductDetailDTO?> getProductDetail(int id) async {
    final response = await _api.apiProductsIdDetailGet(id: id);
    return response.data;
  }
}
```

Then use with Riverpod providers in your app.

## 📁 File Structure

```
lib/generated/
├── lib/
│   ├── coffee_machine_api.dart      # Main export
│   └── src/
│       ├── model/                    # All DTOs
│       └── api/                      # API clients
├── doc/                              # API documentation
└── test/                             # Generated tests
```

## ⚠️ Important Notes

1. **Never edit generated files directly** - They will be overwritten
2. **Always regenerate after backend changes**
3. **Use wrapper services** - Don't expose generated API directly to UI
4. **Check generated method names** - They're auto-generated from endpoints

