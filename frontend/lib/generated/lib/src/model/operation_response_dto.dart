//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'operation_response_dto.g.dart';

/// OperationResponseDTO
///
/// Properties:
/// * [operationId] 
/// * [operationName] 
/// * [type] 
@BuiltValue()
abstract class OperationResponseDTO implements Built<OperationResponseDTO, OperationResponseDTOBuilder> {
  @BuiltValueField(wireName: r'operationId')
  int? get operationId;

  @BuiltValueField(wireName: r'operationName')
  String? get operationName;

  @BuiltValueField(wireName: r'type')
  String? get type;

  OperationResponseDTO._();

  factory OperationResponseDTO([void updates(OperationResponseDTOBuilder b)]) = _$OperationResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OperationResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OperationResponseDTO> get serializer => _$OperationResponseDTOSerializer();
}

class _$OperationResponseDTOSerializer implements PrimitiveSerializer<OperationResponseDTO> {
  @override
  final Iterable<Type> types = const [OperationResponseDTO, _$OperationResponseDTO];

  @override
  final String wireName = r'OperationResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OperationResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.operationId != null) {
      yield r'operationId';
      yield serializers.serialize(
        object.operationId,
        specifiedType: const FullType(int),
      );
    }
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
    OperationResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OperationResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'operationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.operationId = valueDes;
          break;
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
  OperationResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OperationResponseDTOBuilder();
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

