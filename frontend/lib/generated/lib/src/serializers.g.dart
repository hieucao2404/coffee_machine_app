// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(CompleteProcessDTO.serializer)
      ..add(MaterialCreateDTO.serializer)
      ..add(MaterialRequirementDTO.serializer)
      ..add(MaterialResponseDTO.serializer)
      ..add(MaterialUpdateDTO.serializer)
      ..add(MaterialUsageDTO.serializer)
      ..add(OperationCreateDTO.serializer)
      ..add(OperationResponseDTO.serializer)
      ..add(OperationUpdateDTO.serializer)
      ..add(ProcessOperationResponseDTO.serializer)
      ..add(ProcessResponseDTO.serializer)
      ..add(ProcessStepCreateDTO.serializer)
      ..add(ProcessSummaryDTO.serializer)
      ..add(ProcessedMaterialResponseDTO.serializer)
      ..add(ProductDetailDTO.serializer)
      ..add(ProductMaterialMapDTO.serializer)
      ..add(ProductMaterialsDTO.serializer)
      ..add(ProductResponseDTO.serializer)
      ..add(StockAdjustmentDTO.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(MaterialRequirementDTO)]),
          () => ListBuilder<MaterialRequirementDTO>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProcessStepCreateDTO)]),
          () => ListBuilder<ProcessStepCreateDTO>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(MaterialUsageDTO)]),
          () => ListBuilder<MaterialUsageDTO>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ProcessSummaryDTO)]),
          () => ListBuilder<ProcessSummaryDTO>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(ProductMaterialsDTO)
          ]),
          () => MapBuilder<String, ProductMaterialsDTO>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
