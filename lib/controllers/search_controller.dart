import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clone_tiktok/constants.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class SearchsController extends GetxController {
  final Rx<List<User>> _searchUser = Rx<List<User>>([]);

  List<User> get searchedUsers => _searchUser.value;

  searchUser(String typedUser) async {
    _searchUser.bindStream(firestore
        .collection('user')
        .where('name', isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<User> retVal = [];
      for (var element in query.docs) {
        retVal.add(User.fromSnap(element));
      }
      return retVal;
    }));
  }
}
