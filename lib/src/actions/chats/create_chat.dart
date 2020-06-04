library create_chat;

import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/models/chats/chat.dart';

part 'create_chat.g.dart';

abstract class CreateChat //
    implements
        Built<CreateChat, CreateChatBuilder>,
        AppAction //
    {
  factory CreateChat(String otherUid) {
    return _$CreateChat((CreateChatBuilder b) {
      b.otherUid = otherUid;
    });
  }

  CreateChat._();

  String get otherUid;
}

abstract class CreateChatSuccessful //
    implements
        Built<CreateChatSuccessful, CreateChatSuccessfulBuilder>,
        AppAction //
    {
  factory CreateChatSuccessful(Chat chat) {
    return _$CreateChatSuccessful((CreateChatSuccessfulBuilder b) {
      b.chat = chat.toBuilder();
    });
  }

  CreateChatSuccessful._();

  Chat get chat;
}

abstract class CreateChatError //
    implements
        Built<CreateChatError, CreateChatErrorBuilder>,
        ErrorAction //
    {
  factory CreateChatError(Object error) {
    return _$CreateChatError((CreateChatErrorBuilder b) => b.error = error);
  }

  CreateChatError._();

  @override
  Object get error;
}