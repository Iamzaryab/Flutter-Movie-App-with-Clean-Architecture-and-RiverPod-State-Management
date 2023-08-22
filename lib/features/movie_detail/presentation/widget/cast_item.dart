import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmku/app/app_configs.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/models/cast.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';

class CastItem extends StatelessWidget {
  final Cast cast;

  const CastItem({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.castProfileWidth,
      child: Padding(
        padding: EdgeInsets.only(left: AppDimens.p8) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.sp),
              child: CachedNetworkImage(
                imageUrl: AppConfigs.preCastProfilePath(cast.profilePath),
                placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
                errorWidget: (context, url,error) =>  const Icon(Icons.broken_image),
                height: AppDimens.castProfileHeight,
                width: AppDimens.castProfileWidth,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 4.sp,
            ),
            Text(
                cast.originalName,
                style: context.textTheme.bodyMedium,
                maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
