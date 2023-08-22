
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmku/app/app_constants.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/features/movie_detail/presentation/provider/movie_detail_state_notifier.dart';
import 'package:filmku/features/movie_detail/presentation/widget/casts_list.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:filmku/shared/widgets/genre_chip.dart';
import 'package:filmku/shared/widgets/rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MovieDetailBody extends StatelessWidget {
  final MovieDetail movieDetail;

  const MovieDetailBody({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.only(
          top: AppDimens.p22, left: AppDimens.p18, right: AppDimens.p22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  movieDetail.title,
                  maxLines: 2,
                  style: context.textTheme.titleLarge,
                ),
              ),
              SizedBox(
                width: AppDimens.p10,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final bookmarkNotifier =
                      ref.watch(movieDetailStateNotifier);
                  return InkWell(
                      onTap: () {
                        if (bookmarkNotifier.isBookmarked) {
                          ref
                              .read(movieDetailStateNotifier.notifier)
                              .removeBookmark(movieDetail);
                        } else {
                          ref
                              .read(movieDetailStateNotifier.notifier)
                              .bookmarkMovieDetail(movieDetail);
                        }
                      },
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: bookmarkNotifier.isBookmarked
                              ? SvgPicture.asset(
                                  'assets/images/icons/heart_filled.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.red, BlendMode.srcIn),
                                  height: 30.sp,
                                  width: 30.sp,
                                )
                              : SvgPicture.asset(
                                  'assets/images/icons/heart_outlined.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.red, BlendMode.srcIn),
                                  height: 30.sp,
                                  width: 30.sp,
                                )));
                },
              )
            ],
          ),
          SizedBox(
            height: AppDimens.p8,
          ),
          RatingBar(rating: movieDetail.voteAverage),
          SizedBox(height: AppDimens.p12),
          SizedBox(
            height: AppDimens.p30,
            child: ListView.builder(
                itemCount: movieDetail.genres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GenreChip(label: movieDetail.genres[index].name);
                }),
          ),
          SizedBox(
            height: AppDimens.p12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    AppConstants.LENGTH,
                    style: context.textTheme.bodySmall,
                  ),
                  Text(
                    '2h 28min',
                    style: context.textTheme.bodyMedium,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    AppConstants.LANGUAGE,
                    style: context.textTheme.bodySmall,
                  ),
                  Text(
                    'English',
                    style: context.textTheme.bodyMedium,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    AppConstants.RATING,
                    style: context.textTheme.bodySmall,
                  ),
                  Text(
                    'PG-13',
                    style: context.textTheme.bodyMedium,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.p20,
          ),
          Text(
            AppConstants.DESCRIPTION,
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: AppDimens.p8,
          ),
          Text(
            movieDetail.overview,
            style: context.textTheme.bodySmall!.copyWith(height: 2.sp),
          ),
          SizedBox(
            height: AppDimens.p20,
          ),
          Text(
            AppConstants.CASTS,
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: AppDimens.p14,
          ),
          SizedBox(height: 120.sp, child: CastsList(id: movieDetail.id))
        ],
      ),
    ));
  }
}
