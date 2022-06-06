import 'dart:convert';

List<Getlist> getlistFromJson(String str) =>
    List<Getlist>.from(json.decode(str).map((x) => Getlist.fromJson(x)));

String getlistToJson(List<Getlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getlist {
  Getlist({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory Getlist.fromJson(Map<String, dynamic> json) => Getlist(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
      };
}
