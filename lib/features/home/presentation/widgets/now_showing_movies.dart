import 'package:filmku/features/home/presentation/bloc/movie/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/features/home/presentation/widgets/now_showing_card.dart';
import 'package:filmku/features/home/presentation/widgets/shimmer/now_showing_shimmer.dart';
import 'package:filmku/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NowShowingMovies extends StatelessWidget {
  final ScrollController scrollController;

  const NowShowingMovies({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GetNowShowingMovieBloc, MovieState>(
      builder: (context, state) {
        return SizedBox(
          height: AppDimens.nowShowingCardHeight,
          child: state.hasData
              ? ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index < state.movies.length) {
                      final movie = state.movies[index];
                      return GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.movieDetail.name,
                                extra: movie.id);
                          },
                          child: NowShowingMovieCard(movie: movie));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : const NowShowingMoviesShimmer(),
        );
      },
    );
  }
}
