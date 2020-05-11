import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/actions/create_post.dart';
import 'package:instagramclone/src/data/post_api.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/post.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class PostEpics {
  const PostEpics({
    @required PostApi postApi,
  })  : assert(postApi != null),
        _postApi = postApi;

  final PostApi _postApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, CreatePost>(_createPost),
    ]);
  }

  Stream<AppAction> _createPost(Stream<CreatePost> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((CreatePost action) => _postApi
        .create(
      uid: store.state.user.uid,
      description: store.state.savePostInfo.description,
      pictures: store.state.savePostInfo.pictures.toList(),
    )
        .asStream()
        .map<AppAction>((Post post) => CreatePostSuccessful(post))
        .onErrorReturnWith((dynamic error) => CreatePostError(error))
        .doOnData(action.result));
  }
}