library like;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:instagramclone/src/models/likes/like_type.dart';
import 'package:instagramclone/src/models/serializers.dart';
import 'package:meta/meta.dart';

part 'like.g.dart';

abstract class Like implements Built<Like, LikeBuilder> {
  factory Like({
    @required String id,
    @required String uid,
    @required String parentId,
    @required LikeType type,
  }) {
    return _$Like((LikeBuilder b) {
      b
        ..id = id
        ..uid = uid
        ..parentId = parentId
        ..createdAt = DateTime.now().toUtc()
        ..type = type;
    });
  }

  factory Like.fromJson(Map<dynamic, dynamic> json) => serializers.deserializeWith(serializer, json);

  Like._();

  String get id;

  String get uid;

  String get parentId;

  DateTime get createdAt;

  LikeType get type;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<Like> get serializer => _$likeSerializer;
}
