library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:instagramclone/src/models/app_user.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/post.dart';
import 'package:instagramclone/src/models/registration_info.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  AppState,
  AppUser,
  RegistrationInfo,
  Post,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin()))
    .build();
