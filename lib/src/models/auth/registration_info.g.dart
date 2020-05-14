// GENERATED CODE - DO NOT MODIFY BY HAND

part of registration_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegistrationInfo> _$registrationInfoSerializer =
    new _$RegistrationInfoSerializer();

class _$RegistrationInfoSerializer
    implements StructuredSerializer<RegistrationInfo> {
  @override
  final Iterable<Type> types = const [RegistrationInfo, _$RegistrationInfo];
  @override
  final String wireName = 'RegistrationInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, RegistrationInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'savePassword',
      serializers.serialize(object.savePassword,
          specifiedType: const FullType(bool)),
    ];
    if (object.uid != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(object.uid,
            specifiedType: const FullType(String)));
    }
    if (object.displayName != null) {
      result
        ..add('displayName')
        ..add(serializers.serialize(object.displayName,
            specifiedType: const FullType(String)));
    }
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    if (object.verificationId != null) {
      result
        ..add('verificationId')
        ..add(serializers.serialize(object.verificationId,
            specifiedType: const FullType(String)));
    }
    if (object.smsCode != null) {
      result
        ..add('smsCode')
        ..add(serializers.serialize(object.smsCode,
            specifiedType: const FullType(String)));
    }
    if (object.birthDate != null) {
      result
        ..add('birthDate')
        ..add(serializers.serialize(object.birthDate,
            specifiedType: const FullType(DateTime)));
    }
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RegistrationInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegistrationInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'verificationId':
          result.verificationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'smsCode':
          result.smsCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthDate':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'savePassword':
          result.savePassword = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$RegistrationInfo extends RegistrationInfo {
  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phone;
  @override
  final String verificationId;
  @override
  final String smsCode;
  @override
  final DateTime birthDate;
  @override
  final String photoUrl;
  @override
  final bool savePassword;

  factory _$RegistrationInfo(
          [void Function(RegistrationInfoBuilder) updates]) =>
      (new RegistrationInfoBuilder()..update(updates)).build();

  _$RegistrationInfo._(
      {this.uid,
      this.displayName,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.verificationId,
      this.smsCode,
      this.birthDate,
      this.photoUrl,
      this.savePassword})
      : super._() {
    if (savePassword == null) {
      throw new BuiltValueNullFieldError('RegistrationInfo', 'savePassword');
    }
  }

  @override
  RegistrationInfo rebuild(void Function(RegistrationInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationInfoBuilder toBuilder() =>
      new RegistrationInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationInfo &&
        uid == other.uid &&
        displayName == other.displayName &&
        username == other.username &&
        email == other.email &&
        password == other.password &&
        phone == other.phone &&
        verificationId == other.verificationId &&
        smsCode == other.smsCode &&
        birthDate == other.birthDate &&
        photoUrl == other.photoUrl &&
        savePassword == other.savePassword;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, uid.hashCode),
                                            displayName.hashCode),
                                        username.hashCode),
                                    email.hashCode),
                                password.hashCode),
                            phone.hashCode),
                        verificationId.hashCode),
                    smsCode.hashCode),
                birthDate.hashCode),
            photoUrl.hashCode),
        savePassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegistrationInfo')
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('username', username)
          ..add('email', email)
          ..add('password', password)
          ..add('phone', phone)
          ..add('verificationId', verificationId)
          ..add('smsCode', smsCode)
          ..add('birthDate', birthDate)
          ..add('photoUrl', photoUrl)
          ..add('savePassword', savePassword))
        .toString();
  }
}

class RegistrationInfoBuilder
    implements Builder<RegistrationInfo, RegistrationInfoBuilder> {
  _$RegistrationInfo _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _verificationId;
  String get verificationId => _$this._verificationId;
  set verificationId(String verificationId) =>
      _$this._verificationId = verificationId;

  String _smsCode;
  String get smsCode => _$this._smsCode;
  set smsCode(String smsCode) => _$this._smsCode = smsCode;

  DateTime _birthDate;
  DateTime get birthDate => _$this._birthDate;
  set birthDate(DateTime birthDate) => _$this._birthDate = birthDate;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  bool _savePassword;
  bool get savePassword => _$this._savePassword;
  set savePassword(bool savePassword) => _$this._savePassword = savePassword;

  RegistrationInfoBuilder();

  RegistrationInfoBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _displayName = _$v.displayName;
      _username = _$v.username;
      _email = _$v.email;
      _password = _$v.password;
      _phone = _$v.phone;
      _verificationId = _$v.verificationId;
      _smsCode = _$v.smsCode;
      _birthDate = _$v.birthDate;
      _photoUrl = _$v.photoUrl;
      _savePassword = _$v.savePassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RegistrationInfo;
  }

  @override
  void update(void Function(RegistrationInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegistrationInfo build() {
    final _$result = _$v ??
        new _$RegistrationInfo._(
            uid: uid,
            displayName: displayName,
            username: username,
            email: email,
            password: password,
            phone: phone,
            verificationId: verificationId,
            smsCode: smsCode,
            birthDate: birthDate,
            photoUrl: photoUrl,
            savePassword: savePassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
