library app_state;

import 'package:instagramclone/src/models/auth/auth_state.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:instagramclone/src/models/comments/comments_state.dart';
import 'package:instagramclone/src/models/likes/like_type.dart';
import 'package:instagramclone/src/models/likes/likes_state.dart';
import 'package:instagramclone/src/models/serializers.dart';
import 'package:instagramclone/src/models/posts/posts_state.dart';


part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() = _$AppState;

  AppState._();

  factory AppState.fromJson(Map<dynamic, dynamic> json) => serializers.deserializeWith(serializer, json);

  AuthState get auth;

  PostsState get posts;

  CommentsState get comments;

  LikeType get type;

  LikesState get likes;


  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
