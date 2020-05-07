import 'package:instagramclone/src/actions/auth/login.dart';
import 'package:instagramclone/src/actions/auth/logout.dart';
import 'package:instagramclone/src/actions/auth/registration.dart';
import 'package:instagramclone/src/actions/auth/reset_password.dart';
import 'package:instagramclone/src/data/auth_api.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/app_user.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:instagramclone/src/actions/auth/send_sms.dart';
import 'package:instagramclone/src/actions/auth/reserve_username.dart';

class AuthMiddleware {
  AuthMiddleware({@required this.authApi});

  final AuthApi authApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, Login>(_login),
      TypedMiddleware<AppState, LogOut>(_logout),
      TypedMiddleware<AppState, ResetPassword>(_resetPassword),
      TypedMiddleware<AppState, Register>(_register),
      TypedMiddleware<AppState, ReserveUsername>(_reserveUsername),
      TypedMiddleware<AppState, SendSms>(_sendSms),
    ];
  }

  Future<void> _login(Store<AppState> store, Login action, NextDispatcher next) async {
    next(action);

    try {
      final AppUser user = await authApi.login(action.email, action.password);
      store.dispatch(LoginSuccessful(user));
    } catch (error) {
      store.dispatch(LoginError(error));
    }
  }

  Future<void> _logout(Store<AppState> store, LogOut action, NextDispatcher next) async {
    next(action);

    try {
      await authApi.logOut();
      store.dispatch(LogOutSuccessful());
    } catch (error) {
      store.dispatch(LogOutError(error));
    }
  }

  Future<void> _resetPassword(Store<AppState> store, ResetPassword action, NextDispatcher next) async {
    next(action);

    try {
      await authApi.sendForgotPasswordEmail(action.email);

      final ResetPasswordSuccessful successfulAction = ResetPasswordSuccessful();
      store.dispatch(successfulAction);
      action.result(successfulAction);
    } catch (error) {
      final ResetPasswordError errorAction = ResetPasswordError(error);
      store.dispatch(errorAction);
      action.result(errorAction);
    }
  }

  Future<void> _register(Store<AppState> store, Register action, NextDispatcher next) async {
    next(action);

    try {
      final AppUser user = await authApi.signUp(store.state.info);
      final RegisterSuccessful successfulAction = RegisterSuccessful(user);
      store.dispatch(successfulAction);
      action.result(successfulAction);
    } catch (error) {
      final RegisterError errorAction = RegisterError(error);
      store.dispatch(errorAction);
      action.result(errorAction);
    }
  }

  Future<void> _reserveUsername(Store<AppState> store, ReserveUsername action, NextDispatcher next) async {
    next(action);

    try {
      final String username =
      await authApi.reserveUsername(email: store.state.info.email, displayName: store.state.info.displayName);
      store.dispatch(ReserveUsernameSuccessful(username));
    } catch (error) {
      store.dispatch(ReserveUsernameError(error));
    }
  }

  Future<void> _sendSms(Store<AppState> store, SendSms action, NextDispatcher next) async {
    next(action);

    try {
      final String verificationId = await authApi.sendSms(store.state.info.phone);
      final SendSmsSuccessful successful = SendSmsSuccessful(verificationId);
      store.dispatch(successful);
      action.result(successful);
    } catch (e) {
      final SendSmsError error = SendSmsError(e);
      store.dispatch(error);
      action.result(error);
    }
  }
}
