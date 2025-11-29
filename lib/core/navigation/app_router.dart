import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import 'route_paths.dart';
import '../../features/register/presentation/pages/register_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
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
      GoRoute(
      path: RoutePaths.LOGIN,
      builder: (context, state) => const LoginPage(),
    ),    GoRoute(
      path: RoutePaths.REGISTER,
      builder: (context, state) => const RegisterPage(),
    ),],
);
