import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 1);
    return Stack(children: [
      Scaffold(
        body: PageView.builder(
          controller: controller,
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                VideoPlayerItem(
                    videoUrl:
                        "https://firebasestorage.googleapis.com/v0/b/tiktok-project-bf696.appspot.com/o/videos%2FVideo%204?alt=media&token=31a1b54d-b515-4669-a4c7-27aae5ea7a27"
                    // 'https://firebasestorage.googleapis.com/v0/b/tiktok-project-bf696.appspot.com/o/videos%2FVideo%200?alt=media&token=b26984f3-ee29-4abc-a747-2930ae080627',
                    ),
                Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height - 129,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: size.height / 10,
                                width: size.width / 5,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(50)),
                                child: InkWell(
                                  onTap: () {
                                    print('ff');
                                  },
                                  child: CircleAvatar(),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: size.height / 10,
                            width: size.width / 5,
                            child: InkWell(
                              onTap: () {
                                print('ff');
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: 25,
                                    shadows: <Shadow>[
                                      Shadow(
                                          color: Colors.grey,
                                          blurRadius: 15.0,
                                          offset: Offset(0, 0))
                                    ],
                                  ),
                                  Text(
                                    '123',
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.grey,
                                            blurRadius: 5.0,
                                            offset: Offset(0, 0))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: size.height / 10,
                            width: size.width / 5,
                            child: InkWell(
                                onTap: () {
                                  print('ff');
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      size: 25,
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.grey,
                                            blurRadius: 15.0,
                                            offset: Offset(0, 0))
                                      ],
                                    ),
                                    Text(
                                      '123',
                                      style: TextStyle(
                                        shadows: <Shadow>[
                                          Shadow(
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                              offset: Offset(0, 0))
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                            height: size.height / 10,
                            width: size.width / 5,
                            child: InkWell(
                                onTap: () {
                                  print('ff');
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.share,
                                      size: 25,
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.grey,
                                            blurRadius: 15.0,
                                            offset: Offset(0, 0))
                                      ],
                                    ),
                                    Text(
                                      '123',
                                      style: TextStyle(
                                        shadows: <Shadow>[
                                          Shadow(
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                              offset: Offset(0, 0))
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                            height: size.height / 8,
                            width: size.width / 5,
                            child: Icon(
                              Icons.bookmark,
                              size: 30,
                              shadows: <Shadow>[
                                Shadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 0))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Following',
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                      color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 0))
                ],
              ),
            ),
            Text(
              'For you',
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                      color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 0))
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
