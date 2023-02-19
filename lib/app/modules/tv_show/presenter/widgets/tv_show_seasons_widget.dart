import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/design/widgets/safe_empty_state_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_episode_widget.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/domain/entities/episode_entity.dart';

class TvShowSeasonsWidget extends StatelessWidget {
  final List<EpisodeEntity>? episodes;
  final int? seasons;
  final EpisodeCallback? onTapEpisode;
  const TvShowSeasonsWidget({
    Key? key,
    required this.episodes,
    required this.seasons,
    this.onTapEpisode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (seasons == 0) {
      return Center(
        child: SafeEmptyResultWidget(text: S.current.textNoSeasons),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        context.vSuperSmallSpacing,
        ...List.generate(
          seasons ?? 0,
          (seasonIndex) => ExpansionTile(
            title: Text(
              S.current.textSeason(seasonIndex + 1),
              style: context.body1,
            ),
            tilePadding: EdgeInsets.zero,
            iconColor: Theme.of(context).primaryColor,
            children: List.generate(
              episodes?.length ?? 0,
              (episodeIndex) => TvShowEpisodeWidget(
                episode: episodes?[episodeIndex],
                onTap: onTapEpisode,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
