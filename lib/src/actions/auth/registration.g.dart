// GENERATED CODE - DO NOT MODIFY BY HAND

part of registration;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Register extends Register {
  @override
  final ActionResult result;

  factory _$Register([void Function(RegisterBuilder) updates]) =>
      (new RegisterBuilder()..update(updates)).build();

  _$Register._({this.result}) : super._() {
    if (result == null) {
      throw new BuiltValueNullFieldError('Register', 'result');
    }
  }

  @override
  Register rebuild(void Function(RegisterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterBuilder toBuilder() => new RegisterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is Register && result == _$dynamicOther.result;
  }

  @override
  int get hashCode {
    return $jf($jc(0, result.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Register')..add('result', result))
        .toString();
  }
}

class RegisterBuilder implements Builder<Register, RegisterBuilder> {
  _$Register _$v;

  ActionResult _result;
  ActionResult get result => _$this._result;
  set result(ActionResult result) => _$this._result = result;

  RegisterBuilder();

  RegisterBuilder get _$this {
    if (_$v != null) {
      _result = _$v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Register other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Register;
  }

  @override
  void update(void Function(RegisterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Register build() {
    final _$result = _$v ?? new _$Register._(result: result);
    replace(_$result);
    return _$result;
  }
}

class _$RegisterSuccessful extends RegisterSuccessful {
  @override
  final AppUser user;

  factory _$RegisterSuccessful(
          [void Function(RegisterSuccessfulBuilder) updates]) =>
      (new RegisterSuccessfulBuilder()..update(updates)).build();

  _$RegisterSuccessful._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('RegisterSuccessful', 'user');
    }
  }

  @override
  RegisterSuccessful rebuild(
          void Function(RegisterSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterSuccessfulBuilder toBuilder() =>
      new RegisterSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterSuccessful && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterSuccessful')
          ..add('user', user))
        .toString();
  }
}

class RegisterSuccessfulBuilder
    implements Builder<RegisterSuccessful, RegisterSuccessfulBuilder> {
  _$RegisterSuccessful _$v;

  AppUserBuilder _user;
  AppUserBuilder get user => _$this._user ??= new AppUserBuilder();
  set user(AppUserBuilder user) => _$this._user = user;

  RegisterSuccessfulBuilder();

  RegisterSuccessfulBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RegisterSuccessful;
  }

  @override
  void update(void Function(RegisterSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterSuccessful build() {
    _$RegisterSuccessful _$result;
    try {
      _$result = _$v ?? new _$RegisterSuccessful._(user: user.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RegisterSuccessful', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RegisterError extends RegisterError {
  @override
  final Object error;

  factory _$RegisterError([void Function(RegisterErrorBuilder) updates]) =>
      (new RegisterErrorBuilder()..update(updates)).build();

  _$RegisterError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('RegisterError', 'error');
    }
  }

  @override
  RegisterError rebuild(void Function(RegisterErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterErrorBuilder toBuilder() => new RegisterErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterError')..add('error', error))
        .toString();
  }
}

class RegisterErrorBuilder
    implements Builder<RegisterError, RegisterErrorBuilder> {
  _$RegisterError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  RegisterErrorBuilder();

  RegisterErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RegisterError;
  }

  @override
  void update(void Function(RegisterErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterError build() {
    final _$result = _$v ?? new _$RegisterError._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
