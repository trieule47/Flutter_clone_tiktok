import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0, viewportFraction: 1);
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              VideoPlayerItem(videoUrl: 'https://firebasestorage.googleapis.com/v0/b/tiktok-project-bf696.appspot.com/o/videos%2FVideo%200?alt=media&token=b26984f3-ee29-4abc-a747-2930ae080627',),
              Column(
                children: [
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Following'),
                      Text('For you'),
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}