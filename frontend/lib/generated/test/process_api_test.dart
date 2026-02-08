import 'package:test/test.dart';
import 'package:coffee_machine_api/coffee_machine_api.dart';


/// tests for ProcessApi
void main() {
  final instance = CoffeeMachineApi().getProcessApi();

  group(ProcessApi, () {
    //Future<ProcessResponseDTO> apiProcessCompletePost({ CompleteProcessDTO completeProcessDTO }) async
    test('test apiProcessCompletePost', () async {
      // TODO
    });

    //Future<ProcessResponseDTO> apiProcessProcessIdGet(int processId) async
    test('test apiProcessProcessIdGet', () async {
      // TODO
    });

    //Future<BuiltList<ProcessedMaterialResponseDTO>> apiProcessProcessIdMaterialsGet(int processId) async
    test('test apiProcessProcessIdMaterialsGet', () async {
      // TODO
    });

    //Future<BuiltList<ProcessOperationResponseDTO>> apiProcessProcessIdStepsGet(int processId) async
    test('test apiProcessProcessIdStepsGet', () async {
      // TODO
    });

    //Future<BuiltList<ProcessResponseDTO>> apiProcessProductProductIdGet(int productId) async
    test('test apiProcessProductProductIdGet', () async {
      // TODO
    });

  });
}
