import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/design/widgets/safe_summary_widget.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/util/string_util.dart';

class TvShowSummaryWidget extends StatelessWidget {
  final String? summary;
  const TvShowSummaryWidget({
    Key? key,
    required this.summary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.textSummary,
          style: context.h6!.copyWith(fontWeight: FontWeight.bold),
        ),
        context.vSmallSpacing,
        SafeSummaryWidget(
          summary: StringUtil.removeAllHtmlTags(summary),
        ),
      ],
    );
  }
}
