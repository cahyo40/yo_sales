import 'package:go_router/go_router.dart';

import '../../features/bottom_nav/presentation/pages/bottom_nav_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/register/presentation/pages/register_page.dart';
import 'route_paths.dart';
import '../../features/outlet/presentation/pages/outlet_page.dart';
import '../../features/report/presentation/pages/report_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/history/presentation/pages/history_page.dart';
import '../../features/product/presentation/pages/product_page.dart';
import '../../features/cashier/presentation/pages/cashier_page.dart';

final appRouter = GoRouter(
  initialLocation: RoutePaths.BOTTOM_NAV,
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
    ),
    GoRoute(
      path: RoutePaths.REGISTER,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: RoutePaths.BOTTOM_NAV,
      builder: (context, state) => const BottomNavPage(),
    ),
      GoRoute(
      path: RoutePaths.CASHIER,
      builder: (context, state) => const CashierPage(),
    ),    GoRoute(
      path: RoutePaths.PRODUCT,
      builder: (context, state) => const ProductPage(),
    ),    GoRoute(
      path: RoutePaths.HISTORY,
      builder: (context, state) => const HistoryPage(),
    ),    GoRoute(
      path: RoutePaths.PROFILE,
      builder: (context, state) => const ProfilePage(),
    ),    GoRoute(
      path: RoutePaths.REPORT,
      builder: (context, state) => const ReportPage(),
    ),    GoRoute(
      path: RoutePaths.OUTLET,
      builder: (context, state) => const OutletPage(),
    ),],
);
