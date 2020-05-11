import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/actions/create_post.dart';
import 'package:instagramclone/src/actions/update_post_info.dart';
import 'package:instagramclone/src/containers/save_post_info_container.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/save_post_info.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key key}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  void _onPostCreate(dynamic action) {
    if (action is CreatePostSuccessful) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } else {
      // todo: show error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(CreatePost(_onPostCreate));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SavePostInfoContainer(
            builder: (BuildContext context, SavePostInfo info) {
              return TextField(
                decoration: const InputDecoration(
                  hintText: 'description...',
                ),
                onChanged: (String value) {
                  info = info.rebuild((SavePostInfoBuilder b) => b.description = value);
                  StoreProvider.of<AppState>(context).dispatch(UpdatePostInfo(info));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}