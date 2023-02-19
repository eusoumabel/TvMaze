class TvShowModel {
  num? id;
  String? name;
  ScheduleModel? schedule;
  List<String>? genres;
  String? summary;
  String? url;
  String? status;
  String? premiered;
  String? ended;
  String? officialSite;
  RatingModel? rating;
  NetworkModel? network;
  ImageModel? image;
  int? averageRuntime;

  TvShowModel({
    this.id,
    this.url,
    this.name,
    this.genres,
    this.status,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.network,
    this.image,
    this.summary,
    this.averageRuntime,
  });

  factory TvShowModel.fromJson(dynamic json) {
    return TvShowModel(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      genres: json['genres'].cast<String>(),
      status: json['status'],
      premiered: json['premiered'],
      ended: json['ended'],
      officialSite: json['officialSite'],
      averageRuntime: json['averageRuntime'],
      schedule: json['schedule'] != null
          ? ScheduleModel.fromJson(json['schedule'])
          : null,
      rating:
          json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
      network: json['network'] != null
          ? NetworkModel.fromJson(json['network'])
          : null,
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
      summary: json['summary'],
    );
  }
}

class ScheduleModel {
  String? time;
  List<String>? days;

  ScheduleModel({this.time, this.days});

  factory ScheduleModel.fromJson(dynamic json) {
    return ScheduleModel(
      time: json['time'],
      days: json['days'].cast<String>(),
    );
  }
}

class RatingModel {
  num? average;

  RatingModel({this.average});

  factory RatingModel.fromJson(dynamic json) {
    return RatingModel(
      average: json['average'],
    );
  }
}

class NetworkModel {
  num? id;
  String? name;
  CountryModel? country;
  String? officialSite;

  NetworkModel({this.id, this.name, this.country, this.officialSite});

  factory NetworkModel.fromJson(dynamic json) {
    return NetworkModel(
      id: json['id'],
      name: json['name'],
      country: json['country'] != null
          ? CountryModel.fromJson(json['country'])
          : null,
      officialSite: json['officialSite'],
    );
  }
}

class CountryModel {
  String? name;
  String? code;
  String? timezone;

  CountryModel({this.name, this.code, this.timezone});

  factory CountryModel.fromJson(dynamic json) {
    return CountryModel(
      name: json['name'],
      code: json['code'],
      timezone: json['timezone'],
    );
  }
}

class ImageModel {
  String? medium;
  String? original;

  ImageModel({this.medium, this.original});

  factory ImageModel.fromJson(dynamic json) {
    return ImageModel(
      medium: json['medium'],
      original: json['original'],
    );
  }
}
