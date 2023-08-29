import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmku/features/home/presentation/bloc/genre/genre_bloc.dart';
import 'package:filmku/features/home/presentation/bloc/genre/genre_event.dart';
import 'package:filmku/features/home/presentation/bloc/genre/genre_state.dart';
import 'package:filmku/features/movie_detail/presentation/screen/movie_detail_screen.dart';
import 'package:filmku/shared/widgets/genre_chip.dart';
import 'package:filmku/shared/widgets/swipe_to_dismiss_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmku/app/app_configs.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/models/movie.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';

import 'package:filmku/shared/widgets/rating_bar.dart';

class PopularMovie extends StatelessWidget {
  final Movie movie;

  const PopularMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<GenreBloc>().add(const GetGenreLocalEvent());
    return OpenContainer(
        // transitionDuration: const Duration(seconds: 5),
        closedColor: context.theme.scaffoldBackgroundColor,
        closedBuilder: (context, void Function() action) {
          return Container(
            padding: EdgeInsets.only(
                top: AppDimens.p8, left: AppDimens.p18, right: AppDimens.p18),
            child: Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.p8),
                  ),
                  elevation: 8.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimens.p8),
                    child: CachedNetworkImage(
                      imageUrl: AppConfigs.preMoviePoster(movie.posterPath),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image),
                      width: AppDimens.popularPosterWidth,
                      height: AppDimens.popularPosterHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: AppDimens.p12, top: AppDimens.p10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              movie.title,
                              style: context.textTheme.titleSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.p8,
                        ),
                        RatingBar(rating: movie.voteAverage),
                        SizedBox(
                          height: AppDimens.p8,
                        ),
                        // BlocBuilder<GenreBloc, GenreState>(
                        //     builder: (context, state) {
                        //       return state.hasData
                        //           ? SingleChildScrollView(
                        //         scrollDirection: Axis.horizontal,
                        //         child: Row(
                        //           children: movie.genreIds.map((label) {
                        //             final genre = state.genres.firstWhere(
                        //                     (element) => element.id == label);
                        //             return GenreChip(label: genre.name);
                        //           }).toList(),
                        //         ),
                        //       )
                        //           : const Center(
                        //         child: CircularProgressIndicator(),);
                        //     })
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        openBuilder: (context, void Function({Object? returnValue}) action) {
          return SwipeToDismissWrap(child: MovieDetailScreen(movieId: movie.id));
        });
  }
}
