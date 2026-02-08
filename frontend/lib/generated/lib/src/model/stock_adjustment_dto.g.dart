// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_adjustment_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockAdjustmentDTO extends StockAdjustmentDTO {
  @override
  final int? materialId;
  @override
  final double? adjustmentQuantity;
  @override
  final String? adjustmentType;
  @override
  final String? notes;

  factory _$StockAdjustmentDTO(
          [void Function(StockAdjustmentDTOBuilder)? updates]) =>
      (StockAdjustmentDTOBuilder()..update(updates))._build();

  _$StockAdjustmentDTO._(
      {this.materialId,
      this.adjustmentQuantity,
      this.adjustmentType,
      this.notes})
      : super._();
  @override
  StockAdjustmentDTO rebuild(
          void Function(StockAdjustmentDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockAdjustmentDTOBuilder toBuilder() =>
      StockAdjustmentDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockAdjustmentDTO &&
        materialId == other.materialId &&
        adjustmentQuantity == other.adjustmentQuantity &&
        adjustmentType == other.adjustmentType &&
        notes == other.notes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, materialId.hashCode);
    _$hash = $jc(_$hash, adjustmentQuantity.hashCode);
    _$hash = $jc(_$hash, adjustmentType.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockAdjustmentDTO')
          ..add('materialId', materialId)
          ..add('adjustmentQuantity', adjustmentQuantity)
          ..add('adjustmentType', adjustmentType)
          ..add('notes', notes))
        .toString();
  }
}

class StockAdjustmentDTOBuilder
    implements Builder<StockAdjustmentDTO, StockAdjustmentDTOBuilder> {
  _$StockAdjustmentDTO? _$v;

  int? _materialId;
  int? get materialId => _$this._materialId;
  set materialId(int? materialId) => _$this._materialId = materialId;

  double? _adjustmentQuantity;
  double? get adjustmentQuantity => _$this._adjustmentQuantity;
  set adjustmentQuantity(double? adjustmentQuantity) =>
      _$this._adjustmentQuantity = adjustmentQuantity;

  String? _adjustmentType;
  String? get adjustmentType => _$this._adjustmentType;
  set adjustmentType(String? adjustmentType) =>
      _$this._adjustmentType = adjustmentType;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  StockAdjustmentDTOBuilder() {
    StockAdjustmentDTO._defaults(this);
  }

  StockAdjustmentDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _materialId = $v.materialId;
      _adjustmentQuantity = $v.adjustmentQuantity;
      _adjustmentType = $v.adjustmentType;
      _notes = $v.notes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockAdjustmentDTO other) {
    _$v = other as _$StockAdjustmentDTO;
  }

  @override
  void update(void Function(StockAdjustmentDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockAdjustmentDTO build() => _build();

  _$StockAdjustmentDTO _build() {
    final _$result = _$v ??
        _$StockAdjustmentDTO._(
          materialId: materialId,
          adjustmentQuantity: adjustmentQuantity,
          adjustmentType: adjustmentType,
          notes: notes,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
