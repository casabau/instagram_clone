library create_message;

import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/models/chats/message.dart';

part 'create_message.g.dart';

abstract class CreateMessage //
    implements
        Built<CreateMessage, CreateMessageBuilder>,
        AppAction //
    {
  factory CreateMessage(String text) {
    return _$CreateMessage((CreateMessageBuilder b) => b.text = text);
  }

  CreateMessage._();

  String get text;
}

abstract class CreateMessageSuccessful //
    implements
        Built<CreateMessageSuccessful, CreateMessageSuccessfulBuilder>,
        AppAction //
    {
  factory CreateMessageSuccessful(Message message) {
    return _$CreateMessageSuccessful((CreateMessageSuccessfulBuilder b) {
      b.message = message.toBuilder();
    });
  }

  CreateMessageSuccessful._();

  Message get message;
}

abstract class CreateMessageError //
    implements
        Built<CreateMessageError, CreateMessageErrorBuilder>,
        ErrorAction //
    {
  factory CreateMessageError(Object error) {
    return _$CreateMessageError((CreateMessageErrorBuilder b) => b.error = error);
  }

  CreateMessageError._();

  @override
  Object get error;
}