import 'package:tiktok_plus/domain/datasource/video_posts_datasource.dart';
import 'package:tiktok_plus/domain/video_post.dart';
import 'package:tiktok_plus/infrastructure/models/local_video_model.dart';
import 'package:tiktok_plus/shared/data/local_video_post.dart';

class LocalVideoDataSource implements VideoPostDatasource{

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
   
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos =videoPosts.map(
      (video)=>LocalVideoModel.fromJson(video).toVideoPostEntity()
      ).toList();
      return newVideos;
  }

}