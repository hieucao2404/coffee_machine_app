// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessResponseDTO extends ProcessResponseDTO {
  @override
  final int? processId;
  @override
  final int? productId;
  @override
  final String? productName;
  @override
  final int? version;
  @override
  final String? type;
  @override
  final String? note;
  @override
  final bool? isDefault;

  factory _$ProcessResponseDTO(
          [void Function(ProcessResponseDTOBuilder)? updates]) =>
      (ProcessResponseDTOBuilder()..update(updates))._build();

  _$ProcessResponseDTO._(
      {this.processId,
      this.productId,
      this.productName,
      this.version,
      this.type,
      this.note,
      this.isDefault})
      : super._();
  @override
  ProcessResponseDTO rebuild(
          void Function(ProcessResponseDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessResponseDTOBuilder toBuilder() =>
      ProcessResponseDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessResponseDTO &&
        processId == other.processId &&
        productId == other.productId &&
        productName == other.productName &&
        version == other.version &&
        type == other.type &&
        note == other.note &&
        isDefault == other.isDefault;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, processId.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, productName.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcessResponseDTO')
          ..add('processId', processId)
          ..add('productId', productId)
          ..add('productName', productName)
          ..add('version', version)
          ..add('type', type)
          ..add('note', note)
          ..add('isDefault', isDefault))
        .toString();
  }
}

class ProcessResponseDTOBuilder
    implements Builder<ProcessResponseDTO, ProcessResponseDTOBuilder> {
  _$ProcessResponseDTO? _$v;

  int? _processId;
  int? get processId => _$this._processId;
  set processId(int? processId) => _$this._processId = processId;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  ProcessResponseDTOBuilder() {
    ProcessResponseDTO._defaults(this);
  }

  ProcessResponseDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _processId = $v.processId;
      _productId = $v.productId;
      _productName = $v.productName;
      _version = $v.version;
      _type = $v.type;
      _note = $v.note;
      _isDefault = $v.isDefault;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcessResponseDTO other) {
    _$v = other as _$ProcessResponseDTO;
  }

  @override
  void update(void Function(ProcessResponseDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessResponseDTO build() => _build();

  _$ProcessResponseDTO _build() {
    final _$result = _$v ??
        _$ProcessResponseDTO._(
          processId: processId,
          productId: productId,
          productName: productName,
          version: version,
          type: type,
          note: note,
          isDefault: isDefault,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
