library get_likes;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/models/likes/like.dart';

part 'get_likes.g.dart';

abstract class GetLikes //
    implements
        Built<GetLikes, GetLikesBuilder>,
        AppAction //
{
  factory GetLikes(String parentId) {
    return _$GetLikes((GetLikesBuilder b) => b.parentId = parentId);
  }

  GetLikes._();

  String get parentId;
}

abstract class GetLikesSuccessful //
    implements
        Built<GetLikesSuccessful, GetLikesSuccessfulBuilder>,
        AppAction //
{
  factory GetLikesSuccessful(List<Like> likes, String parentId) {
    return _$GetLikesSuccessful((GetLikesSuccessfulBuilder b) {
      b
        ..likes = ListBuilder<Like>(likes)
        ..parentId = parentId;
    });
  }

  GetLikesSuccessful._();

  BuiltList<Like> get likes;

  String get parentId;
}

abstract class GetLikesError //
    implements
        Built<GetLikesError, GetLikesErrorBuilder>,
        AppAction,
        ErrorAction //
{
  factory GetLikesError(Object error) {
    return _$GetLikesError((GetLikesErrorBuilder b) => b.error = error);
  }

  GetLikesError._();

  @override
  Object get error;
}
