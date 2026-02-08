//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'material_usage_dto.g.dart';

/// MaterialUsageDTO
///
/// Properties:
/// * [materialId] 
/// * [quantity] 
/// * [usageType] 
/// * [sequence] 
@BuiltValue()
abstract class MaterialUsageDTO implements Built<MaterialUsageDTO, MaterialUsageDTOBuilder> {
  @BuiltValueField(wireName: r'materialId')
  int? get materialId;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'usageType')
  String? get usageType;

  @BuiltValueField(wireName: r'sequence')
  int? get sequence;

  MaterialUsageDTO._();

  factory MaterialUsageDTO([void updates(MaterialUsageDTOBuilder b)]) = _$MaterialUsageDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MaterialUsageDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MaterialUsageDTO> get serializer => _$MaterialUsageDTOSerializer();
}

class _$MaterialUsageDTOSerializer implements PrimitiveSerializer<MaterialUsageDTO> {
  @override
  final Iterable<Type> types = const [MaterialUsageDTO, _$MaterialUsageDTO];

  @override
  final String wireName = r'MaterialUsageDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MaterialUsageDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.materialId != null) {
      yield r'materialId';
      yield serializers.serialize(
        object.materialId,
        specifiedType: const FullType(int),
      );
    }
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType(double),
      );
    }
    if (object.usageType != null) {
      yield r'usageType';
      yield serializers.serialize(
        object.usageType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sequence != null) {
      yield r'sequence';
      yield serializers.serialize(
        object.sequence,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MaterialUsageDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MaterialUsageDTOBuilder result,
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
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.quantity = valueDes;
          break;
        case r'usageType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.usageType = valueDes;
          break;
        case r'sequence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sequence = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MaterialUsageDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MaterialUsageDTOBuilder();
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

