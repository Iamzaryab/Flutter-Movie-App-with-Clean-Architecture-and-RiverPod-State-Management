import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/features/home/presentation/providers/state/genre_notifier.dart';
import 'package:filmku/features/home/presentation/providers/state/genre_state.dart';
import 'package:filmku/features/home/presentation/providers/state/movie_notifier.dart';
import 'package:filmku/features/home/presentation/providers/state/movie_state.dart';

final nowShowingMoviesStateNotifier =
AutoDisposeStateNotifierProvider<MovieNotifier, MovieState>(
        (ref) => MovieNotifier());

final popularMoviesStateNotifier =
AutoDisposeStateNotifierProvider<MovieNotifier, MovieState>(
        (ref) => MovieNotifier());

final genreStateNotifier =
AutoDisposeStateNotifierProvider<GenreNotifier, GenreState>(
        (ref) => GenreNotifier());