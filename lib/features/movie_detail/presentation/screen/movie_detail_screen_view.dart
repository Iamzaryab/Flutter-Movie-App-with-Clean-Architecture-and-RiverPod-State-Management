import 'package:flutter/material.dart';
import 'package:filmku/features/movie_detail/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:filmku/features/movie_detail/presentation/widget/movie_detail_body.dart';
import 'package:filmku/features/movie_detail/presentation/widget/movie_detail_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreenView extends StatefulWidget {
  final int movieId;

  const MovieDetailScreenView({Key? key, required this.movieId})
      : super(key: key);

  @override
  State<MovieDetailScreenView> createState() => _MovieDetailScreenViewState();
}

class _MovieDetailScreenViewState extends State<MovieDetailScreenView> {
  @override
  void initState() {
    super.initState();
    context
        .read<MovieDetailBloc>()
        .add(GetMovieDetailEvent(movieId: widget.movieId));

    context
        .read<MovieDetailBloc>()
        .add(IsBookmarkedEvent(movieId: widget.movieId));
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return Scaffold(
            body: state.state == MovieDetailConcreteState.loading
                ? const Center(child: CircularProgressIndicator())
                : CustomScrollView(slivers: [
                    MovieDetailHeader(movieDetail: state.movieDetail),
                    MovieDetailBody(movieDetail: state.movieDetail)
                  ]));
      },
    );
  }
}
