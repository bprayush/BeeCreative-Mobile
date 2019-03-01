// GENERATED CODE - DO NOT MODIFY BY HAND

part of schedule_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScheduleResponse> _$scheduleResponseSerializer =
    new _$ScheduleResponseSerializer();

class _$ScheduleResponseSerializer
    implements StructuredSerializer<ScheduleResponse> {
  @override
  final Iterable<Type> types = const [ScheduleResponse, _$ScheduleResponse];
  @override
  final String wireName = 'ScheduleResponse';

  @override
  Iterable serialize(Serializers serializers, ScheduleResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.data != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.data,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ScheduleResponseData)])));
    }
    if (object.schedule != null) {
      result
        ..add('schedule')
        ..add(serializers.serialize(object.schedule,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Schedule)])));
    }
    if (object.attendee != null) {
      result
        ..add('attendee')
        ..add(serializers.serialize(object.attendee,
            specifiedType: const FullType(Attendee)));
    }

    return result;
  }

  @override
  ScheduleResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleResponseData)]))
              as BuiltList);
          break;
        case 'schedule':
          result.schedule.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Schedule)])) as BuiltList);
          break;
        case 'attendee':
          result.attendee.replace(serializers.deserialize(value,
              specifiedType: const FullType(Attendee)) as Attendee);
          break;
      }
    }

    return result.build();
  }
}

class _$ScheduleResponse extends ScheduleResponse {
  @override
  final BuiltList<ScheduleResponseData> data;
  @override
  final BuiltList<Schedule> schedule;
  @override
  final Attendee attendee;

  factory _$ScheduleResponse([void updates(ScheduleResponseBuilder b)]) =>
      (new ScheduleResponseBuilder()..update(updates)).build();

  _$ScheduleResponse._({this.data, this.schedule, this.attendee}) : super._();

  @override
  ScheduleResponse rebuild(void updates(ScheduleResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleResponseBuilder toBuilder() =>
      new ScheduleResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleResponse &&
        data == other.data &&
        schedule == other.schedule &&
        attendee == other.attendee;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, data.hashCode), schedule.hashCode), attendee.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ScheduleResponse')
          ..add('data', data)
          ..add('schedule', schedule)
          ..add('attendee', attendee))
        .toString();
  }
}

class ScheduleResponseBuilder
    implements Builder<ScheduleResponse, ScheduleResponseBuilder> {
  _$ScheduleResponse _$v;

  ListBuilder<ScheduleResponseData> _data;
  ListBuilder<ScheduleResponseData> get data =>
      _$this._data ??= new ListBuilder<ScheduleResponseData>();
  set data(ListBuilder<ScheduleResponseData> data) => _$this._data = data;

  ListBuilder<Schedule> _schedule;
  ListBuilder<Schedule> get schedule =>
      _$this._schedule ??= new ListBuilder<Schedule>();
  set schedule(ListBuilder<Schedule> schedule) => _$this._schedule = schedule;

  AttendeeBuilder _attendee;
  AttendeeBuilder get attendee => _$this._attendee ??= new AttendeeBuilder();
  set attendee(AttendeeBuilder attendee) => _$this._attendee = attendee;

  ScheduleResponseBuilder();

  ScheduleResponseBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _schedule = _$v.schedule?.toBuilder();
      _attendee = _$v.attendee?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ScheduleResponse;
  }

  @override
  void update(void updates(ScheduleResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ScheduleResponse build() {
    _$ScheduleResponse _$result;
    try {
      _$result = _$v ??
          new _$ScheduleResponse._(
              data: _data?.build(),
              schedule: _schedule?.build(),
              attendee: _attendee?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'schedule';
        _schedule?.build();
        _$failedField = 'attendee';
        _attendee?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ScheduleResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new