//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_adjustment_dto.g.dart';

/// StockAdjustmentDTO
///
/// Properties:
/// * [materialId] 
/// * [adjustmentQuantity] 
/// * [adjustmentType] 
/// * [notes] 
@BuiltValue()
abstract class StockAdjustmentDTO implements Built<StockAdjustmentDTO, StockAdjustmentDTOBuilder> {
  @BuiltValueField(wireName: r'materialId')
  int? get materialId;

  @BuiltValueField(wireName: r'adjustmentQuantity')
  double? get adjustmentQuantity;

  @BuiltValueField(wireName: r'adjustmentType')
  String? get adjustmentType;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  StockAdjustmentDTO._();

  factory StockAdjustmentDTO([void updates(StockAdjustmentDTOBuilder b)]) = _$StockAdjustmentDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockAdjustmentDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockAdjustmentDTO> get serializer => _$StockAdjustmentDTOSerializer();
}

class _$StockAdjustmentDTOSerializer implements PrimitiveSerializer<StockAdjustmentDTO> {
  @override
  final Iterable<Type> types = const [StockAdjustmentDTO, _$StockAdjustmentDTO];

  @override
  final String wireName = r'StockAdjustmentDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockAdjustmentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.materialId != null) {
      yield r'materialId';
      yield serializers.serialize(
        object.materialId,
        specifiedType: const FullType(int),
      );
    }
    if (object.adjustmentQuantity != null) {
      yield r'adjustmentQuantity';
      yield serializers.serialize(
        object.adjustmentQuantity,
        specifiedType: const FullType(double),
      );
    }
    if (object.adjustmentType != null) {
      yield r'adjustmentType';
      yield serializers.serialize(
        object.adjustmentType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StockAdjustmentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StockAdjustmentDTOBuilder result,
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
        case r'adjustmentQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.adjustmentQuantity = valueDes;
          break;
        case r'adjustmentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.adjustmentType = valueDes;
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.notes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockAdjustmentDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockAdjustmentDTOBuilder();
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

