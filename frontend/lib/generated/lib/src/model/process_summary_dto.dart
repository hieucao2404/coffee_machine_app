//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'process_summary_dto.g.dart';

/// ProcessSummaryDTO
///
/// Properties:
/// * [processId] 
/// * [processName] 
/// * [stepCount] 
/// * [requiredMaterials] 
@BuiltValue()
abstract class ProcessSummaryDTO implements Built<ProcessSummaryDTO, ProcessSummaryDTOBuilder> {
  @BuiltValueField(wireName: r'processId')
  int? get processId;

  @BuiltValueField(wireName: r'processName')
  String? get processName;

  @BuiltValueField(wireName: r'stepCount')
  int? get stepCount;

  @BuiltValueField(wireName: r'requiredMaterials')
  BuiltList<String>? get requiredMaterials;

  ProcessSummaryDTO._();

  factory ProcessSummaryDTO([void updates(ProcessSummaryDTOBuilder b)]) = _$ProcessSummaryDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessSummaryDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessSummaryDTO> get serializer => _$ProcessSummaryDTOSerializer();
}

class _$ProcessSummaryDTOSerializer implements PrimitiveSerializer<ProcessSummaryDTO> {
  @override
  final Iterable<Type> types = const [ProcessSummaryDTO, _$ProcessSummaryDTO];

  @override
  final String wireName = r'ProcessSummaryDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessSummaryDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.processId != null) {
      yield r'processId';
      yield serializers.serialize(
        object.processId,
        specifiedType: const FullType(int),
      );
    }
    if (object.processName != null) {
      yield r'processName';
      yield serializers.serialize(
        object.processName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.stepCount != null) {
      yield r'stepCount';
      yield serializers.serialize(
        object.stepCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.requiredMaterials != null) {
      yield r'requiredMaterials';
      yield serializers.serialize(
        object.requiredMaterials,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessSummaryDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProcessSummaryDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'processId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.processId = valueDes;
          break;
        case r'processName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.processName = valueDes;
          break;
        case r'stepCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.stepCount = valueDes;
          break;
        case r'requiredMaterials':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.requiredMaterials.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessSummaryDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessSummaryDTOBuilder();
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

