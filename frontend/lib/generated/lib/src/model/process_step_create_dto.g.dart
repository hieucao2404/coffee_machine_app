// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_step_create_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessStepCreateDTO extends ProcessStepCreateDTO {
  @override
  final int? operationId;
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

  factory _$ProcessStepCreateDTO(
          [void Function(ProcessStepCreateDTOBuilder)? updates]) =>
      (ProcessStepCreateDTOBuilder()..update(updates))._build();

  _$ProcessStepCreateDTO._(
      {this.operationId,
      this.sequence,
      this.speed,
      this.temperature,
      this.duration,
      this.currentLimitMa,
      this.targetPosition,
      this.stopCondition})
      : super._();
  @override
  ProcessStepCreateDTO rebuild(
          void Function(ProcessStepCreateDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessStepCreateDTOBuilder toBuilder() =>
      ProcessStepCreateDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessStepCreateDTO &&
        operationId == other.operationId &&
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
    _$hash = $jc(_$hash, operationId.hashCode);
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
    return (newBuiltValueToStringHelper(r'ProcessStepCreateDTO')
          ..add('operationId', operationId)
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

class ProcessStepCreateDTOBuilder
    implements Builder<ProcessStepCreateDTO, ProcessStepCreateDTOBuilder> {
  _$ProcessStepCreateDTO? _$v;

  int? _operationId;
  int? get operationId => _$this._operationId;
  set operationId(int? operationId) => _$this._operationId = operationId;

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

  ProcessStepCreateDTOBuilder() {
    ProcessStepCreateDTO._defaults(this);
  }

  ProcessStepCreateDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _operationId = $v.operationId;
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
  void replace(ProcessStepCreateDTO other) {
    _$v = other as _$ProcessStepCreateDTO;
  }

  @override
  void update(void Function(ProcessStepCreateDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessStepCreateDTO build() => _build();

  _$ProcessStepCreateDTO _build() {
    final _$result = _$v ??
        _$ProcessStepCreateDTO._(
          operationId: operationId,
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
