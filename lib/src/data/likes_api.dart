import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagramclone/src/models/likes/like.dart';
import 'package:instagramclone/src/models/likes/like_type.dart';
import 'package:instagramclone/src/models/posts/post.dart';
import 'package:meta/meta.dart';

class LikesApi {
  const LikesApi({@required Firestore firestore})
      : assert(firestore != null),
        _firestore = firestore;

  final Firestore _firestore;

  Future<List<Like>> getLikes(String parentId) async {
    final QuerySnapshot snapshot = await _firestore //
        .collection('likes')
        .where('parentId', isEqualTo: parentId)
        .getDocuments();

    return snapshot //
        .documents
        .map((DocumentSnapshot snapshot) => Like.fromJson(snapshot.data))
        .toList();
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

    return like;
  }

  Future<void> delete(String likeId) async {
    final DocumentReference documentRef = _firestore.document('likes/$likeId');
    await documentRef.delete();
  }
}
// 1. update rules to allow this operation
// 2. used admin sdk to increment the field
