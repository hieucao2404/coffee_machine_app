//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:coffee_machine_api/src/model/product_materials_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_material_map_dto.g.dart';

/// ProductMaterialMapDTO
///
/// Properties:
/// * [products] 
@BuiltValue()
abstract class ProductMaterialMapDTO implements Built<ProductMaterialMapDTO, ProductMaterialMapDTOBuilder> {
  @BuiltValueField(wireName: r'products')
  BuiltMap<String, ProductMaterialsDTO>? get products;

  ProductMaterialMapDTO._();

  factory ProductMaterialMapDTO([void updates(ProductMaterialMapDTOBuilder b)]) = _$ProductMaterialMapDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProductMaterialMapDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProductMaterialMapDTO> get serializer => _$ProductMaterialMapDTOSerializer();
}

class _$ProductMaterialMapDTOSerializer implements PrimitiveSerializer<ProductMaterialMapDTO> {
  @override
  final Iterable<Type> types = const [ProductMaterialMapDTO, _$ProductMaterialMapDTO];

  @override
  final String wireName = r'ProductMaterialMapDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProductMaterialMapDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.products != null) {
      yield r'products';
      yield serializers.serialize(
        object.products,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(ProductMaterialsDTO)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProductMaterialMapDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProductMaterialMapDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'products':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(ProductMaterialsDTO)]),
          ) as BuiltMap<String, ProductMaterialsDTO>?;
          if (valueDes == null) continue;
          result.products.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProductMaterialMapDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductMaterialMapDTOBuilder();
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

