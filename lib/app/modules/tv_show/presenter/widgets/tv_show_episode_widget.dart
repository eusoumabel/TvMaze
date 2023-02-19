import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/core/constants/string_constants.dart';
import 'package:tv_maze/core/util/string_util.dart';
import 'package:tv_maze/domain/entities/episode_entity.dart';

typedef EpisodeCallback = void Function(EpisodeEntity episode);

class TvShowEpisodeWidget extends StatelessWidget {
  final EpisodeEntity? episode;
  final EpisodeCallback? onTap;
  const TvShowEpisodeWidget({
    Key? key,
    required this.episode,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap != null ? () => onTap!(episode!) : null,
      title: Text(
        episode?.name ?? StringConstants.empty,
        style: context.body2,
      ),
      subtitle: Text(
        StringUtil.formatDateTime(episode?.airdate),
        style: context.body2,
      ),
    );
  }
}
