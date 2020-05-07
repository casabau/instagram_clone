library create_post;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/models/post.dart';

part 'create_post.g.dart';

abstract class CreatePost //
    implements
        Built<CreatePost, CreatePostBuilder>,
        AppAction //
{
  factory CreatePost(String description, List<String> pictures, ActionResult result) {
    return _$CreatePost((CreatePostBuilder b) {
      b
        ..description = description
        ..result = result
        ..pictures = ListBuilder<String>(pictures);
    });
  }

  CreatePost._();

  String get description;

  BuiltList<String> get pictures;

  ActionResult get result;
}

abstract class CreatePostSuccessful //
    implements
        Built<CreatePostSuccessful, CreatePostSuccessfulBuilder>,
        AppAction //
{
  factory CreatePostSuccessful(Post post) {
    return _$CreatePostSuccessful((CreatePostSuccessfulBuilder b) {
      b.post = post.toBuilder();
    });
  }

  CreatePostSuccessful._();

  Post get post;
}

abstract class CreatePostError //
    implements
        Built<CreatePostError, CreatePostErrorBuilder>,
        ErrorAction //
{
  factory CreatePostError(Object error) {
    return _$CreatePostError((CreatePostErrorBuilder b) => b.error = error);
  }

  CreatePostError._();

  @override
  Object get error;
}
