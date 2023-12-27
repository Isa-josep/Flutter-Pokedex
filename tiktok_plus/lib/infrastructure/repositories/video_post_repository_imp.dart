

import 'package:tiktok_plus/domain/datasource/video_posts_datasource.dart';
import 'package:tiktok_plus/domain/repositories/video_post_repositories.dart';
import 'package:tiktok_plus/domain/video_post.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
final VideoPostDatasource videoPostDatasource;

  VideoPostsRepositoryImpl({
    required this.videoPostDatasource
    });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }

}