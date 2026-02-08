import 'package:test/test.dart';
import 'package:coffee_machine_api/coffee_machine_api.dart';


/// tests for OperationsApi
void main() {
  final instance = CoffeeMachineApi().getOperationsApi();

  group(OperationsApi, () {
    //Future<BuiltList<OperationResponseDTO>> apiOperationsGet() async
    test('test apiOperationsGet', () async {
      // TODO
    });

    //Future apiOperationsIdDelete(int id) async
    test('test apiOperationsIdDelete', () async {
      // TODO
    });

    //Future<OperationResponseDTO> apiOperationsIdGet(int id) async
    test('test apiOperationsIdGet', () async {
      // TODO
    });

    //Future<OperationResponseDTO> apiOperationsIdPut(int id, { OperationUpdateDTO operationUpdateDTO }) async
    test('test apiOperationsIdPut', () async {
      // TODO
    });

    //Future<OperationResponseDTO> apiOperationsPost({ OperationCreateDTO operationCreateDTO }) async
    test('test apiOperationsPost', () async {
      // TODO
    });

    //Future<OperationResponseDTO> apiOperationsSearchNameGet(String name) async
    test('test apiOperationsSearchNameGet', () async {
      // TODO
    });

    //Future<BuiltList<OperationResponseDTO>> apiOperationsTypeTypeGet(String type) async
    test('test apiOperationsTypeTypeGet', () async {
      // TODO
    });

  });
}
