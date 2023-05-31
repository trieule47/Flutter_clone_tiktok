import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_clone_tiktok/constants.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import '../models/video.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String video) async {
    final compressVideo = await VideoCompress.compressVideo(video,
        quality: VideoQuality.MediumQuality);
    return compressVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnails(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);

    UploadTask uploadTask = ref.putFile(await _getThumbnails(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();

      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      Video video = Video(
          username: (userDoc.data()! as Map<String, dynamic>)['name'],
          uid: uid,
          id: "Video $len",
          likes: [],
          caption: caption,
          videoUrl: videoUrl,
          commentCount: 0,
          shareCount: 0,
          songName: songName,
          profilePhoto:
              (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
          thumbnail: thumbnail);

      await firestore.collection('videos').doc('Video $len').set(
            video.toJson(),
          );
      Get.back();
    } catch (e) {
      Get.snackbar('Error Uploading Video', e.toString());
    }
  }
}
