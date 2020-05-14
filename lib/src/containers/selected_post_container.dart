import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/posts/post.dart';
import 'package:redux/redux.dart';

class SelectedPostContainer extends StatelessWidget {
  const SelectedPostContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<Post> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Post>(
      converter: (Store<AppState> store) {
        return store.state.posts.posts[store.state.posts.selectedPostId];
      },
      builder: builder,
    );
  }
}