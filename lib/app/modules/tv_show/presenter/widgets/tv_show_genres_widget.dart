import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/core/constants/string_constants.dart';
import 'package:tv_maze/core/l10n/l10n.dart';

class TvShowGenresWidget extends StatelessWidget {
  final List<String>? genres;
  const TvShowGenresWidget({
    Key? key,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.textGenres,
          style: context.h6!.copyWith(fontWeight: FontWeight.bold),
        ),
        context.vSmallSpacing,
        Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: List.generate(
            genres?.length ?? 0,
            (index) => Chip(
              label: Text(
                genres?[index] ?? StringConstants.empty,
                style: context.body1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
