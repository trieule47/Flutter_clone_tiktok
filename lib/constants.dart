import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_tiktok/controllers/auth_controller.dart';
import 'package:flutter_clone_tiktok/views/screens/add_video_screen.dart';
import 'package:flutter_clone_tiktok/views/screens/video_screen.dart';

//Colors
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//avatar
const avatarDefaultUrl =
    'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg';

//Firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//Controller
var authController = AuthController.instance;

//
const pages = [
  VideoScreen(),
  Text('Search Screen'),
  AddVideoScreen(),
  Text('Message Screen'),
  Text('Profile Screen'),
];
