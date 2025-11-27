import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import 'route_paths.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';

final appRouter = GoRouter(
  initialLocation: RoutePaths.ONBOARDING,
  routes: [
    GoRoute(
      path: RoutePaths.HOME,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: RoutePaths.ONBOARDING,
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
