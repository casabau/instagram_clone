library delete_like;

import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';
import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/models/likes/like_type.dart';

part 'delete_like.g.dart';

abstract class DeleteLike //
    implements
        Built<DeleteLike, DeleteLikeBuilder>,
        AppAction //
{
  factory DeleteLike({
    @required String likeId,
    @required LikeType type,
    @required String parentId,
  }) {
    return _$DeleteLike((DeleteLikeBuilder b) {
      b
        ..likeId = likeId
        ..type = type
        ..parentId = parentId;
    });
  }

  DeleteLike._();

  String get likeId;

  LikeType get type;

  String get parentId;
}

abstract class DeleteLikeSuccessful //
    implements
        Built<DeleteLikeSuccessful, DeleteLikeSuccessfulBuilder>,
        AppAction //
{
  factory DeleteLikeSuccessful({
    @required String likeId,
    @required LikeType type,
    @required String parentId,
  }) {
    return _$DeleteLikeSuccessful((DeleteLikeSuccessfulBuilder b) {
      b
        ..likeId = likeId
        ..type = type
        ..parentId = parentId;
    });
  }

  DeleteLikeSuccessful._();

  LikeType get type;

  String get parentId;

  String get likeId;
}

abstract class DeleteLikeError //
    implements
        Built<DeleteLikeError, DeleteLikeErrorBuilder>,
        ErrorAction //
{
  factory DeleteLikeError(Object error) {
    return _$DeleteLikeError((DeleteLikeErrorBuilder b) => b.error = error);
  }

  DeleteLikeError._();

  @override
  Object get error;
}
