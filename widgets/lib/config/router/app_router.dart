import 'package:go_router/go_router.dart';
import 'package:widgets/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterScreen(),
    ),

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/Button',
      builder: (context, state) => const ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),

    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressScren(),
    ),

    GoRoute(
      path: '/snackbar',
      builder: (context, state) => const SnackbarScreen(),
    ),

    GoRoute(
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(),
    ),

    GoRoute(
      path: '/iu-controls',
      builder: (context, state) => const UiControlsScreen(),
    ),

    GoRoute(
      path: '/tutorial',
      builder: (context, state) => const AppTutorialScreen(),
    ),

    GoRoute(
      path: '/infinite',
      builder: (context, state) => const InfiniteScrollScreen(),
    ),

    

  ],
);