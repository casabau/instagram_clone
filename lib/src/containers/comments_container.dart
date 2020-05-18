import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/comments/comment.dart';
import 'package:redux/redux.dart';

class CommentsContainer extends StatelessWidget {
  const CommentsContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Comment>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Comment>>(
      converter: (Store<AppState> store) {
        return store.state.comments.comments
            //din toate posturile, da-mi doar commenturile pentru post-ul asta
            .where((Comment comment) => comment.postId == store.state.posts.selectedPostId)
            //pentru astea, verifica-mi la care am contact
            .where((Comment comment) => store.state.auth.contacts[comment.uid] != null)
            .toList();
      },
      builder: builder,
    );
  }
}
