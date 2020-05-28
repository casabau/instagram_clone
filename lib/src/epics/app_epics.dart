import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/actions/bootstrap.dart';
import 'package:instagramclone/src/data/auth_api.dart';
import 'package:instagramclone/src/data/comments_api.dart';
import 'package:instagramclone/src/data/post_api.dart';
import 'package:instagramclone/src/epics/auth_epics.dart';
import 'package:instagramclone/src/epics/comments_epics.dart';
import 'package:instagramclone/src/epics/post_epics.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/auth/app_user.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:instagramclone/src/epics/likes_epics.dart';
import 'package:instagramclone/src/data/likes_api.dart';

class AppEpics {
  const AppEpics({
    @required AuthApi authApi,
    @required PostApi postApi,
    @required CommentsApi commentsApi,
    @required LikesApi likesApi,
  })  : assert(authApi != null),
        assert(postApi != null),
        assert(commentsApi != null),
        assert(likesApi != null),
        _authApi = authApi,
        _postApi = postApi,
        _commentsApi = commentsApi,
        _likesApi = likesApi;

  final AuthApi _authApi;
  final PostApi _postApi;
  final CommentsApi _commentsApi;
  final LikesApi _likesApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, Bootstrap>(_bootstrap),
      AuthEpics(authApi: _authApi).epics,
      PostEpics(postApi: _postApi).epics,
      CommentsEpics(commentsApi: _commentsApi).epics,
      LikesEpics(likesApi: _likesApi).epics,
    ]);
  }

  Stream<AppAction> _bootstrap(Stream<Bootstrap> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((Bootstrap action) => _authApi
            .getUser()
            .asStream()
            .map<AppAction>((AppUser user) => BootstrapSuccessful(user))
            .onErrorReturnWith((dynamic error) => BootstrapError(error)));
  }
}
