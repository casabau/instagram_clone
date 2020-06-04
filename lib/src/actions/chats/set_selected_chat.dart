library set_selected_chat;

import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';

part 'set_selected_chat.g.dart';

abstract class SetSelectedChat //
    implements
        Built<SetSelectedChat, SetSelectedChatBuilder>,
        AppAction //
    {
  factory SetSelectedChat(String chatId) {
    return _$SetSelectedChat((SetSelectedChatBuilder b) => b.chatId = chatId);
  }

  SetSelectedChat._();

  String get chatId;
}