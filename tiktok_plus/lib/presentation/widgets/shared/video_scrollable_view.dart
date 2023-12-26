import 'package:flutter/material.dart';
import 'package:tiktok_plus/domain/video_post.dart';
import 'package:tiktok_plus/presentation/widgets/shared/video_buttons.dart';
import 'package:tiktok_plus/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollable extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollable({
    super.key,
    required this.videos
    });

  @override
  Widget build(BuildContext context) {
    //TODO: Añadir comentario de que hace esto
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return  Stack(
          children: [
            SizedBox.expand(
              //video_player
              child: FullScreenPlayer(
                videoUrl: videoPost.videoUlr,
                caption: videoPost.caption,
              ),
            ),
            Positioned(
              bottom: 40,
              right: 0,
              child: VideoButtons(video: videoPost)
              ),
          ],
        );
      },
    );
  }
}