import 'package:instagramclone/src/actions/comments/create_comment.dart';
import 'package:instagramclone/src/actions/comments/listen_for_comments.dart';
import 'package:instagramclone/src/models/comments/comments_state.dart';
import 'package:redux/redux.dart';

Reducer<CommentsState> commentsReducer = combineReducers<CommentsState>(<Reducer<CommentsState>>[
  TypedReducer<CommentsState, OnCommentsEvent>(_onCommentsEvent),
]);

CommentsState _onCommentsEvent(CommentsState state, OnCommentsEvent action) {
  return state.rebuild((CommentsStateBuilder b) {
    b.comments = action.comments.toBuilder();
  });
}