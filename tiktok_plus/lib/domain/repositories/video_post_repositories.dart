import 'package:tiktok_plus/domain/video_post.dart';

abstract class VideoPostRepository{

    Future<List<VideoPost>> getTrendingVideosByPage(int page);
    Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
    
} 