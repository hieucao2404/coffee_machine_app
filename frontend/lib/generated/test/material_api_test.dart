import 'package:test/test.dart';
import 'package:coffee_machine_api/coffee_machine_api.dart';


/// tests for MaterialApi
void main() {
  final instance = CoffeeMachineApi().getMaterialApi();

  group(MaterialApi, () {
    //Future<BuiltList<MaterialResponseDTO>> apiMaterialGet() async
    test('test apiMaterialGet', () async {
      // TODO
    });

    //Future apiMaterialIdDelete(int id) async
    test('test apiMaterialIdDelete', () async {
      // TODO
    });

    //Future<MaterialResponseDTO> apiMaterialIdGet(int id) async
    test('test apiMaterialIdGet', () async {
      // TODO
    });

    //Future<MaterialResponseDTO> apiMaterialIdPut(int id, { String materialName, String materialUnit, double costPerUnit, double stockQuantity, bool isConsumable, String imageUrl, String contentType, String contentDisposition, BuiltMap<String, BuiltList<String>> headers, int length, String name, String fileName }) async
    test('test apiMaterialIdPut', () async {
      // TODO
    });

    //Future<MaterialResponseDTO> apiMaterialPost({ String materialName, String materialUnit, double costPerUnit, double stockQuantity, bool isConsumable, String imageUrl, String contentType, String contentDisposition, BuiltMap<String, BuiltList<String>> headers, int length, String name, String fileName }) async
    test('test apiMaterialPost', () async {
      // TODO
    });

  });
}
