import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/reducer/auth_reducer.dart';
import 'package:instagramclone/src/reducer/comments_reducer.dart';
import 'package:instagramclone/src/reducer/post_reducer.dart';
import 'package:instagramclone/src/reducer/likes_reducer.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is ErrorAction) {
    final dynamic error = action.error;
    try {
      print('error: $error');
      print('stackTrace: ${error.stackTrace}');
    } catch (_) {}
  }
  print(action);

  return state.rebuild((AppStateBuilder b) {
    b
      ..auth = authReducer(state.auth, action).toBuilder()
      ..posts = postReducer(state.posts, action).toBuilder()
      ..comments = commentsReducer(state.comments, action).toBuilder()
      ..likes = likesReducer(state.likes, action).toBuilder();
  });
}
