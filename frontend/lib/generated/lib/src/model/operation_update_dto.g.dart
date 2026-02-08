// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_update_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OperationUpdateDTO extends OperationUpdateDTO {
  @override
  final String? operationName;
  @override
  final String? type;

  factory _$OperationUpdateDTO(
          [void Function(OperationUpdateDTOBuilder)? updates]) =>
      (OperationUpdateDTOBuilder()..update(updates))._build();

  _$OperationUpdateDTO._({this.operationName, this.type}) : super._();
  @override
  OperationUpdateDTO rebuild(
          void Function(OperationUpdateDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OperationUpdateDTOBuilder toBuilder() =>
      OperationUpdateDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OperationUpdateDTO &&
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
    return (newBuiltValueToStringHelper(r'OperationUpdateDTO')
          ..add('operationName', operationName)
          ..add('type', type))
        .toString();
  }
}

class OperationUpdateDTOBuilder
    implements Builder<OperationUpdateDTO, OperationUpdateDTOBuilder> {
  _$OperationUpdateDTO? _$v;

  String? _operationName;
  String? get operationName => _$this._operationName;
  set operationName(String? operationName) =>
      _$this._operationName = operationName;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  OperationUpdateDTOBuilder() {
    OperationUpdateDTO._defaults(this);
  }

  OperationUpdateDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _operationName = $v.operationName;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OperationUpdateDTO other) {
    _$v = other as _$OperationUpdateDTO;
  }

  @override
  void update(void Function(OperationUpdateDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OperationUpdateDTO build() => _build();

  _$OperationUpdateDTO _build() {
    final _$result = _$v ??
        _$OperationUpdateDTO._(
          operationName: operationName,
          type: type,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
