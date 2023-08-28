import 'package:filmku/features/home/presentation/bloc/movie/movie_bloc.dart';
import 'package:filmku/shared/widgets/animated_scroll_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filmku/features/home/presentation/widgets/popular_card.dart';
import 'package:filmku/features/home/presentation/widgets/shimmer/popular_shimmer.dart';
import 'package:filmku/routes/app_router.dart';
import 'package:go_router/go_router.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularMovieBloc, MovieState>(
      builder: (context, state) {

        return state.hasData
            ? SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                if (index < state.movies.length) {
                  final movie = state.movies[index];
                  return AnimatedScrollViewItem(
                    child: GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.movieDetail.name,
                              extra: movie.id);
                        },
                        child: PopularMovie(movie: movie)),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }, childCount: state.movies.length + 1))
            : const SliverFillRemaining(
                hasScrollBody: true, child: PopularMoviesShimmer());
      },
    );
  }
}
