import 'package:go_router/go_router.dart';
import 'package:sebha/features/splash/ui/views/splash_view.dart';

class AppRouter {
  static const String splash = '/';
  static const String azkar = '/azkar';
  static const String sebha = '/sebha';
  static const String azkarDetails = '/azkarDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
