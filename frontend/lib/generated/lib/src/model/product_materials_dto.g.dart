// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_materials_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductMaterialsDTO extends ProductMaterialsDTO {
  @override
  final int? productId;
  @override
  final String? productCode;
  @override
  final double? price;
  @override
  final BuiltList<MaterialRequirementDTO>? materials;
  @override
  final int? stepCount;

  factory _$ProductMaterialsDTO(
          [void Function(ProductMaterialsDTOBuilder)? updates]) =>
      (ProductMaterialsDTOBuilder()..update(updates))._build();

  _$ProductMaterialsDTO._(
      {this.productId,
      this.productCode,
      this.price,
      this.materials,
      this.stepCount})
      : super._();
  @override
  ProductMaterialsDTO rebuild(
          void Function(ProductMaterialsDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductMaterialsDTOBuilder toBuilder() =>
      ProductMaterialsDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductMaterialsDTO &&
        productId == other.productId &&
        productCode == other.productCode &&
        price == other.price &&
        materials == other.materials &&
        stepCount == other.stepCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, productCode.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, materials.hashCode);
    _$hash = $jc(_$hash, stepCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductMaterialsDTO')
          ..add('productId', productId)
          ..add('productCode', productCode)
          ..add('price', price)
          ..add('materials', materials)
          ..add('stepCount', stepCount))
        .toString();
  }
}

class ProductMaterialsDTOBuilder
    implements Builder<ProductMaterialsDTO, ProductMaterialsDTOBuilder> {
  _$ProductMaterialsDTO? _$v;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  String? _productCode;
  String? get productCode => _$this._productCode;
  set productCode(String? productCode) => _$this._productCode = productCode;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  ListBuilder<MaterialRequirementDTO>? _materials;
  ListBuilder<MaterialRequirementDTO> get materials =>
      _$this._materials ??= ListBuilder<MaterialRequirementDTO>();
  set materials(ListBuilder<MaterialRequirementDTO>? materials) =>
      _$this._materials = materials;

  int? _stepCount;
  int? get stepCount => _$this._stepCount;
  set stepCount(int? stepCount) => _$this._stepCount = stepCount;

  ProductMaterialsDTOBuilder() {
    ProductMaterialsDTO._defaults(this);
  }

  ProductMaterialsDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productId = $v.productId;
      _productCode = $v.productCode;
      _price = $v.price;
      _materials = $v.materials?.toBuilder();
      _stepCount = $v.stepCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductMaterialsDTO other) {
    _$v = other as _$ProductMaterialsDTO;
  }

  @override
  void update(void Function(ProductMaterialsDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductMaterialsDTO build() => _build();

  _$ProductMaterialsDTO _build() {
    _$ProductMaterialsDTO _$result;
    try {
      _$result = _$v ??
          _$ProductMaterialsDTO._(
            productId: productId,
            productCode: productCode,
            price: price,
            materials: _materials?.build(),
            stepCount: stepCount,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'materials';
        _materials?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProductMaterialsDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
