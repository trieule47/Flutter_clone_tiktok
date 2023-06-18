import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clone_tiktok/constants.dart';
import 'package:get/get.dart';

import '../models/video.dart';

class ProfileController extends GetxController {
  final Rx<List<Video>> _videos = Rx<List<Video>>([]);
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});

  Map<String, dynamic> get user => _user.value;

  Rx<String> _uid = "".obs;

  updateUserId(String uid) {
    _uid.value = uid;
    getUserData();
  }

  getUserData() async {
    List<String> thumbnails = [];
    QuerySnapshot myVideos = await firestore
        .collection('videos')
        .where('uid', isEqualTo: _uid.value)
        .get();
    for (var i = 0; i < myVideos.docs.length; i++) {
      thumbnails.add((myVideos.docs[i].data()! as dynamic)['thumbnail']);
    }

    DocumentSnapshot userDoc =
        await firestore.collection('user').doc(_uid.value).get();
    final userData = userDoc.data()! as dynamic;
    String name = userData['name'];
    String profilePhoto = userData['profilePhoto'];
    int likes = 0;
    int followers = 0;
    int following = 0;
    bool isFollowing = false;

    for (var item in myVideos.docs) {
      likes += (item['likes'] as List).length;
    }

    var followerDoc = await firestore
        .collection('user')
        .doc(_uid.value)
        .collection('followers')
        .get();

    var followingDoc = await firestore
        .collection('user')
        .doc(_uid.value)
        .collection('following')
        .get();

    followers = followerDoc.docs.length;
    following = followingDoc.docs.length;

    firestore
        .collection('user')
        .doc(_uid.value)
        .collection('followers')
        .doc(authController.user.uid)
        .get()
        .then((value) {
      if (value.exists) {
        isFollowing = true;
      } else {
        isFollowing = false;
      }
    });
    print('likes ' + likes.toString());

    _user.value = {
      'followers': followers.toString(),
      'following': following.toString(),
      'likes': likes.toString(),
      'isFollowing': isFollowing,
      'profilePhoto': profilePhoto,
      'name': name,
      'thumbnails': thumbnails,
    };
    print(_user.value.toString());
    // update();
  }

  followUser() async {
    print('into ');
    var doc = await firestore
        .collection('user')
        .doc(_uid.value)
        .collection('followers')
        .doc(authController.user.uid)
        .get();

    if (!doc.exists) {
      await firestore
          .collection('user')
          .doc(_uid.value)
          .collection('followers')
          .doc(authController.user.uid)
          .set({});
      await firestore
          .collection('user')
          .doc(authController.user.uid)
          .collection('following')
          .doc(_uid.value)
          .set({});
      _user.value.update(
        'followers',
        (value) => (int.parse(value) + 1).toString(),
      );
      print(_user.value.toString());
    } else {
      await firestore
          .collection('user')
          .doc(_uid.value)
          .collection('followers')
          .doc(authController.user.uid)
          .delete();
      await firestore
          .collection('user')
          .doc(authController.user.uid)
          .collection('following')
          .doc(_uid.value)
          .delete();

      _user.value.update(
        'followers',
        (value) => (int.parse(value) - 1).toString(),
      );
            print(_user.value.toString());

    }
    _user.value.update('isFollowing', (value) => !value);
                print(_user.value.toString());
                update();

  }
}
