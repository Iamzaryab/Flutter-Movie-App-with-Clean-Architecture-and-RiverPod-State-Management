import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/app/app_configs.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/features/home/presentation/providers/home_state_notifier_provider.dart';
import 'package:filmku/models/movie.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:filmku/shared/widgets/genre_chip.dart';

import 'package:filmku/shared/widgets/rating_bar.dart';

import '../providers/state/genre_state.dart';


class PopularMovie extends ConsumerWidget {
  final Movie movie;

  const PopularMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genreState = ref.watch(genreStateNotifier);
    return Container(
      padding: EdgeInsets.only(top: AppDimens.p8, left: AppDimens.p18, right: AppDimens.p18),
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
              padding: EdgeInsets.only(left: AppDimens.p12, top: AppDimens.p10),
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
                  SizedBox(height: AppDimens.p8,),
                  RatingBar(rating: movie.voteAverage),
                  SizedBox(height: AppDimens.p8,),
                  if (genreState.state == GenreConcreteState.loaded) SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: movie.genreIds.map((label) {
                        final genre = genreState.genres
                            .firstWhere((element) => element.id == label);
                        return GenreChip(label: genre.name);
                      }).toList(),
                    ),
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
