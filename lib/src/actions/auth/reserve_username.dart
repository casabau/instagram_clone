library reserve_username;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';

part 'reserve_username.g.dart';

abstract class ReserveUsername //
    implements
        Built<ReserveUsername, ReserveUsernameBuilder>,
        AppAction //
{
  factory ReserveUsername([void Function(ReserveUsernameBuilder b) updates]) = _$ReserveUsername;

  ReserveUsername._();
}

abstract class ReserveUsernameSuccessful //
    implements
        Built<ReserveUsernameSuccessful, ReserveUsernameSuccessfulBuilder>,
        AppAction //
{
  factory ReserveUsernameSuccessful(String username) {
    return _$ReserveUsernameSuccessful((ReserveUsernameSuccessfulBuilder b) {
      b.username = username;
    });
  }

  ReserveUsernameSuccessful._();

  String get username;
}

abstract class ReserveUsernameError //
    implements
        Built<ReserveUsernameError, ReserveUsernameErrorBuilder>,
        ErrorAction //
{
  factory ReserveUsernameError(Object error) {
    return _$ReserveUsernameError((ReserveUsernameErrorBuilder b) => b.error = error);
  }

  ReserveUsernameError._();

  @override
  Object get error;
}

//class ReserveUsername {}
//
//class ReserveUsernameSuccessful {
//  const ReserveUsernameSuccessful(this.username);
//
//  final String username;
//}
//
//class ReserveUsernameError {
//  const ReserveUsernameError(this.error);
//
//  final Object error;
//}
