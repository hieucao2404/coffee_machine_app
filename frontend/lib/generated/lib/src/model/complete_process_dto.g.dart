// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_process_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CompleteProcessDTO extends CompleteProcessDTO {
  @override
  final int? productId;
  @override
  final int? version;
  @override
  final String? type;
  @override
  final String? note;
  @override
  final bool? isDefault;
  @override
  final BuiltList<ProcessStepCreateDTO>? steps;
  @override
  final BuiltList<MaterialUsageDTO>? materials;

  factory _$CompleteProcessDTO(
          [void Function(CompleteProcessDTOBuilder)? updates]) =>
      (CompleteProcessDTOBuilder()..update(updates))._build();

  _$CompleteProcessDTO._(
      {this.productId,
      this.version,
      this.type,
      this.note,
      this.isDefault,
      this.steps,
      this.materials})
      : super._();
  @override
  CompleteProcessDTO rebuild(
          void Function(CompleteProcessDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompleteProcessDTOBuilder toBuilder() =>
      CompleteProcessDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompleteProcessDTO &&
        productId == other.productId &&
        version == other.version &&
        type == other.type &&
        note == other.note &&
        isDefault == other.isDefault &&
        steps == other.steps &&
        materials == other.materials;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, steps.hashCode);
    _$hash = $jc(_$hash, materials.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompleteProcessDTO')
          ..add('productId', productId)
          ..add('version', version)
          ..add('type', type)
          ..add('note', note)
          ..add('isDefault', isDefault)
          ..add('steps', steps)
          ..add('materials', materials))
        .toString();
  }
}

class CompleteProcessDTOBuilder
    implements Builder<CompleteProcessDTO, CompleteProcessDTOBuilder> {
  _$CompleteProcessDTO? _$v;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

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

  ListBuilder<ProcessStepCreateDTO>? _steps;
  ListBuilder<ProcessStepCreateDTO> get steps =>
      _$this._steps ??= ListBuilder<ProcessStepCreateDTO>();
  set steps(ListBuilder<ProcessStepCreateDTO>? steps) => _$this._steps = steps;

  ListBuilder<MaterialUsageDTO>? _materials;
  ListBuilder<MaterialUsageDTO> get materials =>
      _$this._materials ??= ListBuilder<MaterialUsageDTO>();
  set materials(ListBuilder<MaterialUsageDTO>? materials) =>
      _$this._materials = materials;

  CompleteProcessDTOBuilder() {
    CompleteProcessDTO._defaults(this);
  }

  CompleteProcessDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productId = $v.productId;
      _version = $v.version;
      _type = $v.type;
      _note = $v.note;
      _isDefault = $v.isDefault;
      _steps = $v.steps?.toBuilder();
      _materials = $v.materials?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompleteProcessDTO other) {
    _$v = other as _$CompleteProcessDTO;
  }

  @override
  void update(void Function(CompleteProcessDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompleteProcessDTO build() => _build();

  _$CompleteProcessDTO _build() {
    _$CompleteProcessDTO _$result;
    try {
      _$result = _$v ??
          _$CompleteProcessDTO._(
            productId: productId,
            version: version,
            type: type,
            note: note,
            isDefault: isDefault,
            steps: _steps?.build(),
            materials: _materials?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'steps';
        _steps?.build();
        _$failedField = 'materials';
        _materials?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CompleteProcessDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
