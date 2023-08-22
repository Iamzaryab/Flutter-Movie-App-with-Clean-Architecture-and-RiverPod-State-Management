import 'package:flutter/material.dart';

import 'package:filmku/app/app_colors.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  const RatingBar({Key? key, required this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: AppColors.ratingIconColor),
        Text(
          '$rating/10 IMDb',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
