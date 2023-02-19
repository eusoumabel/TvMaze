import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/core/l10n/l10n.dart';

class TvShowRuntimeWidget extends StatelessWidget {
  final int? runtime;
  const TvShowRuntimeWidget({
    Key? key,
    this.runtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${runtime ?? 0} ${S.current.textMinPerEpisode}',
      style: context.body2!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
