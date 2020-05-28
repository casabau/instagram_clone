import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/likes/like.dart';
import 'package:redux/redux.dart';

class CommentsLikesContainer extends StatelessWidget {
  const CommentsLikesContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<BuiltMap<String, BuiltList<Like>>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BuiltMap<String, BuiltList<Like>>>(
      converter: (Store<AppState> store) => store.state.likes.comments,
      builder: builder,
    );
  }
}
