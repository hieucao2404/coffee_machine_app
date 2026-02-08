//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:coffee_machine_api/src/date_serializer.dart';
import 'package:coffee_machine_api/src/model/date.dart';

import 'package:coffee_machine_api/src/model/complete_process_dto.dart';
import 'package:coffee_machine_api/src/model/material_create_dto.dart';
import 'package:coffee_machine_api/src/model/material_requirement_dto.dart';
import 'package:coffee_machine_api/src/model/material_response_dto.dart';
import 'package:coffee_machine_api/src/model/material_update_dto.dart';
import 'package:coffee_machine_api/src/model/material_usage_dto.dart';
import 'package:coffee_machine_api/src/model/operation_create_dto.dart';
import 'package:coffee_machine_api/src/model/operation_response_dto.dart';
import 'package:coffee_machine_api/src/model/operation_update_dto.dart';
import 'package:coffee_machine_api/src/model/process_operation_response_dto.dart';
import 'package:coffee_machine_api/src/model/process_response_dto.dart';
import 'package:coffee_machine_api/src/model/process_step_create_dto.dart';
import 'package:coffee_machine_api/src/model/process_summary_dto.dart';
import 'package:coffee_machine_api/src/model/processed_material_response_dto.dart';
import 'package:coffee_machine_api/src/model/product_detail_dto.dart';
import 'package:coffee_machine_api/src/model/product_material_map_dto.dart';
import 'package:coffee_machine_api/src/model/product_materials_dto.dart';
import 'package:coffee_machine_api/src/model/product_response_dto.dart';
import 'package:coffee_machine_api/src/model/stock_adjustment_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  CompleteProcessDTO,
  MaterialCreateDTO,
  MaterialRequirementDTO,
  MaterialResponseDTO,
  MaterialUpdateDTO,
  MaterialUsageDTO,
  OperationCreateDTO,
  OperationResponseDTO,
  OperationUpdateDTO,
  ProcessOperationResponseDTO,
  ProcessResponseDTO,
  ProcessStepCreateDTO,
  ProcessSummaryDTO,
  ProcessedMaterialResponseDTO,
  ProductDetailDTO,
  ProductMaterialMapDTO,
  ProductMaterialsDTO,
  ProductResponseDTO,
  StockAdjustmentDTO,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(StockAdjustmentDTO)]),
        () => ListBuilder<StockAdjustmentDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ProcessedMaterialResponseDTO)]),
        () => ListBuilder<ProcessedMaterialResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(OperationResponseDTO)]),
        () => ListBuilder<OperationResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(double)]),
        () => MapBuilder<String, double>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(MaterialResponseDTO)]),
        () => ListBuilder<MaterialResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ProductResponseDTO)]),
        () => ListBuilder<ProductResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(BuiltList)]),
        () => MapBuilder<String, BuiltList>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(BuiltMap)]),
        () => MapBuilder<String, BuiltMap>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ProcessOperationResponseDTO)]),
        () => ListBuilder<ProcessOperationResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ProcessResponseDTO)]),
        () => ListBuilder<ProcessResponseDTO>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
