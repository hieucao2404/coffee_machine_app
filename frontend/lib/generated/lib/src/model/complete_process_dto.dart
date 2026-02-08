//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:coffee_machine_api/src/model/material_usage_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:coffee_machine_api/src/model/process_step_create_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'complete_process_dto.g.dart';

/// CompleteProcessDTO
///
/// Properties:
/// * [productId] 
/// * [version] 
/// * [type] 
/// * [note] 
/// * [isDefault] 
/// * [steps] 
/// * [materials] 
@BuiltValue()
abstract class CompleteProcessDTO implements Built<CompleteProcessDTO, CompleteProcessDTOBuilder> {
  @BuiltValueField(wireName: r'productId')
  int? get productId;

  @BuiltValueField(wireName: r'version')
  int? get version;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'note')
  String? get note;

  @BuiltValueField(wireName: r'isDefault')
  bool? get isDefault;

  @BuiltValueField(wireName: r'steps')
  BuiltList<ProcessStepCreateDTO>? get steps;

  @BuiltValueField(wireName: r'materials')
  BuiltList<MaterialUsageDTO>? get materials;

  CompleteProcessDTO._();

  factory CompleteProcessDTO([void updates(CompleteProcessDTOBuilder b)]) = _$CompleteProcessDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CompleteProcessDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CompleteProcessDTO> get serializer => _$CompleteProcessDTOSerializer();
}

class _$CompleteProcessDTOSerializer implements PrimitiveSerializer<CompleteProcessDTO> {
  @override
  final Iterable<Type> types = const [CompleteProcessDTO, _$CompleteProcessDTO];

  @override
  final String wireName = r'CompleteProcessDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CompleteProcessDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.productId != null) {
      yield r'productId';
      yield serializers.serialize(
        object.productId,
        specifiedType: const FullType(int),
      );
    }
    if (object.version != null) {
      yield r'version';
      yield serializers.serialize(
        object.version,
        specifiedType: const FullType(int),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.note != null) {
      yield r'note';
      yield serializers.serialize(
        object.note,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isDefault != null) {
      yield r'isDefault';
      yield serializers.serialize(
        object.isDefault,
        specifiedType: const FullType(bool),
      );
    }
    if (object.steps != null) {
      yield r'steps';
      yield serializers.serialize(
        object.steps,
        specifiedType: const FullType.nullable(BuiltList, [FullType(ProcessStepCreateDTO)]),
      );
    }
    if (object.materials != null) {
      yield r'materials';
      yield serializers.serialize(
        object.materials,
        specifiedType: const FullType.nullable(BuiltList, [FullType(MaterialUsageDTO)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CompleteProcessDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CompleteProcessDTOBuilder result,
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
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.version = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        case r'note':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.note = valueDes;
          break;
        case r'isDefault':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isDefault = valueDes;
          break;
        case r'steps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ProcessStepCreateDTO)]),
          ) as BuiltList<ProcessStepCreateDTO>?;
          if (valueDes == null) continue;
          result.steps.replace(valueDes);
          break;
        case r'materials':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MaterialUsageDTO)]),
          ) as BuiltList<MaterialUsageDTO>?;
          if (valueDes == null) continue;
          result.materials.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CompleteProcessDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CompleteProcessDTOBuilder();
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

