//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'material_create_dto.g.dart';

/// MaterialCreateDTO
///
/// Properties:
/// * [materialName] 
/// * [materialUnit] 
/// * [costPerUnit] 
/// * [stockQuantity] 
/// * [isConsumable] 
/// * [imageUrl] 
@BuiltValue()
abstract class MaterialCreateDTO implements Built<MaterialCreateDTO, MaterialCreateDTOBuilder> {
  @BuiltValueField(wireName: r'materialName')
  String? get materialName;

  @BuiltValueField(wireName: r'materialUnit')
  String? get materialUnit;

  @BuiltValueField(wireName: r'costPerUnit')
  double? get costPerUnit;

  @BuiltValueField(wireName: r'stockQuantity')
  double? get stockQuantity;

  @BuiltValueField(wireName: r'isConsumable')
  bool? get isConsumable;

  @BuiltValueField(wireName: r'imageUrl')
  String? get imageUrl;

  MaterialCreateDTO._();

  factory MaterialCreateDTO([void updates(MaterialCreateDTOBuilder b)]) = _$MaterialCreateDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MaterialCreateDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MaterialCreateDTO> get serializer => _$MaterialCreateDTOSerializer();
}

class _$MaterialCreateDTOSerializer implements PrimitiveSerializer<MaterialCreateDTO> {
  @override
  final Iterable<Type> types = const [MaterialCreateDTO, _$MaterialCreateDTO];

  @override
  final String wireName = r'MaterialCreateDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MaterialCreateDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.materialName != null) {
      yield r'materialName';
      yield serializers.serialize(
        object.materialName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.materialUnit != null) {
      yield r'materialUnit';
      yield serializers.serialize(
        object.materialUnit,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.costPerUnit != null) {
      yield r'costPerUnit';
      yield serializers.serialize(
        object.costPerUnit,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.stockQuantity != null) {
      yield r'stockQuantity';
      yield serializers.serialize(
        object.stockQuantity,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.isConsumable != null) {
      yield r'isConsumable';
      yield serializers.serialize(
        object.isConsumable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.imageUrl != null) {
      yield r'imageUrl';
      yield serializers.serialize(
        object.imageUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MaterialCreateDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MaterialCreateDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'materialName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.materialName = valueDes;
          break;
        case r'materialUnit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.materialUnit = valueDes;
          break;
        case r'costPerUnit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.costPerUnit = valueDes;
          break;
        case r'stockQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.stockQuantity = valueDes;
          break;
        case r'isConsumable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isConsumable = valueDes;
          break;
        case r'imageUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.imageUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MaterialCreateDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MaterialCreateDTOBuilder();
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

