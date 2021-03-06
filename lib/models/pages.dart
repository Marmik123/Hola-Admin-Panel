// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Pages {
  Pages({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  String id;
  String slug;
  String title;
  String description;
  DateTime createdAt;
  String deletedAt;
  DateTime updatedAt;

  Pages copyWith({
    String id,
    String slug,
    String title,
    String description,
    DateTime createdAt,
    String deletedAt,
    DateTime updatedAt,
  }) =>
      Pages(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        title: title ?? this.title,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        deletedAt: deletedAt ?? this.deletedAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Pages.fromJson(String str) => Pages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pages.fromMap(Map<String, dynamic> json) => Pages(
        id: json["_id"] == null ? null : json["_id"],
        slug: json["slug"] == null ? null : json["slug"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        deletedAt: json["deleted_at"] == null ? null : json["deleted_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "slug": slug == null ? null : slug,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
