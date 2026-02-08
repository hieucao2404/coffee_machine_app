//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'process_operation_response_dto.g.dart';

/// ProcessOperationResponseDTO
///
/// Properties:
/// * [processOperationId] 
/// * [processId] 
/// * [operationId] 
/// * [operationName] 
/// * [operationType] 
/// * [sequence] 
/// * [speed] 
/// * [temperature] 
/// * [duration] 
/// * [currentLimitMa] 
/// * [targetPosition] 
/// * [stopCondition] 
@BuiltValue()
abstract class ProcessOperationResponseDTO implements Built<ProcessOperationResponseDTO, ProcessOperationResponseDTOBuilder> {
  @BuiltValueField(wireName: r'processOperationId')
  int? get processOperationId;

  @BuiltValueField(wireName: r'processId')
  int? get processId;

  @BuiltValueField(wireName: r'operationId')
  int? get operationId;

  @BuiltValueField(wireName: r'operationName')
  String? get operationName;

  @BuiltValueField(wireName: r'operationType')
  String? get operationType;

  @BuiltValueField(wireName: r'sequence')
  int? get sequence;

  @BuiltValueField(wireName: r'speed')
  int? get speed;

  @BuiltValueField(wireName: r'temperature')
  double? get temperature;

  @BuiltValueField(wireName: r'duration')
  int? get duration;

  @BuiltValueField(wireName: r'currentLimitMa')
  int? get currentLimitMa;

  @BuiltValueField(wireName: r'targetPosition')
  int? get targetPosition;

  @BuiltValueField(wireName: r'stopCondition')
  String? get stopCondition;

  ProcessOperationResponseDTO._();

  factory ProcessOperationResponseDTO([void updates(ProcessOperationResponseDTOBuilder b)]) = _$ProcessOperationResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessOperationResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessOperationResponseDTO> get serializer => _$ProcessOperationResponseDTOSerializer();
}

class _$ProcessOperationResponseDTOSerializer implements PrimitiveSerializer<ProcessOperationResponseDTO> {
  @override
  final Iterable<Type> types = const [ProcessOperationResponseDTO, _$ProcessOperationResponseDTO];

  @override
  final String wireName = r'ProcessOperationResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessOperationResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.processOperationId != null) {
      yield r'processOperationId';
      yield serializers.serialize(
        object.processOperationId,
        specifiedType: const FullType(int),
      );
    }
    if (object.processId != null) {
      yield r'processId';
      yield serializers.serialize(
        object.processId,
        specifiedType: const FullType(int),
      );
    }
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
    if (object.operationType != null) {
      yield r'operationType';
      yield serializers.serialize(
        object.operationType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sequence != null) {
      yield r'sequence';
      yield serializers.serialize(
        object.sequence,
        specifiedType: const FullType(int),
      );
    }
    if (object.speed != null) {
      yield r'speed';
      yield serializers.serialize(
        object.speed,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.temperature != null) {
      yield r'temperature';
      yield serializers.serialize(
        object.temperature,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.duration != null) {
      yield r'duration';
      yield serializers.serialize(
        object.duration,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.currentLimitMa != null) {
      yield r'currentLimitMa';
      yield serializers.serialize(
        object.currentLimitMa,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.targetPosition != null) {
      yield r'targetPosition';
      yield serializers.serialize(
        object.targetPosition,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.stopCondition != null) {
      yield r'stopCondition';
      yield serializers.serialize(
        object.stopCondition,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessOperationResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProcessOperationResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'processOperationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.processOperationId = valueDes;
          break;
        case r'processId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.processId = valueDes;
          break;
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
        case r'operationType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.operationType = valueDes;
          break;
        case r'sequence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sequence = valueDes;
          break;
        case r'speed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.speed = valueDes;
          break;
        case r'temperature':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.temperature = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.duration = valueDes;
          break;
        case r'currentLimitMa':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.currentLimitMa = valueDes;
          break;
        case r'targetPosition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.targetPosition = valueDes;
          break;
        case r'stopCondition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stopCondition = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessOperationResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessOperationResponseDTOBuilder();
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

