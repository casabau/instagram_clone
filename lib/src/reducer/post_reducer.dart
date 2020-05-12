import 'package:instagramclone/src/actions/posts/create_post.dart';
import 'package:instagramclone/src/actions/posts/listen_for_posts.dart';
import 'package:instagramclone/src/actions/posts/update_post_info.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> postReducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, CreatePostSuccessful>(_createPostSuccessful),
  TypedReducer<AppState, UpdatePostInfo>(_updatePostInfo),
  TypedReducer<AppState, OnPostsEvent>(_onPostsEvent),
]);

AppState _createPostSuccessful(AppState state, CreatePostSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.savePostInfo = null;
  });
}

AppState _updatePostInfo(AppState state, UpdatePostInfo action) {
  return state.rebuild((AppStateBuilder b) => b.savePostInfo = action.info.toBuilder());
}

AppState _onPostsEvent(AppState state, OnPostsEvent action) {
  return state.rebuild((AppStateBuilder b) {
    b.posts = action.posts.toBuilder();
  });
}
