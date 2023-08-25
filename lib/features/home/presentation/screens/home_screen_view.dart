import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/app/app_strings.dart';
import 'package:filmku/features/home/presentation/bloc/movie/movie_bloc.dart';
import 'package:filmku/features/home/presentation/widgets/now_showing_movies.dart';
import 'package:filmku/features/home/presentation/widgets/popular_movies.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:filmku/shared/network/network_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {

  @override
  void initState() {
    super.initState();
    context.read<GetNowShowingMovieBloc>().add(const GetMoviesEvent(type: EndPoints.nowShowing));
    context.read<GetPopularMovieBloc>().add(const GetMoviesEvent(type: EndPoints.popular));
    nowShowingControl.addListener(nowShowingScrollListener);
    popularControl.addListener(popularScrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    nowShowingControl.removeListener(nowShowingScrollListener);
    popularControl.removeListener(popularScrollListener);
  }

  ScrollController nowShowingControl = ScrollController();
  ScrollController popularControl = ScrollController();

  void nowShowingScrollListener() {
    if (nowShowingControl.position.maxScrollExtent ==
        nowShowingControl.offset) {
      context
          .read<GetNowShowingMovieBloc>()
          .add(const GetMoviesEvent(type: EndPoints.nowShowing));
    }
  }

  void popularScrollListener() {
    if (popularControl.position.maxScrollExtent == popularControl.offset) {
      context.read<GetPopularMovieBloc>().add(const GetMoviesEvent(type: EndPoints.popular));
    }
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: popularControl, slivers: [
      SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: AppDimens.p18,
                    right: AppDimens.p18,
                    top: AppDimens.p8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.nowShowing,
                      style: context.textTheme.titleMedium,
                    ),
                    // const SeeMore()
                  ],
                ),
              ),
              NowShowingMovies(
                scrollController: nowShowingControl,
              ),
              Padding(
                padding:
                EdgeInsets.only(left: AppDimens.p18, right: AppDimens.p18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.popular,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    // const SeeMore()
                  ],
                ),
              ),
            ],
          )),
      const PopularMovies()
    ]);
  }
}
