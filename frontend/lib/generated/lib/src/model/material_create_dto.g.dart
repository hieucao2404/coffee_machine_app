// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_create_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MaterialCreateDTO extends MaterialCreateDTO {
  @override
  final String? materialName;
  @override
  final String? materialUnit;
  @override
  final double? costPerUnit;
  @override
  final double? stockQuantity;
  @override
  final bool? isConsumable;
  @override
  final String? imageUrl;

  factory _$MaterialCreateDTO(
          [void Function(MaterialCreateDTOBuilder)? updates]) =>
      (MaterialCreateDTOBuilder()..update(updates))._build();

  _$MaterialCreateDTO._(
      {this.materialName,
      this.materialUnit,
      this.costPerUnit,
      this.stockQuantity,
      this.isConsumable,
      this.imageUrl})
      : super._();
  @override
  MaterialCreateDTO rebuild(void Function(MaterialCreateDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MaterialCreateDTOBuilder toBuilder() =>
      MaterialCreateDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MaterialCreateDTO &&
        materialName == other.materialName &&
        materialUnit == other.materialUnit &&
        costPerUnit == other.costPerUnit &&
        stockQuantity == other.stockQuantity &&
        isConsumable == other.isConsumable &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, materialName.hashCode);
    _$hash = $jc(_$hash, materialUnit.hashCode);
    _$hash = $jc(_$hash, costPerUnit.hashCode);
    _$hash = $jc(_$hash, stockQuantity.hashCode);
    _$hash = $jc(_$hash, isConsumable.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaterialCreateDTO')
          ..add('materialName', materialName)
          ..add('materialUnit', materialUnit)
          ..add('costPerUnit', costPerUnit)
          ..add('stockQuantity', stockQuantity)
          ..add('isConsumable', isConsumable)
          ..add('imageUrl', imageUrl))
        .toString();
  }
}

class MaterialCreateDTOBuilder
    implements Builder<MaterialCreateDTO, MaterialCreateDTOBuilder> {
  _$MaterialCreateDTO? _$v;

  String? _materialName;
  String? get materialName => _$this._materialName;
  set materialName(String? materialName) => _$this._materialName = materialName;

  String? _materialUnit;
  String? get materialUnit => _$this._materialUnit;
  set materialUnit(String? materialUnit) => _$this._materialUnit = materialUnit;

  double? _costPerUnit;
  double? get costPerUnit => _$this._costPerUnit;
  set costPerUnit(double? costPerUnit) => _$this._costPerUnit = costPerUnit;

  double? _stockQuantity;
  double? get stockQuantity => _$this._stockQuantity;
  set stockQuantity(double? stockQuantity) =>
      _$this._stockQuantity = stockQuantity;

  bool? _isConsumable;
  bool? get isConsumable => _$this._isConsumable;
  set isConsumable(bool? isConsumable) => _$this._isConsumable = isConsumable;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  MaterialCreateDTOBuilder() {
    MaterialCreateDTO._defaults(this);
  }

  MaterialCreateDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _materialName = $v.materialName;
      _materialUnit = $v.materialUnit;
      _costPerUnit = $v.costPerUnit;
      _stockQuantity = $v.stockQuantity;
      _isConsumable = $v.isConsumable;
      _imageUrl = $v.imageUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MaterialCreateDTO other) {
    _$v = other as _$MaterialCreateDTO;
  }

  @override
  void update(void Function(MaterialCreateDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MaterialCreateDTO build() => _build();

  _$MaterialCreateDTO _build() {
    final _$result = _$v ??
        _$MaterialCreateDTO._(
          materialName: materialName,
          materialUnit: materialUnit,
          costPerUnit: costPerUnit,
          stockQuantity: stockQuantity,
          isConsumable: isConsumable,
          imageUrl: imageUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
