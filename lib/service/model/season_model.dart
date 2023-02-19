class SeasonModel {
  int? id;
  String? url;
  int? number;
  String? name;
  int? episodeOrder;
  String? premiereDate;
  String? endDate;
  String? summary;

  SeasonModel({
    this.id,
    this.url,
    this.number,
    this.name,
    this.episodeOrder,
    this.premiereDate,
    this.endDate,
    this.summary,
  });

  factory SeasonModel.fromJson(dynamic json) {
    return SeasonModel(
      id: json['id'],
      url: json['url'],
      number: json['number'],
      name: json['name'],
      episodeOrder: json['episodeOrder'],
      premiereDate: json['premiereDate'],
      endDate: json['endDate'],
      summary: json['summary'],
    );
  }
}
