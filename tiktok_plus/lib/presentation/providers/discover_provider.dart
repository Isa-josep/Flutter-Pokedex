import 'package:flutter/material.dart';
import 'package:tiktok_plus/domain/repositories/video_post_repositories.dart';
import 'package:tiktok_plus/domain/video_post.dart';


class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepository videoPostRepository;

  bool flag =true;
  List<VideoPost> videos=[

  ];

    DiscoverProvider({
    required this.videoPostRepository
    });

  Future<void> loadNextPage() async{

    //await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos =videoPosts.map(
    //   (video)=>LocalVideoModel.fromJson(video).toVideoPostEntity()
    //   ).toList();

    final newVideos =await videoPostRepository.getTrendingVideosByPage(1);
      videos.addAll(newVideos);
      flag =false;
    notifyListeners();
  }
}