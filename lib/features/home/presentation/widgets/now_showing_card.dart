import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmku/features/movie_detail/presentation/screen/movie_detail_screen.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:filmku/shared/widgets/swipe_to_dismiss_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmku/app/app_configs.dart';
import 'package:filmku/app/app_dimens.dart';

import 'package:filmku/models/movie.dart';

import 'package:filmku/shared/widgets/rating_bar.dart';

class NowShowingMovieCard extends StatelessWidget {
  final Movie movie;

  const NowShowingMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        // transitionDuration: const Duration(seconds: 5),
        closedColor: context.theme.scaffoldBackgroundColor,
        openColor: context.theme.scaffoldBackgroundColor,
        closedBuilder: (BuildContext context, void Function() action) {
          return SizedBox(
            width: AppDimens.nowShowingCardWidth,
            child: Padding(
              padding: EdgeInsets.only(left: AppDimens.p6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.sp), // Adjust the radius as needed
                    ),
                    elevation: 8.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.sp),
                      child: CachedNetworkImage(
                        imageUrl: AppConfigs.preMoviePoster(movie.posterPath),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.broken_image),
                        width: AppDimens.nowShowingPosterWidth,
                        height: AppDimens.nowShowingPosterHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: AppDimens.p6, left: AppDimens.p8),
                    child: Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: AppDimens.p2, left: AppDimens.p8),
                    child: RatingBar(rating: movie.voteAverage),
                  )
                ],
              ),
            ),
          );
        },
        openBuilder: (BuildContext context,
            void Function({Object? returnValue}) action) {
          return SwipeToDismissWrap(child: MovieDetailScreen(movieId: movie.id));
        });
  }
}
