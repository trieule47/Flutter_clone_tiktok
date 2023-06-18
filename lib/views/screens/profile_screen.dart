import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_tiktok/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  ProfileScreen({super.key, required this.uid});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    print(widget.uid);
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if(controller.user.isEmpty) {
            return const Center(child: CircularProgressIndicator(),);
          }
          return Obx(() {
              return Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.black12,
                    leading: InkWell(
                      child: const Icon(Icons.person_add_alt_outlined),
                      onTap: () {
                        print('Hello');
                      },
                    ),
                    title: Center(child: Text(controller.user['name'])),
                    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: const Icon(Icons.menu),
                          onTap: () {
                            print('Hello');
                          },
                        ),
                      )
                    ]),
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: controller.user['profilePhoto'],
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                              placeholder: (context, url) =>
                                 const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                          InkWell(
                            child: const Icon(Icons.add_a_photo),
                            onTap: () {
                              print('hello');
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(controller.user['following']),
                              const Text(
                                'Following',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(controller.user['followers']),
                              const Text(
                                'Followers',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(controller.user['likes']),
                              const Text(
                                'Likes',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 47,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Center(
                          child: InkWell(
                            child: Text(
                              authController.user.uid == widget.uid
                                  ? 'Sign out'
                                  : controller.user['isFollowing']
                                      ? 'Unfollow'
                                      : 'Follow',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            onTap: () {
                              if (authController.user.uid == widget.uid) {
                                authController.signOut();
                              } else {
                                print('follow');
                                controller.followUser();
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.user['thumbnails'].length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 5),
                            itemBuilder: (context, index) {
                              String thumbnail =
                                  controller.user['thumbnails'][index];
                              return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                  ),
                                  child: CachedNetworkImage(imageUrl: thumbnail, fit: BoxFit.cover),);
                            }),
                      )
                    ],
                  ),
                ),
              );
            }
          );
        });
  }
}
