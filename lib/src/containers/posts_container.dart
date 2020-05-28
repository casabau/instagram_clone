import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/posts/post.dart';
import 'package:redux/redux.dart';

class PostsContainer extends StatelessWidget {
  const PostsContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Post>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Post>>(
      converter: (Store<AppState> store) {
        return store.state.posts.posts.values
            // vrem sa luam doar postarile la care am contactul, ca daca nu avem contact, nu avem ce arata
            .where((Post post) => store.state.auth.contacts[post.uid] != null)
            .toList()
              ..sort();
      },
      builder: builder,
    );
  }
}
