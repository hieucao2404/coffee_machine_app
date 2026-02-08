// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_requirement_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MaterialRequirementDTO extends MaterialRequirementDTO {
  @override
  final int? materialId;
  @override
  final String? materialName;
  @override
  final double? quantity;
  @override
  final String? unit;
  @override
  final String? usageType;

  factory _$MaterialRequirementDTO(
          [void Function(MaterialRequirementDTOBuilder)? updates]) =>
      (MaterialRequirementDTOBuilder()..update(updates))._build();

  _$MaterialRequirementDTO._(
      {this.materialId,
      this.materialName,
      this.quantity,
      this.unit,
      this.usageType})
      : super._();
  @override
  MaterialRequirementDTO rebuild(
          void Function(MaterialRequirementDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MaterialRequirementDTOBuilder toBuilder() =>
      MaterialRequirementDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MaterialRequirementDTO &&
        materialId == other.materialId &&
        materialName == other.materialName &&
        quantity == other.quantity &&
        unit == other.unit &&
        usageType == other.usageType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, materialId.hashCode);
    _$hash = $jc(_$hash, materialName.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, usageType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaterialRequirementDTO')
          ..add('materialId', materialId)
          ..add('materialName', materialName)
          ..add('quantity', quantity)
          ..add('unit', unit)
          ..add('usageType', usageType))
        .toString();
  }
}

class MaterialRequirementDTOBuilder
    implements Builder<MaterialRequirementDTO, MaterialRequirementDTOBuilder> {
  _$MaterialRequirementDTO? _$v;

  int? _materialId;
  int? get materialId => _$this._materialId;
  set materialId(int? materialId) => _$this._materialId = materialId;

  String? _materialName;
  String? get materialName => _$this._materialName;
  set materialName(String? materialName) => _$this._materialName = materialName;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  String? _usageType;
  String? get usageType => _$this._usageType;
  set usageType(String? usageType) => _$this._usageType = usageType;

  MaterialRequirementDTOBuilder() {
    MaterialRequirementDTO._defaults(this);
  }

  MaterialRequirementDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _materialId = $v.materialId;
      _materialName = $v.materialName;
      _quantity = $v.quantity;
      _unit = $v.unit;
      _usageType = $v.usageType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MaterialRequirementDTO other) {
    _$v = other as _$MaterialRequirementDTO;
  }

  @override
  void update(void Function(MaterialRequirementDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MaterialRequirementDTO build() => _build();

  _$MaterialRequirementDTO _build() {
    final _$result = _$v ??
        _$MaterialRequirementDTO._(
          materialId: materialId,
          materialName: materialName,
          quantity: quantity,
          unit: unit,
          usageType: usageType,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
