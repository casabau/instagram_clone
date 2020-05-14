import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/actions/comments/create_comment.dart';
import 'package:instagramclone/src/data/comments_api.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/comments/comment.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:instagramclone/src/actions/comments/listen_for_comments.dart';

class CommentsEpics {
  const CommentsEpics({
    @required CommentsApi commentsApi,
  })  : assert(commentsApi != null),
        _api = commentsApi;

  final CommentsApi _api;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, CreateComment>(_createComment),
      _listenForComments,
    ]);
  }

  Stream<AppAction> _createComment(Stream<CreateComment> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((CreateComment action) => _api
            .create(
              uid: store.state.auth.user.uid,
              postId: store.state.posts.selectedPostId,
              text: action.text,
            )
            .asStream()
            .map<AppAction>((Comment comment) => CreateCommentSuccessful(comment))
            .onErrorReturnWith((dynamic error) => CreateCommentError(error))
            .doOnData(action.result));
  }

  Stream<AppAction> _listenForComments(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions //
        .whereType<ListenForComments>()
        .flatMap((ListenForComments action) => _api
            .listen(store.state.posts.selectedPostId)
            .map<AppAction>((List<Comment> comments) => OnCommentsEvent(comments))
            .takeUntil(actions.whereType<StopListenForComments>())
            .onErrorReturnWith((dynamic error) => ListenForCommentsError(error)));
  }
}
