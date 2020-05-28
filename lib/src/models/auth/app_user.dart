library app_user;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:instagramclone/src/models/serializers.dart';
import 'package:meta/meta.dart';

part 'app_user.g.dart';

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  factory AppUser([void Function(AppUserBuilder b) updates]) = _$AppUser;

  AppUser._();

  factory AppUser.fromJson(Map<dynamic, dynamic> json) => serializers.deserializeWith(serializer, json);

  String get uid;

  @nullable
  String get displayName;

  @nullable
  String get username;

  @nullable
  String get email;

  @nullable
  String get phone;

  @nullable
  DateTime get birthDate;

  @nullable
  String get photoUrl;

  BuiltList<String> get following;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<AppUser> get serializer => _$appUserSerializer;
}
