library chats_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:instagramclone/src/models/chats/chat.dart';
import 'package:instagramclone/src/models/serializers.dart';
import 'package:instagramclone/src/models/chats/message.dart';

part 'chats_state.g.dart';

abstract class ChatsState implements Built<ChatsState, ChatsStateBuilder> {
  factory ChatsState([void Function(ChatsStateBuilder b) updates]) = _$ChatsState;

  factory ChatsState.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  ChatsState._();

  BuiltMap<String, Chat> get chats;

  BuiltMap<String, Message> get messages;

  @nullable
  String get selectedChatId;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;

  static Serializer<ChatsState> get serializer => _$chatsStateSerializer;
}
