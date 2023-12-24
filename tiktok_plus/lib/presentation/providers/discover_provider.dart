import 'package:flutter/material.dart';
import 'package:tiktok_plus/domain/video_post.dart';
import 'package:tiktok_plus/infrastructure/models/local_video_model.dart';
import 'package:tiktok_plus/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {


  bool flag =true;
  List<VideoPost> videos=[

  ];

  Future<void> loadNextPage() async{

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos =videoPosts.map(
      (video)=>LocalVideoModel.fromJson(video).toVideoPostEntity()
      ).toList();
      videos.addAll(newVideos);
      flag =false;
    notifyListeners();
  }
}