import 'package:tv_maze/core/constants/string_constants.dart';
import 'package:tv_maze/service/model/tv_show_model.dart';

class TvShowEntity extends TvShowModel {
  TvShowEntity({
    super.id,
    super.name,
    super.url,
    super.genres,
    super.status,
    super.image,
    super.summary,
    super.rating,
    super.ended,
    super.network,
    super.premiered,
    super.schedule,
    super.officialSite,
  });

  TvShowEntity copyWith({
    num? id,
    String? name,
    String? url,
    List<String>? genres,
    String? status,
    ImageModel? image,
    String? summary,
    RatingModel? rating,
    String? ended,
    NetworkModel? network,
    String? premiered,
    ScheduleModel? schedule,
    String? officialSite,
  }) {
    return TvShowEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      genres: genres ?? this.genres,
      status: status ?? this.status,
      image: image ?? this.image,
      summary: summary ?? this.summary,
      rating: rating ?? this.rating,
      ended: ended ?? this.ended,
      network: network ?? this.network,
      premiered: premiered ?? this.premiered,
      schedule: schedule ?? this.schedule,
      officialSite: officialSite ?? this.officialSite,
    );
  }

  factory TvShowEntity.fromModel(TvShowModel model) {
    return TvShowEntity(
      id: model.id ?? 0,
      name: model.name ?? StringConstants.empty,
      url: model.url ?? StringConstants.empty,
      genres: model.genres ?? [],
      status: model.status ?? StringConstants.empty,
      image: model.image ?? ImageModel(),
      summary: model.summary ?? StringConstants.empty,
      rating: model.rating ?? RatingModel(),
      ended: model.ended ?? StringConstants.empty,
      network: model.network ?? NetworkModel(),
      premiered: model.premiered ?? StringConstants.empty,
      schedule: model.schedule ?? ScheduleModel(),
      officialSite: model.officialSite ?? StringConstants.empty,
    );
  }
}
