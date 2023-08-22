import 'package:flutter/material.dart';
import 'package:filmku/features/home/presentation/screens/home_page.dart';
import 'package:filmku/features/movie_detail/presentation/screen/movie_detail_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum Routes {
  home,
  movieDetail,
  bookmarks,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
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
}
