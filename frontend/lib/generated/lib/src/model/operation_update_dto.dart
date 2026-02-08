//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'operation_update_dto.g.dart';

/// OperationUpdateDTO
///
/// Properties:
/// * [operationName] 
/// * [type] 
@BuiltValue()
abstract class OperationUpdateDTO implements Built<OperationUpdateDTO, OperationUpdateDTOBuilder> {
  @BuiltValueField(wireName: r'operationName')
  String? get operationName;

  @BuiltValueField(wireName: r'type')
  String? get type;

  OperationUpdateDTO._();

  factory OperationUpdateDTO([void updates(OperationUpdateDTOBuilder b)]) = _$OperationUpdateDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OperationUpdateDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OperationUpdateDTO> get serializer => _$OperationUpdateDTOSerializer();
}

class _$OperationUpdateDTOSerializer implements PrimitiveSerializer<OperationUpdateDTO> {
  @override
  final Iterable<Type> types = const [OperationUpdateDTO, _$OperationUpdateDTO];

  @override
  final String wireName = r'OperationUpdateDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OperationUpdateDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.operationName != null) {
      yield r'operationName';
      yield serializers.serialize(
        object.operationName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OperationUpdateDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OperationUpdateDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'operationName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.operationName = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OperationUpdateDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OperationUpdateDTOBuilder();
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

