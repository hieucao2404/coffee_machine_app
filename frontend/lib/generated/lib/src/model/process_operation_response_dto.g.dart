// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_operation_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessOperationResponseDTO extends ProcessOperationResponseDTO {
  @override
  final int? processOperationId;
  @override
  final int? processId;
  @override
  final int? operationId;
  @override
  final String? operationName;
  @override
  final String? operationType;
  @override
  final int? sequence;
  @override
  final int? speed;
  @override
  final double? temperature;
  @override
  final int? duration;
  @override
  final int? currentLimitMa;
  @override
  final int? targetPosition;
  @override
  final String? stopCondition;

  factory _$ProcessOperationResponseDTO(
          [void Function(ProcessOperationResponseDTOBuilder)? updates]) =>
      (ProcessOperationResponseDTOBuilder()..update(updates))._build();

  _$ProcessOperationResponseDTO._(
      {this.processOperationId,
      this.processId,
      this.operationId,
      this.operationName,
      this.operationType,
      this.sequence,
      this.speed,
      this.temperature,
      this.duration,
      this.currentLimitMa,
      this.targetPosition,
      this.stopCondition})
      : super._();
  @override
  ProcessOperationResponseDTO rebuild(
          void Function(ProcessOperationResponseDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessOperationResponseDTOBuilder toBuilder() =>
      ProcessOperationResponseDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessOperationResponseDTO &&
        processOperationId == other.processOperationId &&
        processId == other.processId &&
        operationId == other.operationId &&
        operationName == other.operationName &&
        operationType == other.operationType &&
        sequence == other.sequence &&
        speed == other.speed &&
        temperature == other.temperature &&
        duration == other.duration &&
        currentLimitMa == other.currentLimitMa &&
        targetPosition == other.targetPosition &&
        stopCondition == other.stopCondition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, processOperationId.hashCode);
    _$hash = $jc(_$hash, processId.hashCode);
    _$hash = $jc(_$hash, operationId.hashCode);
    _$hash = $jc(_$hash, operationName.hashCode);
    _$hash = $jc(_$hash, operationType.hashCode);
    _$hash = $jc(_$hash, sequence.hashCode);
    _$hash = $jc(_$hash, speed.hashCode);
    _$hash = $jc(_$hash, temperature.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, currentLimitMa.hashCode);
    _$hash = $jc(_$hash, targetPosition.hashCode);
    _$hash = $jc(_$hash, stopCondition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcessOperationResponseDTO')
          ..add('processOperationId', processOperationId)
          ..add('processId', processId)
          ..add('operationId', operationId)
          ..add('operationName', operationName)
          ..add('operationType', operationType)
          ..add('sequence', sequence)
          ..add('speed', speed)
          ..add('temperature', temperature)
          ..add('duration', duration)
          ..add('currentLimitMa', currentLimitMa)
          ..add('targetPosition', targetPosition)
          ..add('stopCondition', stopCondition))
        .toString();
  }
}

class ProcessOperationResponseDTOBuilder
    implements
        Builder<ProcessOperationResponseDTO,
            ProcessOperationResponseDTOBuilder> {
  _$ProcessOperationResponseDTO? _$v;

  int? _processOperationId;
  int? get processOperationId => _$this._processOperationId;
  set processOperationId(int? processOperationId) =>
      _$this._processOperationId = processOperationId;

  int? _processId;
  int? get processId => _$this._processId;
  set processId(int? processId) => _$this._processId = processId;

  int? _operationId;
  int? get operationId => _$this._operationId;
  set operationId(int? operationId) => _$this._operationId = operationId;

  String? _operationName;
  String? get operationName => _$this._operationName;
  set operationName(String? operationName) =>
      _$this._operationName = operationName;

  String? _operationType;
  String? get operationType => _$this._operationType;
  set operationType(String? operationType) =>
      _$this._operationType = operationType;

  int? _sequence;
  int? get sequence => _$this._sequence;
  set sequence(int? sequence) => _$this._sequence = sequence;

  int? _speed;
  int? get speed => _$this._speed;
  set speed(int? speed) => _$this._speed = speed;

  double? _temperature;
  double? get temperature => _$this._temperature;
  set temperature(double? temperature) => _$this._temperature = temperature;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  int? _currentLimitMa;
  int? get currentLimitMa => _$this._currentLimitMa;
  set currentLimitMa(int? currentLimitMa) =>
      _$this._currentLimitMa = currentLimitMa;

  int? _targetPosition;
  int? get targetPosition => _$this._targetPosition;
  set targetPosition(int? targetPosition) =>
      _$this._targetPosition = targetPosition;

  String? _stopCondition;
  String? get stopCondition => _$this._stopCondition;
  set stopCondition(String? stopCondition) =>
      _$this._stopCondition = stopCondition;

  ProcessOperationResponseDTOBuilder() {
    ProcessOperationResponseDTO._defaults(this);
  }

  ProcessOperationResponseDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _processOperationId = $v.processOperationId;
      _processId = $v.processId;
      _operationId = $v.operationId;
      _operationName = $v.operationName;
      _operationType = $v.operationType;
      _sequence = $v.sequence;
      _speed = $v.speed;
      _temperature = $v.temperature;
      _duration = $v.duration;
      _currentLimitMa = $v.currentLimitMa;
      _targetPosition = $v.targetPosition;
      _stopCondition = $v.stopCondition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcessOperationResponseDTO other) {
    _$v = other as _$ProcessOperationResponseDTO;
  }

  @override
  void update(void Function(ProcessOperationResponseDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessOperationResponseDTO build() => _build();

  _$ProcessOperationResponseDTO _build() {
    final _$result = _$v ??
        _$ProcessOperationResponseDTO._(
          processOperationId: processOperationId,
          processId: processId,
          operationId: operationId,
          operationName: operationName,
          operationType: operationType,
          sequence: sequence,
          speed: speed,
          temperature: temperature,
          duration: duration,
          currentLimitMa: currentLimitMa,
          targetPosition: targetPosition,
          stopCondition: stopCondition,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
