import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/app/app_strings.dart';
import 'package:filmku/features/home/presentation/providers/home_state_notifier_provider.dart';
import 'package:filmku/features/home/presentation/widgets/now_showing_movies.dart';
import 'package:filmku/features/home/presentation/widgets/popular_movies.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:filmku/shared/network/network_values.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future((){
      ref.read(nowShowingMoviesStateNotifier.notifier).getMovies(type: EndPoints.nowShowing);
      ref.read(popularMoviesStateNotifier.notifier).getMovies(type: EndPoints.popular);
    });
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
      ref.read(nowShowingMoviesStateNotifier.notifier).getMovies(type: EndPoints.nowShowing);
    }
  }

  void popularScrollListener() {
    if (popularControl.position.maxScrollExtent == popularControl.offset) {
      ref.read(popularMoviesStateNotifier.notifier).getMovies(type: EndPoints.popular);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          controller: popularControl, slivers: [
        SliverToBoxAdapter(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.p18, right: AppDimens.p18, top: AppDimens.p8),
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
      ]),
    );
  }
}
