import 'package:test/test.dart';
import 'package:coffee_machine_api/coffee_machine_api.dart';


/// tests for ProductsApi
void main() {
  final instance = CoffeeMachineApi().getProductsApi();

  group(ProductsApi, () {
    //Future<BuiltList<ProductResponseDTO>> apiProductsActiveGet() async
    test('test apiProductsActiveGet', () async {
      // TODO
    });

    //Future<BuiltList<ProductResponseDTO>> apiProductsCategoryCategoryGet(String category) async
    test('test apiProductsCategoryCategoryGet', () async {
      // TODO
    });

    //Future<BuiltList<ProductResponseDTO>> apiProductsGet() async
    test('test apiProductsGet', () async {
      // TODO
    });

    //Future apiProductsIdAvailabilityGet(int id) async
    test('test apiProductsIdAvailabilityGet', () async {
      // TODO
    });

    //Future apiProductsIdDelete(int id) async
    test('test apiProductsIdDelete', () async {
      // TODO
    });

    //Future<ProductDetailDTO> apiProductsIdDetailGet(int id) async
    test('test apiProductsIdDetailGet', () async {
      // TODO
    });

    //Future<ProductResponseDTO> apiProductsIdGet(int id) async
    test('test apiProductsIdGet', () async {
      // TODO
    });

    //Future<BuiltMap<String, double>> apiProductsIdMaterialRequirementsGet(int id) async
    test('test apiProductsIdMaterialRequirementsGet', () async {
      // TODO
    });

    //Future<ProductResponseDTO> apiProductsIdPut(int id, { String productCode, String productName, String productType, String category, double price, String description, bool isActive, String imageUrl, String contentType, String contentDisposition, BuiltMap<String, BuiltList<String>> headers, int length, String name, String fileName }) async
    test('test apiProductsIdPut', () async {
      // TODO
    });

    //Future apiProductsIdToggleStatusPatch(int id, { bool body }) async
    test('test apiProductsIdToggleStatusPatch', () async {
      // TODO
    });

    //Future<ProductMaterialMapDTO> apiProductsMaterialsMapByNameGet() async
    test('test apiProductsMaterialsMapByNameGet', () async {
      // TODO
    });

    //Future<BuiltMap<String, BuiltList<MaterialRequirementDTO>>> apiProductsMaterialsMapGet() async
    test('test apiProductsMaterialsMapGet', () async {
      // TODO
    });

    //Future<ProductResponseDTO> apiProductsPost({ String productCode, String productName, String productType, String category, double price, String description, bool isActive, String imageUrl, String contentType, String contentDisposition, BuiltMap<String, BuiltList<String>> headers, int length, String name, String fileName }) async
    test('test apiProductsPost', () async {
      // TODO
    });

    //Future<BuiltList<ProductResponseDTO>> apiProductsSearchSearchTermGet(String searchTerm) async
    test('test apiProductsSearchSearchTermGet', () async {
      // TODO
    });

    //Future<BuiltList<ProductResponseDTO>> apiProductsTypeTypeGet(String type) async
    test('test apiProductsTypeTypeGet', () async {
      // TODO
    });

  });
}
