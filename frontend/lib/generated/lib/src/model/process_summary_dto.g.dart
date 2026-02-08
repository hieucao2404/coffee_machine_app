// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessSummaryDTO extends ProcessSummaryDTO {
  @override
  final int? processId;
  @override
  final String? processName;
  @override
  final int? stepCount;
  @override
  final BuiltList<String>? requiredMaterials;

  factory _$ProcessSummaryDTO(
          [void Function(ProcessSummaryDTOBuilder)? updates]) =>
      (ProcessSummaryDTOBuilder()..update(updates))._build();

  _$ProcessSummaryDTO._(
      {this.processId,
      this.processName,
      this.stepCount,
      this.requiredMaterials})
      : super._();
  @override
  ProcessSummaryDTO rebuild(void Function(ProcessSummaryDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessSummaryDTOBuilder toBuilder() =>
      ProcessSummaryDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessSummaryDTO &&
        processId == other.processId &&
        processName == other.processName &&
        stepCount == other.stepCount &&
        requiredMaterials == other.requiredMaterials;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, processId.hashCode);
    _$hash = $jc(_$hash, processName.hashCode);
    _$hash = $jc(_$hash, stepCount.hashCode);
    _$hash = $jc(_$hash, requiredMaterials.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcessSummaryDTO')
          ..add('processId', processId)
          ..add('processName', processName)
          ..add('stepCount', stepCount)
          ..add('requiredMaterials', requiredMaterials))
        .toString();
  }
}

class ProcessSummaryDTOBuilder
    implements Builder<ProcessSummaryDTO, ProcessSummaryDTOBuilder> {
  _$ProcessSummaryDTO? _$v;

  int? _processId;
  int? get processId => _$this._processId;
  set processId(int? processId) => _$this._processId = processId;

  String? _processName;
  String? get processName => _$this._processName;
  set processName(String? processName) => _$this._processName = processName;

  int? _stepCount;
  int? get stepCount => _$this._stepCount;
  set stepCount(int? stepCount) => _$this._stepCount = stepCount;

  ListBuilder<String>? _requiredMaterials;
  ListBuilder<String> get requiredMaterials =>
      _$this._requiredMaterials ??= ListBuilder<String>();
  set requiredMaterials(ListBuilder<String>? requiredMaterials) =>
      _$this._requiredMaterials = requiredMaterials;

  ProcessSummaryDTOBuilder() {
    ProcessSummaryDTO._defaults(this);
  }

  ProcessSummaryDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _processId = $v.processId;
      _processName = $v.processName;
      _stepCount = $v.stepCount;
      _requiredMaterials = $v.requiredMaterials?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcessSummaryDTO other) {
    _$v = other as _$ProcessSummaryDTO;
  }

  @override
  void update(void Function(ProcessSummaryDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessSummaryDTO build() => _build();

  _$ProcessSummaryDTO _build() {
    _$ProcessSummaryDTO _$result;
    try {
      _$result = _$v ??
          _$ProcessSummaryDTO._(
            processId: processId,
            processName: processName,
            stepCount: stepCount,
            requiredMaterials: _requiredMaterials?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'requiredMaterials';
        _requiredMaterials?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProcessSummaryDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
