import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/core/l10n/l10n.dart';

class TvShowScheduleWidget extends StatelessWidget {
  final String scheduleText;
  const TvShowScheduleWidget({
    Key? key,
    required this.scheduleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.textSchedule,
          style: context.h6!.copyWith(fontWeight: FontWeight.bold),
        ),
        context.vSmallSpacing,
        Text(
          scheduleText,
          style: context.body1,
        )
      ],
    );
  }
}
