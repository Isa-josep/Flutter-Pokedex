class VideoPost{
  final String caption; //description
  final String videoUlr; //url 
  final int likes; //likes
  final int views; //views
  VideoPost({
    required this.caption, 
    required this.videoUlr, 
    this.likes=0, 
    this.views=0,
    });
}