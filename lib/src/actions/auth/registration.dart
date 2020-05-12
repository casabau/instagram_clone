library registration;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/models/app_user.dart';

part 'registration.g.dart';

abstract class Register //
    implements
        Built<Register, RegisterBuilder>,
        AppAction //
{
  factory Register(ActionResult result) {
    return _$Register((RegisterBuilder b) {
      b.result = result;
    });
  }

  Register._();

  ActionResult get result;
}

abstract class RegisterSuccessful //
    implements
        Built<RegisterSuccessful, RegisterSuccessfulBuilder>,
        UserAction,
        AppAction //
{
  factory RegisterSuccessful(AppUser user) {
    return _$RegisterSuccessful((RegisterSuccessfulBuilder b) {
      b.user = user.toBuilder();
    });
  }

  RegisterSuccessful._();

  @override
  AppUser get user;
}

abstract class RegisterError //
    implements
        Built<RegisterError, RegisterErrorBuilder>,
        ErrorAction //
{
  factory RegisterError(Object error) {
    return _$RegisterError((RegisterErrorBuilder b) => b.error = error);
  }

  RegisterError._();

  @override
  Object get error;
}
