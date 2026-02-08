// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OperationResponseDTO extends OperationResponseDTO {
  @override
  final int? operationId;
  @override
  final String? operationName;
  @override
  final String? type;

  factory _$OperationResponseDTO(
          [void Function(OperationResponseDTOBuilder)? updates]) =>
      (OperationResponseDTOBuilder()..update(updates))._build();

  _$OperationResponseDTO._({this.operationId, this.operationName, this.type})
      : super._();
  @override
  OperationResponseDTO rebuild(
          void Function(OperationResponseDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OperationResponseDTOBuilder toBuilder() =>
      OperationResponseDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OperationResponseDTO &&
        operationId == other.operationId &&
        operationName == other.operationName &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, operationId.hashCode);
    _$hash = $jc(_$hash, operationName.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OperationResponseDTO')
          ..add('operationId', operationId)
          ..add('operationName', operationName)
          ..add('type', type))
        .toString();
  }
}

class OperationResponseDTOBuilder
    implements Builder<OperationResponseDTO, OperationResponseDTOBuilder> {
  _$OperationResponseDTO? _$v;

  int? _operationId;
  int? get operationId => _$this._operationId;
  set operationId(int? operationId) => _$this._operationId = operationId;

  String? _operationName;
  String? get operationName => _$this._operationName;
  set operationName(String? operationName) =>
      _$this._operationName = operationName;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  OperationResponseDTOBuilder() {
    OperationResponseDTO._defaults(this);
  }

  OperationResponseDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _operationId = $v.operationId;
      _operationName = $v.operationName;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OperationResponseDTO other) {
    _$v = other as _$OperationResponseDTO;
  }

  @override
  void update(void Function(OperationResponseDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OperationResponseDTO build() => _build();

  _$OperationResponseDTO _build() {
    final _$result = _$v ??
        _$OperationResponseDTO._(
          operationId: operationId,
          operationName: operationName,
          type: type,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
