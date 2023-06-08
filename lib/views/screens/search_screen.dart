import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/search_controller.dart';
import '../../models/user.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchsController searchController = Get.put(SearchsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: TextFormField(
              decoration: InputDecoration(
                filled: false,
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onFieldSubmitted: (value) {
                searchController.searchUser(value);
              },
            ),
          ),
          body: searchController.searchedUsers.isEmpty
              ? const Center(
                  child: Text(
                    'Search user',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w700),
                  ),
                )
              : ListView.builder(
                  itemCount: searchController.searchedUsers.length,
                  itemBuilder: (context, index) {
                    User user = searchController.searchedUsers[index];
                    return InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.profilePhoto)),
                        title: Text(
                          user.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      }
    );
  }
}
