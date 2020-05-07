library logout;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';

part 'logout.g.dart';
abstract class LogOut //
    implements
        Built<LogOut, LogOutBuilder>,
        AppAction //
{
  factory LogOut([void Function(LogOutBuilder b) updates]) = _$LogOut;
  LogOut._();
}
abstract class LogOutSuccessful //
    implements
        Built<LogOutSuccessful, LogOutSuccessfulBuilder>,
        AppAction //
{
  factory LogOutSuccessful() {
    return _$LogOutSuccessful((LogOutSuccessfulBuilder b){
    });
  }

  LogOutSuccessful._();
}
abstract class LogOutError //
    implements
        Built<LogOutError, LogOutErrorBuilder>,
        ErrorAction //
{
  factory LogOutError(Object error) {
      return _$LogOutError((LogOutErrorBuilder b) => b.error = error);
  }
  LogOutError._();
  @override
  Object get error;
}





//class Logout {}
//
//class LogoutSuccessful {}
//
//class LogoutError {
//  const LogoutError(this.error);
//
//  final Object error;
//}
