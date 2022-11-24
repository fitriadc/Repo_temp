import 'dart:convert';

List<MyWatchList> WatchListFromJson(String str) => List<MyWatchList>.from(
    json.decode(str).map((x) => MyWatchList.fromJson(x)));

String WatchListToJson(List<MyWatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
    required this.watched,
  });

  String title;
  double rating;
  DateTime releaseDate;
  String review;
  bool watched;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["release_date"]),
        review: json["review"],
        watched: json["watched"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "rating": rating,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "review": review,
        "watched": watched,
      };
}
