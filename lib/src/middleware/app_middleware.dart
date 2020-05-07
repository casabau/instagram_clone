import 'package:instagramclone/src/actions/bootstrap.dart';
import 'package:instagramclone/src/data/auth_api.dart';
import 'package:instagramclone/src/data/post_api.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/app_user.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:instagramclone/src/middleware/auth_middleware.dart';
import 'package:instagramclone/src/middleware/post_middleware.dart';

class AppMiddleware {
  AppMiddleware({@required this.authApi, @required this.postApi});

  final AuthApi authApi;
  final PostApi postApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, Bootstrap>(_initializeApp),
      ...AuthMiddleware(authApi: authApi).middleware,
      ...PostMiddleware(postApi: postApi).middleware,
    ];
  }

  Future<void> _initializeApp(Store<AppState> store, Bootstrap action, NextDispatcher next) async {
    next(action);

    try {
      final AppUser user = await authApi.getUser();
      store.dispatch(BootstrapSuccessful(user));
    } catch (error) {
      store.dispatch(BootstrapError(error));
    }
  }


}
