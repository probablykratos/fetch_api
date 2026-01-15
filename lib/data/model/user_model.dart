// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String url;
  String name;
  String gender;
  String culture;
  String born;
  String died;
  List<String> titles;
  List<String> aliases;
  String father;
  String mother;
  String spouse;
  List<String> allegiances;
  List<String> books;
  List<String> povBooks;
  List<String> tvSeries;
  List<String> playedBy;

  UserModel({
    required this.url,
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.died,
    required this.titles,
    required this.aliases,
    required this.father,
    required this.mother,
    required this.spouse,
    required this.allegiances,
    required this.books,
    required this.povBooks,
    required this.tvSeries,
    required this.playedBy,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    url: json["url"],
    name: json["name"],
    gender: json["gender"],
    culture: json["culture"],
    born: json["born"],
    died: json["died"],
    titles: List<String>.from(json["titles"].map((x) => x)),
    aliases: List<String>.from(json["aliases"].map((x) => x)),
    father: json["father"],
    mother: json["mother"],
    spouse: json["spouse"],
    allegiances: List<String>.from(json["allegiances"].map((x) => x)),
    books: List<String>.from(json["books"].map((x) => x)),
    povBooks: List<String>.from(json["povBooks"].map((x) => x)),
    tvSeries: List<String>.from(json["tvSeries"].map((x) => x)),
    playedBy: List<String>.from(json["playedBy"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "name": name,
    "gender": gender,
    "culture": culture,
    "born": born,
    "died": died,
    "titles": List<dynamic>.from(titles.map((x) => x)),
    "aliases": List<dynamic>.from(aliases.map((x) => x)),
    "father": father,
    "mother": mother,
    "spouse": spouse,
    "allegiances": List<dynamic>.from(allegiances.map((x) => x)),
    "books": List<dynamic>.from(books.map((x) => x)),
    "povBooks": List<dynamic>.from(povBooks.map((x) => x)),
    "tvSeries": List<dynamic>.from(tvSeries.map((x) => x)),
    "playedBy": List<dynamic>.from(playedBy.map((x) => x)),
  };
}
