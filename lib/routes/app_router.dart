import 'package:flutter/material.dart';
import 'package:filmku/features/home/presentation/screens/home_page.dart';
import 'package:filmku/features/movie_detail/presentation/screen/movie_detail_screen.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  home,
  movieDetail,
  bookmarks,
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: Routes.home.name,
        builder: (context, state) => HomePage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
          path: '/movieDetail',
          name: Routes.movieDetail.name,
          builder: (context, state) => MovieDetailScreen(
              key: state.pageKey, movieId: state.extra as int)),
    ],
  );

  static GoRouter get router => _router;
}
