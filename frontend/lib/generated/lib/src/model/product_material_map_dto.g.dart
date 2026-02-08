// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_material_map_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductMaterialMapDTO extends ProductMaterialMapDTO {
  @override
  final BuiltMap<String, ProductMaterialsDTO>? products;

  factory _$ProductMaterialMapDTO(
          [void Function(ProductMaterialMapDTOBuilder)? updates]) =>
      (ProductMaterialMapDTOBuilder()..update(updates))._build();

  _$ProductMaterialMapDTO._({this.products}) : super._();
  @override
  ProductMaterialMapDTO rebuild(
          void Function(ProductMaterialMapDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductMaterialMapDTOBuilder toBuilder() =>
      ProductMaterialMapDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductMaterialMapDTO && products == other.products;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductMaterialMapDTO')
          ..add('products', products))
        .toString();
  }
}

class ProductMaterialMapDTOBuilder
    implements Builder<ProductMaterialMapDTO, ProductMaterialMapDTOBuilder> {
  _$ProductMaterialMapDTO? _$v;

  MapBuilder<String, ProductMaterialsDTO>? _products;
  MapBuilder<String, ProductMaterialsDTO> get products =>
      _$this._products ??= MapBuilder<String, ProductMaterialsDTO>();
  set products(MapBuilder<String, ProductMaterialsDTO>? products) =>
      _$this._products = products;

  ProductMaterialMapDTOBuilder() {
    ProductMaterialMapDTO._defaults(this);
  }

  ProductMaterialMapDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _products = $v.products?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductMaterialMapDTO other) {
    _$v = other as _$ProductMaterialMapDTO;
  }

  @override
  void update(void Function(ProductMaterialMapDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductMaterialMapDTO build() => _build();

  _$ProductMaterialMapDTO _build() {
    _$ProductMaterialMapDTO _$result;
    try {
      _$result = _$v ??
          _$ProductMaterialMapDTO._(
            products: _products?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        _products?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProductMaterialMapDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
