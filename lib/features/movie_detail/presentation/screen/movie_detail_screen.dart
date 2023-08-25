import 'package:filmku/features/movie_detail/presentation/bloc/casts/casts_bloc.dart';
import 'package:filmku/features/movie_detail/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:filmku/features/movie_detail/presentation/screen/movie_detail_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => MovieDetailBloc()),
          BlocProvider(create: (BuildContext context) => CastsBloc())
        ],
        child:  MovieDetailScreenView(movieId: movieId));
  }
}
