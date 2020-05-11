import 'package:instagramclone/src/actions/create_post.dart';
import 'package:instagramclone/src/actions/update_post_info.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> postReducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, CreatePostSuccessful>(_createPostSuccessful),
  TypedReducer<AppState, UpdatePostInfo>(_updatePostInfo),
]);

AppState _createPostSuccessful(AppState state, CreatePostSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..posts.add(action.post)
      ..savePostInfo = null;
  });
}

AppState _updatePostInfo(AppState state, UpdatePostInfo action) {
  return state.rebuild((AppStateBuilder b) => b.savePostInfo = action.info.toBuilder());
}