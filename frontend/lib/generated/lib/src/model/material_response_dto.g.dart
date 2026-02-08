// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MaterialResponseDTO extends MaterialResponseDTO {
  @override
  final int? materialId;
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
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$MaterialResponseDTO(
          [void Function(MaterialResponseDTOBuilder)? updates]) =>
      (MaterialResponseDTOBuilder()..update(updates))._build();

  _$MaterialResponseDTO._(
      {this.materialId,
      this.materialName,
      this.materialUnit,
      this.costPerUnit,
      this.stockQuantity,
      this.isConsumable,
      this.imageUrl,
      this.createdAt,
      this.updatedAt})
      : super._();
  @override
  MaterialResponseDTO rebuild(
          void Function(MaterialResponseDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MaterialResponseDTOBuilder toBuilder() =>
      MaterialResponseDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MaterialResponseDTO &&
        materialId == other.materialId &&
        materialName == other.materialName &&
        materialUnit == other.materialUnit &&
        costPerUnit == other.costPerUnit &&
        stockQuantity == other.stockQuantity &&
        isConsumable == other.isConsumable &&
        imageUrl == other.imageUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, materialId.hashCode);
    _$hash = $jc(_$hash, materialName.hashCode);
    _$hash = $jc(_$hash, materialUnit.hashCode);
    _$hash = $jc(_$hash, costPerUnit.hashCode);
    _$hash = $jc(_$hash, stockQuantity.hashCode);
    _$hash = $jc(_$hash, isConsumable.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaterialResponseDTO')
          ..add('materialId', materialId)
          ..add('materialName', materialName)
          ..add('materialUnit', materialUnit)
          ..add('costPerUnit', costPerUnit)
          ..add('stockQuantity', stockQuantity)
          ..add('isConsumable', isConsumable)
          ..add('imageUrl', imageUrl)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class MaterialResponseDTOBuilder
    implements Builder<MaterialResponseDTO, MaterialResponseDTOBuilder> {
  _$MaterialResponseDTO? _$v;

  int? _materialId;
  int? get materialId => _$this._materialId;
  set materialId(int? materialId) => _$this._materialId = materialId;

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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  MaterialResponseDTOBuilder() {
    MaterialResponseDTO._defaults(this);
  }

  MaterialResponseDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _materialId = $v.materialId;
      _materialName = $v.materialName;
      _materialUnit = $v.materialUnit;
      _costPerUnit = $v.costPerUnit;
      _stockQuantity = $v.stockQuantity;
      _isConsumable = $v.isConsumable;
      _imageUrl = $v.imageUrl;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MaterialResponseDTO other) {
    _$v = other as _$MaterialResponseDTO;
  }

  @override
  void update(void Function(MaterialResponseDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MaterialResponseDTO build() => _build();

  _$MaterialResponseDTO _build() {
    final _$result = _$v ??
        _$MaterialResponseDTO._(
          materialId: materialId,
          materialName: materialName,
          materialUnit: materialUnit,
          costPerUnit: costPerUnit,
          stockQuantity: stockQuantity,
          isConsumable: isConsumable,
          imageUrl: imageUrl,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
