import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/actions/auth/get_contact.dart';
import 'package:instagramclone/src/actions/auth/logout.dart';
import 'package:instagramclone/src/actions/auth/reserve_username.dart';
import 'package:instagramclone/src/actions/auth/send_sms.dart';
import 'package:instagramclone/src/actions/auth/update_registration_info.dart';
import 'package:instagramclone/src/models/auth/auth_state.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers<AuthState>(<Reducer<AuthState>>[
  TypedReducer<AuthState, UserAction>(_userAction),
  TypedReducer<AuthState, LogOutSuccessful>(_logoutSuccessful),
  TypedReducer<AuthState, UpdateRegistrationInfo>(_updateRegistrationInfo),
  TypedReducer<AuthState, ReserveUsernameSuccessful>(_reserveUsernameSuccessful),
  TypedReducer<AuthState, SendSmsSuccessful>(_sendSmsSuccessful),
  TypedReducer<AuthState, GetContactSuccessful>(_getContactSuccessful),
]);

AuthState _userAction(AuthState state, UserAction action) {
  return state.rebuild((AuthStateBuilder b) => b.user = action.user?.toBuilder());
}

AuthState _logoutSuccessful(AuthState state, LogOutSuccessful action) {
  return AuthState();
}

AuthState _updateRegistrationInfo(AuthState state, UpdateRegistrationInfo action) {
  print('here');
  return state.rebuild((AuthStateBuilder b) => b.info = action.info.toBuilder());
}

AuthState _reserveUsernameSuccessful(AuthState state, ReserveUsernameSuccessful action) {
  return state.rebuild((AuthStateBuilder b) => b.info.username = action.username);
}

AuthState _sendSmsSuccessful(AuthState state, SendSmsSuccessful action) {
  return state.rebuild((AuthStateBuilder b) => b.info.verificationId = action.verificationId);
}

AuthState _getContactSuccessful(AuthState state, GetContactSuccessful action) {
  return state.rebuild((AuthStateBuilder b) {
    b.contacts[action.user.uid] = action.user;
  });
}
