import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliderInfo {
  final String title;
  final String description;
  final String image;

  SliderInfo( this.title,  this.description,  this.image);
}

final slide =<SliderInfo>[
  SliderInfo(
    'Welcome to the App',
    'Et duis laborum nulla laboris id veniam nisi.',
    'assets/images/1.png',
  ),
  SliderInfo(
    'Welcome to the App2',
    'Est proident non aute reprehenderit cillum elit sit officia labore enim.',
    'assets/images/2.png',
  ),
  SliderInfo(
    'Welcome to the App3',
    'Proident pariatur aute velit deserunt aute pariatur.',
    'assets/images/3.png',
  ),

];


class AppTutorialScreen extends StatelessWidget {
  static const name='tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children:  slide.map(
              (slideData) => _Slide(
              title: slideData.title,
              description: slideData.description,
              image: slideData.image,
            )).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () => context.pop(),
            )
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String description;
  final String image;

  const _Slide({
    required this.title, 
    required this.description, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {
  final titleStyle = Theme.of(context).textTheme.titleLarge;
  final descripcion = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(image)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle
            ),
            const SizedBox(height: 20),
            Text(description, style: descripcion,)
          ],
        )
      ),
    );
  }
}