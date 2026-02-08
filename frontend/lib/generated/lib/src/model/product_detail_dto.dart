//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:coffee_machine_api/src/model/process_summary_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_detail_dto.g.dart';

/// ProductDetailDTO
///
/// Properties:
/// * [productId] 
/// * [productCode] 
/// * [productName] 
/// * [productType] 
/// * [category] 
/// * [price] 
/// * [description] 
/// * [isActive] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [processes] 
@BuiltValue()
abstract class ProductDetailDTO implements Built<ProductDetailDTO, ProductDetailDTOBuilder> {
  @BuiltValueField(wireName: r'productId')
  int? get productId;

  @BuiltValueField(wireName: r'productCode')
  String? get productCode;

  @BuiltValueField(wireName: r'productName')
  String? get productName;

  @BuiltValueField(wireName: r'productType')
  String? get productType;

  @BuiltValueField(wireName: r'category')
  String? get category;

  @BuiltValueField(wireName: r'price')
  double? get price;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: r'processes')
  BuiltList<ProcessSummaryDTO>? get processes;

  ProductDetailDTO._();

  factory ProductDetailDTO([void updates(ProductDetailDTOBuilder b)]) = _$ProductDetailDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProductDetailDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProductDetailDTO> get serializer => _$ProductDetailDTOSerializer();
}

class _$ProductDetailDTOSerializer implements PrimitiveSerializer<ProductDetailDTO> {
  @override
  final Iterable<Type> types = const [ProductDetailDTO, _$ProductDetailDTO];

  @override
  final String wireName = r'ProductDetailDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProductDetailDTO object, {
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
    if (object.productName != null) {
      yield r'productName';
      yield serializers.serialize(
        object.productName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.productType != null) {
      yield r'productType';
      yield serializers.serialize(
        object.productType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.category != null) {
      yield r'category';
      yield serializers.serialize(
        object.category,
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
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType(bool),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.processes != null) {
      yield r'processes';
      yield serializers.serialize(
        object.processes,
        specifiedType: const FullType.nullable(BuiltList, [FullType(ProcessSummaryDTO)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProductDetailDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProductDetailDTOBuilder result,
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
        case r'productName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.productName = valueDes;
          break;
        case r'productType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.productType = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.category = valueDes;
          break;
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.price = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'processes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ProcessSummaryDTO)]),
          ) as BuiltList<ProcessSummaryDTO>?;
          if (valueDes == null) continue;
          result.processes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProductDetailDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductDetailDTOBuilder();
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

