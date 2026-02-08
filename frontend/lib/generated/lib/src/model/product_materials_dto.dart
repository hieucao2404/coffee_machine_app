//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:coffee_machine_api/src/model/material_requirement_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_materials_dto.g.dart';

/// ProductMaterialsDTO
///
/// Properties:
/// * [productId] 
/// * [productCode] 
/// * [price] 
/// * [materials] 
/// * [stepCount] 
@BuiltValue()
abstract class ProductMaterialsDTO implements Built<ProductMaterialsDTO, ProductMaterialsDTOBuilder> {
  @BuiltValueField(wireName: r'productId')
  int? get productId;

  @BuiltValueField(wireName: r'productCode')
  String? get productCode;

  @BuiltValueField(wireName: r'price')
  double? get price;

  @BuiltValueField(wireName: r'materials')
  BuiltList<MaterialRequirementDTO>? get materials;

  @BuiltValueField(wireName: r'stepCount')
  int? get stepCount;

  ProductMaterialsDTO._();

  factory ProductMaterialsDTO([void updates(ProductMaterialsDTOBuilder b)]) = _$ProductMaterialsDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProductMaterialsDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProductMaterialsDTO> get serializer => _$ProductMaterialsDTOSerializer();
}

class _$ProductMaterialsDTOSerializer implements PrimitiveSerializer<ProductMaterialsDTO> {
  @override
  final Iterable<Type> types = const [ProductMaterialsDTO, _$ProductMaterialsDTO];

  @override
  final String wireName = r'ProductMaterialsDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProductMaterialsDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.productId != null) {
      yield r'productId';
      yield serializers.serialize(
        object.productId,
        specifiedType: const FullType(int),
      );
    }
    if (object.productCode != null) {
      yield r'productCode';
      yield serializers.serialize(
        object.productCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.price != null) {
      yield r'price';
      yield serializers.serialize(
        object.price,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.materials != null) {
      yield r'materials';
      yield serializers.serialize(
        object.materials,
        specifiedType: const FullType.nullable(BuiltList, [FullType(MaterialRequirementDTO)]),
      );
    }
    if (object.stepCount != null) {
      yield r'stepCount';
      yield serializers.serialize(
        object.stepCount,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProductMaterialsDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProductMaterialsDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'productId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.productId = valueDes;
          break;
        case r'productCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.productCode = valueDes;
          break;
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.price = valueDes;
          break;
        case r'materials':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MaterialRequirementDTO)]),
          ) as BuiltList<MaterialRequirementDTO>?;
          if (valueDes == null) continue;
          result.materials.replace(valueDes);
          break;
        case r'stepCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.stepCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProductMaterialsDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductMaterialsDTOBuilder();
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

