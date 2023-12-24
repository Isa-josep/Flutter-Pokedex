import 'package:flutter/material.dart';
import 'package:tiktok_plus/domain/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool flag =true;
  List<VideoPost> videos=[

  ];

  Future<void> loadNextPage() async{

    notifyListeners();
  }
}