import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagramclone/src/models/likes/like.dart';
import 'package:instagramclone/src/models/likes/like_type.dart';
import 'package:instagramclone/src/models/posts/post.dart';
import 'package:meta/meta.dart';

class PostApi {
  const PostApi({@required Firestore firestore})
      : assert(firestore != null),
        _firestore = firestore;

  final Firestore _firestore;

  Stream<List<Post>> listen(String uid) {
    return _firestore //
        .collection('posts')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.documents //
            .map((DocumentSnapshot document) => Post.fromJson(document.data))
            .toList());
  }
// 1. Create like
  Future<Like> create({
    @required String parentId,
    @required String uid,
    @required LikeType type,
  }) async {
    final DocumentReference documentRef = _firestore.collection('likes').document(); // avem path in firestore
    // acuma se creaza like-ul
    final Like like = Like(
      id: documentRef.documentID,
      parentId: parentId,
      uid: uid,
      type: type,
    );

    // 2. Save like
    await documentRef.setData(like.json);

    // 3. Update likes count

    String parent;
    if(type == LikeType.post){
      parent = 'posts';
    } else if (type == LikeType.comment){
      parent = 'comments';
    }else {
      throw ArgumentError('This parent does not exists $type');
    }
    final DocumentReference parentRef = _firestore.document('posts/$parentId/likes');

    await parentRef.updateData(<String, dynamic>{'likes': FieldValue.increment(1)});

    return like;
  }
}
