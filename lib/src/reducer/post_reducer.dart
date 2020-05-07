import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/actions/create_post.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> postReducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, CreatePostSuccessful>(_createPostSuccessful),

]);

AppState _createPostSuccessful(AppState state, CreatePostSuccessful action) {
  return state.rebuild((AppStateBuilder b) => b.posts.add(action.post));
}