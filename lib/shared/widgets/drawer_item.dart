import 'package:filmku/app/app_colors.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String asset;
  final bool isSelected;
  final VoidCallback? onTap;

  const DrawerItem(
      {Key? key,
      required this.title,
      required this.asset,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.p10),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
            dense: true,
            leading: SvgPicture.asset(
              asset,
              height: 20,
              width: 20,
              color: context.theme.primaryColor,
            ),
            title: Text(
              title,
              style:
                  context.textTheme.bodyMedium!.copyWith(color: context.theme.primaryColor),
            ),
            trailing: isSelected
                ? const Icon(
                    Icons.check_circle,
                    color: AppColors.ratingIconColor,
                  )
                : null),
      ),
    );
  }
}
