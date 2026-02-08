//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'processed_material_response_dto.g.dart';

/// ProcessedMaterialResponseDTO
///
/// Properties:
/// * [processId] 
/// * [materialId] 
/// * [materialName] 
/// * [quantity] 
/// * [unit] 
/// * [usageType] 
@BuiltValue()
abstract class ProcessedMaterialResponseDTO implements Built<ProcessedMaterialResponseDTO, ProcessedMaterialResponseDTOBuilder> {
  @BuiltValueField(wireName: r'processId')
  int? get processId;

  @BuiltValueField(wireName: r'materialId')
  int? get materialId;

  @BuiltValueField(wireName: r'materialName')
  String? get materialName;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'unit')
  String? get unit;

  @BuiltValueField(wireName: r'usageType')
  String? get usageType;

  ProcessedMaterialResponseDTO._();

  factory ProcessedMaterialResponseDTO([void updates(ProcessedMaterialResponseDTOBuilder b)]) = _$ProcessedMaterialResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessedMaterialResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessedMaterialResponseDTO> get serializer => _$ProcessedMaterialResponseDTOSerializer();
}

class _$ProcessedMaterialResponseDTOSerializer implements PrimitiveSerializer<ProcessedMaterialResponseDTO> {
  @override
  final Iterable<Type> types = const [ProcessedMaterialResponseDTO, _$ProcessedMaterialResponseDTO];

  @override
  final String wireName = r'ProcessedMaterialResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessedMaterialResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.processId != null) {
      yield r'processId';
      yield serializers.serialize(
        object.processId,
        specifiedType: const FullType(int),
      );
    }
    if (object.materialId != null) {
      yield r'materialId';
      yield serializers.serialize(
        object.materialId,
        specifiedType: const FullType(int),
      );
    }
    if (object.materialName != null) {
      yield r'materialName';
      yield serializers.serialize(
        object.materialName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType(double),
      );
    }
    if (object.unit != null) {
      yield r'unit';
      yield serializers.serialize(
        object.unit,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.usageType != null) {
      yield r'usageType';
      yield serializers.serialize(
        object.usageType,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessedMaterialResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProcessedMaterialResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'processId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.processId = valueDes;
          break;
        case r'materialId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.materialId = valueDes;
          break;
        case r'materialName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.materialName = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.quantity = valueDes;
          break;
        case r'unit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.unit = valueDes;
          break;
        case r'usageType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.usageType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessedMaterialResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessedMaterialResponseDTOBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

