import 'package:filmku/features/home/presentation/bloc/genre/genre_bloc.dart';
import 'package:filmku/features/home/presentation/bloc/movie/movie_bloc.dart';
import 'package:filmku/features/home/presentation/screens/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<GetNowShowingMovieBloc>(
              create: (BuildContext context) => GetNowShowingMovieBloc()),
          BlocProvider<GetPopularMovieBloc>(
              create: (BuildContext context) => GetPopularMovieBloc()),
          BlocProvider<GenreBloc>(create: ( context) => GenreBloc())
        ],
        child: const HomeScreenView(),
      ),
    );
  }
}
