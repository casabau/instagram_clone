// GENERATED CODE - DO NOT MODIFY BY HAND

part of logout;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogOut extends LogOut {
  factory _$LogOut([void Function(LogOutBuilder) updates]) =>
      (new LogOutBuilder()..update(updates)).build();

  _$LogOut._() : super._();

  @override
  LogOut rebuild(void Function(LogOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogOutBuilder toBuilder() => new LogOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogOut;
  }

  @override
  int get hashCode {
    return 704536295;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LogOut').toString();
  }
}

class LogOutBuilder implements Builder<LogOut, LogOutBuilder> {
  _$LogOut _$v;

  LogOutBuilder();

  @override
  void replace(LogOut other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LogOut;
  }

  @override
  void update(void Function(LogOutBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LogOut build() {
    final _$result = _$v ?? new _$LogOut._();
    replace(_$result);
    return _$result;
  }
}

class _$LogOutSuccessful extends LogOutSuccessful {
  factory _$LogOutSuccessful(
          [void Function(LogOutSuccessfulBuilder) updates]) =>
      (new LogOutSuccessfulBuilder()..update(updates)).build();

  _$LogOutSuccessful._() : super._();

  @override
  LogOutSuccessful rebuild(void Function(LogOutSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogOutSuccessfulBuilder toBuilder() =>
      new LogOutSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogOutSuccessful;
  }

  @override
  int get hashCode {
    return 383541703;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LogOutSuccessful').toString();
  }
}

class LogOutSuccessfulBuilder
    implements Builder<LogOutSuccessful, LogOutSuccessfulBuilder> {
  _$LogOutSuccessful _$v;

  LogOutSuccessfulBuilder();

  @override
  void replace(LogOutSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LogOutSuccessful;
  }

  @override
  void update(void Function(LogOutSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LogOutSuccessful build() {
    final _$result = _$v ?? new _$LogOutSuccessful._();
    replace(_$result);
    return _$result;
  }
}

class _$LogOutError extends LogOutError {
  @override
  final Object error;

  factory _$LogOutError([void Function(LogOutErrorBuilder) updates]) =>
      (new LogOutErrorBuilder()..update(updates)).build();

  _$LogOutError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('LogOutError', 'error');
    }
  }

  @override
  LogOutError rebuild(void Function(LogOutErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogOutErrorBuilder toBuilder() => new LogOutErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogOutError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LogOutError')..add('error', error))
        .toString();
  }
}

class LogOutErrorBuilder implements Builder<LogOutError, LogOutErrorBuilder> {
  _$LogOutError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  LogOutErrorBuilder();

  LogOutErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogOutError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LogOutError;
  }

  @override
  void update(void Function(LogOutErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LogOutError build() {
    final _$result = _$v ?? new _$LogOutError._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
