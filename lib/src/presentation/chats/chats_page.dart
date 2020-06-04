import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/actions/chats/set_selected_chat.dart';
import 'package:instagramclone/src/containers/chats_container.dart';
import 'package:instagramclone/src/containers/contacts_container.dart';
import 'package:instagramclone/src/containers/user_container.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/auth/app_user.dart';
import 'package:instagramclone/src/models/chats/chat.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: UserContainer(
        builder: (BuildContext context, AppUser currentUser) {
          return ContactsContainer(
            builder: (BuildContext context, Map<String, AppUser> contacts) {
              return ChatsContainer(
                builder: (BuildContext context, List<Chat> chats) {


                  if(chats.isEmpty){
                    return const Center(
                      child: Text('Start catting'),
                    );
                  }


                  return ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Chat chat = chats[index];
                      final String otherUid = chat.users.firstWhere((String uid) => uid != currentUser.uid);
                      final AppUser user = contacts[otherUid];

                      return ListTile(
                        leading: user.photoUrl != null ? Image.network(user.photoUrl) : null,
                        title: Text('@${user.username}'),
                        subtitle: Text(
                          chat.lastMessage == null ? 'Start chatting' : chat.lastMessage.message,
                          style: TextStyle(
                            fontStyle: chat.lastMessage == null ? FontStyle.italic : FontStyle.normal,
                          ),
                        ),
                        onTap: () {
                          StoreProvider.of<AppState>(context).dispatch(SetSelectedChat(chat.id));
                          Navigator.pushNamed(context, '/messages');
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}