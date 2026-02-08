import 'package:test/test.dart';
import 'package:coffee_machine_api/coffee_machine_api.dart';


/// tests for MaterialsApi
void main() {
  final instance = CoffeeMachineApi().getMaterialsApi();

  group(MaterialsApi, () {
    //Future<MaterialResponseDTO> apiMaterialsAdjustStockPost({ StockAdjustmentDTO stockAdjustmentDTO }) async
    test('test apiMaterialsAdjustStockPost', () async {
      // TODO
    });

    //Future apiMaterialsBulkAdjustStockPost({ BuiltList<StockAdjustmentDTO> stockAdjustmentDTO }) async
    test('test apiMaterialsBulkAdjustStockPost', () async {
      // TODO
    });

    //Future<BuiltList<MaterialResponseDTO>> apiMaterialsConsumableGet() async
    test('test apiMaterialsConsumableGet', () async {
      // TODO
    });

    //Future<BuiltList<MaterialResponseDTO>> apiMaterialsGet() async
    test('test apiMaterialsGet', () async {
      // TODO
    });

    //Future apiMaterialsIdDelete(int id) async
    test('test apiMaterialsIdDelete', () async {
      // TODO
    });

    //Future<MaterialResponseDTO> apiMaterialsIdGet(int id) async
    test('test apiMaterialsIdGet', () async {
      // TODO
    });

    //Future<MaterialResponseDTO> apiMaterialsIdPut(int id, { MaterialUpdateDTO materialUpdateDTO }) async
    test('test apiMaterialsIdPut', () async {
      // TODO
    });

    //Future<BuiltList<MaterialResponseDTO>> apiMaterialsLowStockGet({ double threshold }) async
    test('test apiMaterialsLowStockGet', () async {
      // TODO
    });

    //Future<MaterialResponseDTO> apiMaterialsPost({ MaterialCreateDTO materialCreateDTO }) async
    test('test apiMaterialsPost', () async {
      // TODO
    });

    //Future<MaterialResponseDTO> apiMaterialsSearchNameGet(String name) async
    test('test apiMaterialsSearchNameGet', () async {
      // TODO
    });

  });
}
