import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/actions/auth/update_registration_info.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/reducer/auth_reducer.dart';
import 'package:instagramclone/src/reducer/post_reducer.dart';
import 'package:redux/redux.dart';

AppState reducer(AppState state, dynamic action) {
  final AppState result = _reducer(state, action);
  if (action is ErrorAction) {
    final dynamic error = action.error;
    try {
      print('error: $error');
      print('stackTrace: ${error.stackTrace}');
    } catch (_) {}
  }
  print(action);
  return result;
}

Reducer<AppState> _reducer = combineReducers<AppState>(<Reducer<AppState>>[
  authReducer,
  postReducer,
]);
