// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processed_material_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessedMaterialResponseDTO extends ProcessedMaterialResponseDTO {
  @override
  final int? processId;
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

  factory _$ProcessedMaterialResponseDTO(
          [void Function(ProcessedMaterialResponseDTOBuilder)? updates]) =>
      (ProcessedMaterialResponseDTOBuilder()..update(updates))._build();

  _$ProcessedMaterialResponseDTO._(
      {this.processId,
      this.materialId,
      this.materialName,
      this.quantity,
      this.unit,
      this.usageType})
      : super._();
  @override
  ProcessedMaterialResponseDTO rebuild(
          void Function(ProcessedMaterialResponseDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessedMaterialResponseDTOBuilder toBuilder() =>
      ProcessedMaterialResponseDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessedMaterialResponseDTO &&
        processId == other.processId &&
        materialId == other.materialId &&
        materialName == other.materialName &&
        quantity == other.quantity &&
        unit == other.unit &&
        usageType == other.usageType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, processId.hashCode);
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
    return (newBuiltValueToStringHelper(r'ProcessedMaterialResponseDTO')
          ..add('processId', processId)
          ..add('materialId', materialId)
          ..add('materialName', materialName)
          ..add('quantity', quantity)
          ..add('unit', unit)
          ..add('usageType', usageType))
        .toString();
  }
}

class ProcessedMaterialResponseDTOBuilder
    implements
        Builder<ProcessedMaterialResponseDTO,
            ProcessedMaterialResponseDTOBuilder> {
  _$ProcessedMaterialResponseDTO? _$v;

  int? _processId;
  int? get processId => _$this._processId;
  set processId(int? processId) => _$this._processId = processId;

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

  ProcessedMaterialResponseDTOBuilder() {
    ProcessedMaterialResponseDTO._defaults(this);
  }

  ProcessedMaterialResponseDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _processId = $v.processId;
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
  void replace(ProcessedMaterialResponseDTO other) {
    _$v = other as _$ProcessedMaterialResponseDTO;
  }

  @override
  void update(void Function(ProcessedMaterialResponseDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessedMaterialResponseDTO build() => _build();

  _$ProcessedMaterialResponseDTO _build() {
    final _$result = _$v ??
        _$ProcessedMaterialResponseDTO._(
          processId: processId,
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
