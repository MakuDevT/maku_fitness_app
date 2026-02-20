import 'package:go_router/go_router.dart';
import 'package:maku_fitness_app/config/app_config.dart';
import 'package:maku_fitness_app/views/common/loading_Screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    pageRoute(
      path: '/',
      name: 'loading',
      page: (ctx, state) => const LoadingScreen(),
    ),
  ],
);
