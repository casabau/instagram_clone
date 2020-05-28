library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:instagramclone/src/models/likes/like.dart';
import 'package:instagramclone/src/models/likes/like_type.dart';
import 'package:instagramclone/src/models/likes/likes_state.dart';
import 'package:instagramclone/src/models/posts/save_post_info.dart';
import 'package:instagramclone/src/models/auth/app_user.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/posts/post.dart';
import 'package:instagramclone/src/models/posts/posts_state.dart';
import 'package:instagramclone/src/models/auth/registration_info.dart';
import 'package:instagramclone/src/models/auth/auth_state.dart';
import 'package:instagramclone/src/models/comments/comment.dart';
import 'package:instagramclone/src/models/comments/comments_state.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  AppState,
  AppUser,
  RegistrationInfo,
  Post,
  SavePostInfo,
  Comment,
  AuthState,
  PostsState,
  CommentsState,
  LikesState,
  LikeType,
  Like,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin()))
    .build();
