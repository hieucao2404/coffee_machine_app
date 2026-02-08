// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_create_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OperationCreateDTO extends OperationCreateDTO {
  @override
  final String? operationName;
  @override
  final String? type;

  factory _$OperationCreateDTO(
          [void Function(OperationCreateDTOBuilder)? updates]) =>
      (OperationCreateDTOBuilder()..update(updates))._build();

  _$OperationCreateDTO._({this.operationName, this.type}) : super._();
  @override
  OperationCreateDTO rebuild(
          void Function(OperationCreateDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OperationCreateDTOBuilder toBuilder() =>
      OperationCreateDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OperationCreateDTO &&
        operationName == other.operationName &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, operationName.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OperationCreateDTO')
          ..add('operationName', operationName)
          ..add('type', type))
        .toString();
  }
}

class OperationCreateDTOBuilder
    implements Builder<OperationCreateDTO, OperationCreateDTOBuilder> {
  _$OperationCreateDTO? _$v;

  String? _operationName;
  String? get operationName => _$this._operationName;
  set operationName(String? operationName) =>
      _$this._operationName = operationName;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  OperationCreateDTOBuilder() {
    OperationCreateDTO._defaults(this);
  }

  OperationCreateDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _operationName = $v.operationName;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OperationCreateDTO other) {
    _$v = other as _$OperationCreateDTO;
  }

  @override
  void update(void Function(OperationCreateDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OperationCreateDTO build() => _build();

  _$OperationCreateDTO _build() {
    final _$result = _$v ??
        _$OperationCreateDTO._(
          operationName: operationName,
          type: type,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
