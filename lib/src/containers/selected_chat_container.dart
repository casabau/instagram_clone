import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/chats/chat.dart';
import 'package:redux/redux.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<Chat> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Chat>(
      converter: (Store<AppState> store) {
        return store.state.chats.chats[store.state.chats.selectedChatId];
      },
      builder: builder,
    );
  }
}