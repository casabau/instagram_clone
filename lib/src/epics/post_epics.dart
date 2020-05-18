import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/actions/auth/get_contact.dart';
import 'package:instagramclone/src/actions/posts/create_post.dart';
import 'package:instagramclone/src/actions/posts/listen_for_posts.dart';
import 'package:instagramclone/src/data/post_api.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/posts/post.dart';
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
      _listenForPosts,
    ]);
  }

  Stream<AppAction> _createPost(Stream<CreatePost> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((CreatePost action) => _postApi
            .create(
              uid: store.state.auth.user.uid,
              description: store.state.posts.savePostInfo.description,
              pictures: store.state.posts.savePostInfo.pictures.toList(),
            )
            .asStream()
            .map<AppAction>((Post post) => CreatePostSuccessful(post))
            .onErrorReturnWith((dynamic error) => CreatePostError(error))
            .doOnData(action.result));
  }

  Stream<AppAction> _listenForPosts(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions //
        .whereType<ListenForPosts>()
        .flatMap((ListenForPosts action) => _postApi
            .listen(store.state.auth.user.uid)
            .expand<AppAction>((List<Post> posts) {
              return <AppAction>[
                OnPostsEvent(posts),
                //avem posturile (care au venit acuma). Pentru fiecare uid din contacts chem un GetContact(),
                //bazandu-ma pe uid-ul din post si ii zic toSet() ca sa am userul o singura data (sa nu fac GetContact de 1000 de ori)
                ...posts //spread operator (...)
                    .where((Post post) => store.state.auth.contacts[post.uid] == null)  //doar posturile a caror uid nu le am la contacte
                    .map((Post post) => GetContact(post.uid))
                    .toSet(),
              ];
            })
            .takeUntil(actions.whereType<StopListeningForPosts>())
            .onErrorReturnWith((dynamic error) => ListenForPostsError(error)));
  }
}
