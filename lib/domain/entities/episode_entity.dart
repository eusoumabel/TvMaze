import 'package:tv_maze/core/constants/string_constants.dart';
import 'package:tv_maze/service/model/episode_model.dart';
import 'package:tv_maze/service/model/tv_show_model.dart';

class EpisodeEntity extends EpisodeModel {
  EpisodeEntity({
    super.id,
    super.url,
    super.name,
    super.season,
    super.number,
    super.type,
    super.airdate,
    super.airtime,
    super.airstamp,
    super.runtime,
    super.rating,
    super.image,
    super.summary,
    super.links,
  });

  EpisodeEntity copyWith({
    int? id,
    String? url,
    String? name,
    int? season,
    int? number,
    String? type,
    String? airdate,
    String? airtime,
    String? airstamp,
    int? runtime,
    RatingModel? rating,
    ImageModel? image,
    String? summary,
    LinksModel? links,
  }) {
    return EpisodeEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      season: season ?? this.season,
      number: number ?? this.number,
      type: type ?? this.type,
      airdate: airdate ?? this.airdate,
      airtime: airtime ?? this.airtime,
      airstamp: airstamp ?? this.airstamp,
      runtime: runtime ?? this.runtime,
      rating: rating ?? this.rating,
      image: image ?? this.image,
      summary: summary ?? this.summary,
      links: links ?? this.links,
    );
  }

  factory EpisodeEntity.fromModel(EpisodeModel model) {
    return EpisodeEntity(
      id: model.id ?? 0,
      url: model.url ?? StringConstants.empty,
      name: model.name ?? StringConstants.empty,
      season: model.season ?? 0,
      number: model.number ?? 0,
      type: model.type ?? StringConstants.empty,
      airdate: model.airdate ?? StringConstants.empty,
      airtime: model.airtime ?? StringConstants.empty,
      airstamp: model.airstamp ?? StringConstants.empty,
      runtime: model.runtime ?? 0,
      rating: model.rating ?? RatingModel(),
      image: model.image ?? ImageModel(),
      summary: model.summary ?? StringConstants.empty,
      links: model.links ?? LinksModel(),
    );
  }
}
