import 'package:built_collection/built_collection.dart';
import 'package:instagramclone/src/actions/likes/create_like.dart';
import 'package:instagramclone/src/models/likes/like.dart';
import 'package:instagramclone/src/models/likes/like_type.dart';
import 'package:instagramclone/src/models/likes/likes_state.dart';
import 'package:redux/redux.dart';

Reducer<LikesState> postReducer = combineReducers<LikesState>(<Reducer<LikesState>>[
  TypedReducer<LikesState, CreateLikeSuccessful>(_createLikeSuccessful),
]);

LikesState _createLikeSuccessful(LikesState state, CreateLikeSuccessful action) {
  return state.rebuild((LikesStateBuilder b) {
    if (action.like.type == LikeType.post) {
      final ListBuilder<Like> list = b.posts[action.like.parentId]?.toBuilder() ?? ListBuilder<Like>();
      if (!list.build().contains(action.like)) {
        list.add(action.like);
      }
      b.posts[action.like.parentId] = list.build();
    } else if (action.like.type == LikeType.comment) {
      final ListBuilder<Like> list = b.comments[action.like.parentId]?.toBuilder() ?? ListBuilder<Like>();
      if (!list.build().contains(action.like)) {
        list.add(action.like);
      }
      b.comments[action.like.parentId] = list.build();
    } else {
      throw ArgumentError('Unknown like type ${action.like.type}');
    }
  });
}
