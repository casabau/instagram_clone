import 'package:instagramclone/src/actions/posts/create_post.dart';
import 'package:instagramclone/src/actions/posts/listen_for_posts.dart';
import 'package:instagramclone/src/actions/posts/update_post_info.dart';
import 'package:instagramclone/src/models/posts/posts_state.dart';
import 'package:redux/redux.dart';
import 'package:instagramclone/src/actions/posts/set.dart';
import 'package:instagramclone/src/models/posts/post.dart';

Reducer<PostsState> postReducer = combineReducers<PostsState>(<Reducer<PostsState>>[
  TypedReducer<PostsState, CreatePostSuccessful>(_createPostSuccessful),
  TypedReducer<PostsState, UpdatePostInfo>(_updatePostInfo),
  TypedReducer<PostsState, OnPostsEvent>(_onPostsEvent),
  TypedReducer<PostsState, SetSelectedPost>(_setSelectedPost),
]);

PostsState _createPostSuccessful(PostsState state, CreatePostSuccessful action) {
  return state.rebuild((PostsStateBuilder b) {
    b
      ..savePostInfo = null
      ..posts[action.post.id] = action.post;
  });
}

PostsState _updatePostInfo(PostsState state, UpdatePostInfo action) {
  return state.rebuild((PostsStateBuilder b) => b.savePostInfo = action.info.toBuilder());
}

PostsState _onPostsEvent(PostsState state, OnPostsEvent action) {
  return state.rebuild((PostsStateBuilder b) {
    for (Post post in action.posts) {
      b.posts[post.id] = post;
    }
  });
}

PostsState _setSelectedPost(PostsState state, SetSelectedPost action) {
  return state.rebuild((PostsStateBuilder b) => b.selectedPostId = action.postId);
}
