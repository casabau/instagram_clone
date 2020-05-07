import 'package:instagramclone/src/actions/create_post.dart';
import 'package:instagramclone/src/data/post_api.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/post.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class PostMiddleware {
  PostMiddleware({@required this.postApi});

  final PostApi postApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, CreatePost>(_createPost),
    ];
  }

  Future<void> _createPost(Store<AppState> store, CreatePost action, NextDispatcher next) async {
    next(action);

    try {
      final Post post = await postApi.createPost(
        uid: store.state.user.uid,
        description: action.description,
        pictures: action.pictures.toList(),
      );

      final CreatePostSuccessful _result = CreatePostSuccessful(post);
      store.dispatch(_result);
      action.result(_result);
    } catch (error) {
      final CreatePostError _result= CreatePostError(error);
      store.dispatch(_result);
      action.result(_result);
    }
  }
}
