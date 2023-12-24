import 'package:tiktok_plus/domain/video_post.dart';

class LocalVideoModel{
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name, 
    required this.videoUrl, 
     this.likes=0, 
     this.views=0
  });
  factory LocalVideoModel.fromJson(Map<String, dynamic> json){
    return LocalVideoModel(
      name: json['name'] ?? 'Unknown',
      videoUrl: json['videoUrl'],
      likes: json['likes'] ?? 0,
      views: json['views'] ?? 0,
    );}

    VideoPost toVideoPostEntity(){
      return VideoPost(
        caption: name,
        videoUlr: videoUrl,
        likes: likes,
        views: views,
      );
    }
}