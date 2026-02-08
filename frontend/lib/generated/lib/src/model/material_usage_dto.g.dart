// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_usage_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MaterialUsageDTO extends MaterialUsageDTO {
  @override
  final int? materialId;
  @override
  final double? quantity;
  @override
  final String? usageType;
  @override
  final int? sequence;

  factory _$MaterialUsageDTO(
          [void Function(MaterialUsageDTOBuilder)? updates]) =>
      (MaterialUsageDTOBuilder()..update(updates))._build();

  _$MaterialUsageDTO._(
      {this.materialId, this.quantity, this.usageType, this.sequence})
      : super._();
  @override
  MaterialUsageDTO rebuild(void Function(MaterialUsageDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MaterialUsageDTOBuilder toBuilder() =>
      MaterialUsageDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MaterialUsageDTO &&
        materialId == other.materialId &&
        quantity == other.quantity &&
        usageType == other.usageType &&
        sequence == other.sequence;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, materialId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, usageType.hashCode);
    _$hash = $jc(_$hash, sequence.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaterialUsageDTO')
          ..add('materialId', materialId)
          ..add('quantity', quantity)
          ..add('usageType', usageType)
          ..add('sequence', sequence))
        .toString();
  }
}

class MaterialUsageDTOBuilder
    implements Builder<MaterialUsageDTO, MaterialUsageDTOBuilder> {
  _$MaterialUsageDTO? _$v;

  int? _materialId;
  int? get materialId => _$this._materialId;
  set materialId(int? materialId) => _$this._materialId = materialId;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  String? _usageType;
  String? get usageType => _$this._usageType;
  set usageType(String? usageType) => _$this._usageType = usageType;

  int? _sequence;
  int? get sequence => _$this._sequence;
  set sequence(int? sequence) => _$this._sequence = sequence;

  MaterialUsageDTOBuilder() {
    MaterialUsageDTO._defaults(this);
  }

  MaterialUsageDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _materialId = $v.materialId;
      _quantity = $v.quantity;
      _usageType = $v.usageType;
      _sequence = $v.sequence;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MaterialUsageDTO other) {
    _$v = other as _$MaterialUsageDTO;
  }

  @override
  void update(void Function(MaterialUsageDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MaterialUsageDTO build() => _build();

  _$MaterialUsageDTO _build() {
    final _$result = _$v ??
        _$MaterialUsageDTO._(
          materialId: materialId,
          quantity: quantity,
          usageType: usageType,
          sequence: sequence,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
