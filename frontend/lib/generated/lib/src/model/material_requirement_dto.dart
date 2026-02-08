//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'material_requirement_dto.g.dart';

/// MaterialRequirementDTO
///
/// Properties:
/// * [materialId] 
/// * [materialName] 
/// * [quantity] 
/// * [unit] 
/// * [usageType] 
@BuiltValue()
abstract class MaterialRequirementDTO implements Built<MaterialRequirementDTO, MaterialRequirementDTOBuilder> {
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

  MaterialRequirementDTO._();

  factory MaterialRequirementDTO([void updates(MaterialRequirementDTOBuilder b)]) = _$MaterialRequirementDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MaterialRequirementDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MaterialRequirementDTO> get serializer => _$MaterialRequirementDTOSerializer();
}

class _$MaterialRequirementDTOSerializer implements PrimitiveSerializer<MaterialRequirementDTO> {
  @override
  final Iterable<Type> types = const [MaterialRequirementDTO, _$MaterialRequirementDTO];

  @override
  final String wireName = r'MaterialRequirementDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MaterialRequirementDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    MaterialRequirementDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MaterialRequirementDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  MaterialRequirementDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MaterialRequirementDTOBuilder();
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

