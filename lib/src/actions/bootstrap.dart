library bootstrap;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/models/auth/app_user.dart';
import 'package:instagramclone/src/actions/actions.dart';

part 'bootstrap.g.dart';

abstract class Bootstrap //
    implements
        Built<Bootstrap, BootstrapBuilder>,
        AppAction //
{
  factory Bootstrap([void Function(BootstrapBuilder b) updates]) = _$Bootstrap;

  Bootstrap._();
}

abstract class BootstrapSuccessful //
    implements
        Built<BootstrapSuccessful, BootstrapSuccessfulBuilder>,
        UserAction,
        AppAction //
{
  factory BootstrapSuccessful(AppUser user) {
    return _$BootstrapSuccessful((BootstrapSuccessfulBuilder b) {
      b.user = user?.toBuilder();
    });
  }

  BootstrapSuccessful._();

  @override
  @nullable
  AppUser get user;
}

abstract class BootstrapError //
    implements
        Built<BootstrapError, BootstrapErrorBuilder>,
        ErrorAction //
{
  factory BootstrapError(Object error) {
    return _$BootstrapError((BootstrapErrorBuilder b) => b.error = error);
  }

  BootstrapError._();

  @override
  Object get error;
}
