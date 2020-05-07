// GENERATED CODE - DO NOT MODIFY BY HAND

part of bootstrap;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Bootstrap extends Bootstrap {
  factory _$Bootstrap([void Function(BootstrapBuilder) updates]) =>
      (new BootstrapBuilder()..update(updates)).build();

  _$Bootstrap._() : super._();

  @override
  Bootstrap rebuild(void Function(BootstrapBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BootstrapBuilder toBuilder() => new BootstrapBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bootstrap;
  }

  @override
  int get hashCode {
    return 459520341;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Bootstrap').toString();
  }
}

class BootstrapBuilder implements Builder<Bootstrap, BootstrapBuilder> {
  _$Bootstrap _$v;

  BootstrapBuilder();

  @override
  void replace(Bootstrap other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Bootstrap;
  }

  @override
  void update(void Function(BootstrapBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Bootstrap build() {
    final _$result = _$v ?? new _$Bootstrap._();
    replace(_$result);
    return _$result;
  }
}

class _$BootstrapSuccessful extends BootstrapSuccessful {
  @override
  final AppUser user;

  factory _$BootstrapSuccessful(
          [void Function(BootstrapSuccessfulBuilder) updates]) =>
      (new BootstrapSuccessfulBuilder()..update(updates)).build();

  _$BootstrapSuccessful._({this.user}) : super._();

  @override
  BootstrapSuccessful rebuild(
          void Function(BootstrapSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BootstrapSuccessfulBuilder toBuilder() =>
      new BootstrapSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BootstrapSuccessful && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BootstrapSuccessful')
          ..add('user', user))
        .toString();
  }
}

class BootstrapSuccessfulBuilder
    implements Builder<BootstrapSuccessful, BootstrapSuccessfulBuilder> {
  _$BootstrapSuccessful _$v;

  AppUserBuilder _user;
  AppUserBuilder get user => _$this._user ??= new AppUserBuilder();
  set user(AppUserBuilder user) => _$this._user = user;

  BootstrapSuccessfulBuilder();

  BootstrapSuccessfulBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BootstrapSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BootstrapSuccessful;
  }

  @override
  void update(void Function(BootstrapSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BootstrapSuccessful build() {
    _$BootstrapSuccessful _$result;
    try {
      _$result = _$v ?? new _$BootstrapSuccessful._(user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BootstrapSuccessful', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BootstrapError extends BootstrapError {
  @override
  final Object error;

  factory _$BootstrapError([void Function(BootstrapErrorBuilder) updates]) =>
      (new BootstrapErrorBuilder()..update(updates)).build();

  _$BootstrapError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('BootstrapError', 'error');
    }
  }

  @override
  BootstrapError rebuild(void Function(BootstrapErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BootstrapErrorBuilder toBuilder() =>
      new BootstrapErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BootstrapError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BootstrapError')..add('error', error))
        .toString();
  }
}

class BootstrapErrorBuilder
    implements Builder<BootstrapError, BootstrapErrorBuilder> {
  _$BootstrapError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  BootstrapErrorBuilder();

  BootstrapErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BootstrapError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BootstrapError;
  }

  @override
  void update(void Function(BootstrapErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BootstrapError build() {
    final _$result = _$v ?? new _$BootstrapError._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
