import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/core/constants/string_constants.dart';

class TvShowRatingWidget extends StatelessWidget {
  final num? rating;
  const TvShowRatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        Icons.star,
        color: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.xxxxs),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: context.xxxxxs,
        ),
      ),
      label: Text(
        rating?.toStringAsFixed(1) ?? StringConstants.hyphen,
        style: context.body2!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
