import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmku/features/bookmarks/presentation/bloc/bookmark_bloc.dart';
import 'package:filmku/shared/widgets/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:filmku/app/app_configs.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:filmku/shared/widgets/rating_bar.dart';

class BookmarkCard extends StatelessWidget {
  final MovieDetail movieDetail;

  const BookmarkCard({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: AppDimens.p8, right: AppDimens.p16, left: AppDimens.p16),
      child: Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.p8)),
            elevation: 8.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.p8),
              child: CachedNetworkImage(
                imageUrl: AppConfigs.preMoviePoster(movieDetail.posterPath),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                height: AppDimens.nowShowingPosterHeight,
                width: AppDimens.nowShowingPosterWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  top: AppDimens.p10, left: AppDimens.p8, right: AppDimens.p8),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: HeartButton(
                      isBookmarked: true,
                      onBtnPressed: () {
                        context
                            .read<BookmarkBloc>()
                            .add(RemoveBookmarkEvent(movieDetail: movieDetail));
                      },
                    ),
                  ),
                  Text(
                    movieDetail.title,
                    maxLines: 2,
                    style: context.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: AppDimens.p14,
                  ),
                  RatingBar(rating: movieDetail.voteAverage),
                  SizedBox(
                    height: AppDimens.p8,
                  ),
                  Text(
                    movieDetail.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// InkWell(
// onTap: () {
// context.read<BookmarkBloc>().add(RemoveBookmarkEvent(movieDetail: movieDetail));
// },
// child: SizedBox(
// width: 30,
// height: 30,
// child: SvgPicture.asset(
// 'assets/images/icons/heart_filled.svg',
// colorFilter: const ColorFilter.mode(
// Colors.red, BlendMode.srcIn),
// height: 30.sp,
// width: 30.sp,
// )
// ))
