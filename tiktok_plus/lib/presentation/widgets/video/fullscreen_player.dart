import 'package:flutter/material.dart';
import 'package:tiktok_plus/presentation/widgets/video/gradient_backgroud.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.caption
    });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;
  //bool isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =VideoPlayerController.asset(widget.videoUrl)
    ..setVolume(0)
    ..setLooping(true)
    ..play();
  }

  @override
  void dispose() {
    controller.dispose(); //limpiar recursos
    super.dispose();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return GestureDetector(
            onTap: (){
                controller.value.isPlaying
                ? controller.pause()
                : controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(children: [
                VideoPlayer(controller),
                VideoBackgroud(
                  stops: const [0.8,1.0],
                ),

                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                  ),
                ],
              ),
            ),
          );
        }else{
          return const Center(child: CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.white,));
        }
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStiles = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,maxLines: 2,style: titleStiles,
      )
    );
  }
}