library update_post_info;

import 'package:built_value/built_value.dart';
import 'package:instagramclone/src/actions/actions.dart';
import 'package:instagramclone/src/models/save_post_info.dart';

part 'update_post_info.g.dart';

abstract class UpdatePostInfo //
    implements
        Built<UpdatePostInfo, UpdatePostInfoBuilder>,
        AppAction //
{
  factory UpdatePostInfo(SavePostInfo info) {
    return _$UpdatePostInfo((UpdatePostInfoBuilder b) => b.info = info.toBuilder());
  }

  UpdatePostInfo._();

  SavePostInfo get info;
}
