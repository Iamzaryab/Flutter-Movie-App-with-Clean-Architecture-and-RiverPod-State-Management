import 'package:flutter/material.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/shared/widgets/shimmers/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class PopularMoviesShimmer extends StatelessWidget {
  const PopularMoviesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const PopularCardShimmer();
            }));
  }
}

class PopularCardShimmer extends StatelessWidget {
  const PopularCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.popularPosterHeight,
      child: Padding(
        padding: EdgeInsets.only(top: AppDimens.p8, left: AppDimens.p18, right: AppDimens.p18),
        child: Row(
          children:[
            Skeleton(
                height: AppDimens.popularPosterHeight,
                width: AppDimens.popularPosterWidth,
                left: 0,
                right: 0,
                top: 0,
                bottom: 0),
            Container(
               padding: EdgeInsets.only(left: AppDimens.p12, top: AppDimens.p10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Skeleton(
                    height: 20,
                    width: AppDimens.nowShowingPosterWidth,
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom:0,
                  ),
                  Skeleton(
                    height: 15,
                    width: AppDimens.nowShowingPosterWidth,
                    left: 0,
                    right: 0,
                    top: 8,
                    bottom: 0,
                  ),
                  Skeleton(
                    height: 25,
                    width: AppDimens.nowShowingPosterWidth,
                    left: 0,
                    right: 0,
                    top: 8,
                    bottom: 0,
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
