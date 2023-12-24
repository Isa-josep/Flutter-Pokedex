import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_plus/presentation/providers/discover_provider.dart';
import 'package:tiktok_plus/presentation/widgets/shared/video_scrollable_view.dart';
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  discoverProvider = context.watch<DiscoverProvider>();

    return  Scaffold(
      body: discoverProvider.flag
          ? const Center( child: CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.white,))
          : VideoScrollable(videos: discoverProvider.videos),

    );
  }
} 