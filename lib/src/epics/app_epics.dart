import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/actions/bootstrap.dart';
import 'package:instagramclone/src/data/auth_api.dart';
import 'package:instagramclone/src/data/post_api.dart';
import 'package:instagramclone/src/epics/auth_epics.dart';
import 'package:instagramclone/src/epics/post_epics.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/app_user.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({
    @required AuthApi authApi,
    @required PostApi postApi,
  })  : assert(authApi != null),
        assert(postApi != null),
        _authApi = authApi,
        _postApi = postApi;

  final AuthApi _authApi;
  final PostApi _postApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, Bootstrap>(_initializeApp),
      AuthEpics(authApi: _authApi).epics,
      PostEpics(postApi: _postApi).epics,
    ]);
  }

  Stream<AppAction> _initializeApp(Stream<Bootstrap> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((Bootstrap action) => _authApi.getUser())
        .map<AppAction>((AppUser user) => BootstrapSuccessful(user))
        .onErrorReturnWith((dynamic error) => BootstrapError(error));
  }
}
