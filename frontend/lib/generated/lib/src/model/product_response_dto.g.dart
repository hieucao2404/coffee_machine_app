// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductResponseDTO extends ProductResponseDTO {
  @override
  final int? productId;
  @override
  final String? productCode;
  @override
  final String? productName;
  @override
  final String? productType;
  @override
  final String? category;
  @override
  final double? price;
  @override
  final String? description;
  @override
  final bool? isActive;
  @override
  final String? imageUrl;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$ProductResponseDTO(
          [void Function(ProductResponseDTOBuilder)? updates]) =>
      (ProductResponseDTOBuilder()..update(updates))._build();

  _$ProductResponseDTO._(
      {this.productId,
      this.productCode,
      this.productName,
      this.productType,
      this.category,
      this.price,
      this.description,
      this.isActive,
      this.imageUrl,
      this.createdAt,
      this.updatedAt})
      : super._();
  @override
  ProductResponseDTO rebuild(
          void Function(ProductResponseDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductResponseDTOBuilder toBuilder() =>
      ProductResponseDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductResponseDTO &&
        productId == other.productId &&
        productCode == other.productCode &&
        productName == other.productName &&
        productType == other.productType &&
        category == other.category &&
        price == other.price &&
        description == other.description &&
        isActive == other.isActive &&
        imageUrl == other.imageUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, productCode.hashCode);
    _$hash = $jc(_$hash, productName.hashCode);
    _$hash = $jc(_$hash, productType.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductResponseDTO')
          ..add('productId', productId)
          ..add('productCode', productCode)
          ..add('productName', productName)
          ..add('productType', productType)
          ..add('category', category)
          ..add('price', price)
          ..add('description', description)
          ..add('isActive', isActive)
          ..add('imageUrl', imageUrl)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ProductResponseDTOBuilder
    implements Builder<ProductResponseDTO, ProductResponseDTOBuilder> {
  _$ProductResponseDTO? _$v;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  String? _productCode;
  String? get productCode => _$this._productCode;
  set productCode(String? productCode) => _$this._productCode = productCode;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  String? _productType;
  String? get productType => _$this._productType;
  set productType(String? productType) => _$this._productType = productType;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ProductResponseDTOBuilder() {
    ProductResponseDTO._defaults(this);
  }

  ProductResponseDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productId = $v.productId;
      _productCode = $v.productCode;
      _productName = $v.productName;
      _productType = $v.productType;
      _category = $v.category;
      _price = $v.price;
      _description = $v.description;
      _isActive = $v.isActive;
      _imageUrl = $v.imageUrl;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductResponseDTO other) {
    _$v = other as _$ProductResponseDTO;
  }

  @override
  void update(void Function(ProductResponseDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductResponseDTO build() => _build();

  _$ProductResponseDTO _build() {
    final _$result = _$v ??
        _$ProductResponseDTO._(
          productId: productId,
          productCode: productCode,
          productName: productName,
          productType: productType,
          category: category,
          price: price,
          description: description,
          isActive: isActive,
          imageUrl: imageUrl,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
