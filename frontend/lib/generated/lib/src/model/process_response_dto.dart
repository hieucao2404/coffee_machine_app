//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'process_response_dto.g.dart';

/// ProcessResponseDTO
///
/// Properties:
/// * [processId] 
/// * [productId] 
/// * [productName] 
/// * [version] 
/// * [type] 
/// * [note] 
/// * [isDefault] 
@BuiltValue()
abstract class ProcessResponseDTO implements Built<ProcessResponseDTO, ProcessResponseDTOBuilder> {
  @BuiltValueField(wireName: r'processId')
  int? get processId;

  @BuiltValueField(wireName: r'productId')
  int? get productId;

  @BuiltValueField(wireName: r'productName')
  String? get productName;

  @BuiltValueField(wireName: r'version')
  int? get version;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'note')
  String? get note;

  @BuiltValueField(wireName: r'isDefault')
  bool? get isDefault;

  ProcessResponseDTO._();

  factory ProcessResponseDTO([void updates(ProcessResponseDTOBuilder b)]) = _$ProcessResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessResponseDTO> get serializer => _$ProcessResponseDTOSerializer();
}

class _$ProcessResponseDTOSerializer implements PrimitiveSerializer<ProcessResponseDTO> {
  @override
  final Iterable<Type> types = const [ProcessResponseDTO, _$ProcessResponseDTO];

  @override
  final String wireName = r'ProcessResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.processId != null) {
      yield r'processId';
      yield serializers.serialize(
        object.processId,
        specifiedType: const FullType(int),
      );
    }
    if (object.productId != null) {
      yield r'productId';
      yield serializers.serialize(
        object.productId,
        specifiedType: const FullType(int),
      );
    }
    if (object.productName != null) {
      yield r'productName';
      yield serializers.serialize(
        object.productName,
        specifiedType: const FullType.nullable(String),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProcessResponseDTOBuilder result,
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
        case r'productId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.productId = valueDes;
          break;
        case r'productName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.productName = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessResponseDTOBuilder();
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

