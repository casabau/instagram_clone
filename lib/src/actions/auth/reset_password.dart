library reset_password;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';

part 'reset_password.g.dart';

abstract class ResetPassword //
    implements
        Built<ResetPassword, ResetPasswordBuilder>,
        AppAction //
{
  factory ResetPassword(String email, ActionResult result) {
    return _$ResetPassword((ResetPasswordBuilder b) {
      b
        ..email = email
        ..result = result;
    });
  }

  ResetPassword._();

  String get email;

  ActionResult get result;
}

abstract class ResetPasswordSuccessful //
    implements
        Built<ResetPasswordSuccessful, ResetPasswordSuccessfulBuilder>,
        AppAction //
{
  factory ResetPasswordSuccessful([void Function(ResetPasswordSuccessfulBuilder b) updates]) =
      _$ResetPasswordSuccessful;

  ResetPasswordSuccessful._();
}

abstract class ResetPasswordError //
    implements
        Built<ResetPasswordError, ResetPasswordErrorBuilder>,
        ErrorAction //
{
  factory ResetPasswordError(Object error) {
    return _$ResetPasswordError((ResetPasswordErrorBuilder b) => b.error = error);
  }

  ResetPasswordError._();

  @override
  Object get error;
}

//
//
//class ResetPassword {
//  const ResetPassword(this.email, this.result);
//
//  final String email;
//
//  final ActionResult result;
//}
//
//class ResetPasswordSuccessful {}
//
//class ResetPasswordError {
//  const ResetPasswordError(this.error);
//
//  final Object error;
//}
