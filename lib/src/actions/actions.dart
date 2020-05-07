import 'package:instagramclone/src/models/app_user.dart';

abstract class AppAction {}

abstract class ErrorAction extends AppAction {
  Object get error;
}

abstract class UserAction implements AppAction {
  AppUser get user;
}

typedef ActionResult = void Function(AppAction action);
