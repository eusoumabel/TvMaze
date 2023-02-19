import 'package:tv_maze/service/model/tv_show_model.dart';

class EpisodeModel {
  int? id;
  String? url;
  String? name;
  int? season;
  int? number;
  String? type;
  String? airdate;
  String? airtime;
  String? airstamp;
  int? runtime;
  RatingModel? rating;
  ImageModel? image;
  String? summary;
  LinksModel? links;

  EpisodeModel({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.rating,
    this.image,
    this.summary,
    this.links,
  });

  factory EpisodeModel.fromJson(dynamic json) {
    return EpisodeModel(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      season: json['season'],
      number: json['number'],
      type: json['type'],
      airdate: json['airdate'],
      airtime: json['airtime'],
      airstamp: json['airstamp'],
      runtime: json['runtime'],
      rating:
          json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
      summary: json['summary'],
      links:
          json['_links'] != null ? LinksModel.fromJson(json['_links']) : null,
    );
  }
}

class LinksModel {
  SelfModel? self;
  SelfModel? show;

  LinksModel({this.self, this.show});

  factory LinksModel.fromJson(dynamic json) {
    return LinksModel(
      self: json['self'] != null ? SelfModel.fromJson(json['self']) : null,
      show: json['show'] != null ? SelfModel.fromJson(json['show']) : null,
    );
  }
}

class SelfModel {
  String? href;

  SelfModel({this.href});

  factory SelfModel.fromJson(dynamic json) {
    return SelfModel(
      href: json['href'],
    );
  }
}
