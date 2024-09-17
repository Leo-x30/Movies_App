class MovieCategoriesResponse {
  MovieCategoriesResponse({
      this.genres,});

  MovieCategoriesResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
  List<Genres>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Genres {
  Genres({
      this.id, 
      this.name,
      this.status_code,
      this.status_message,
      this.success});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    success = json['success'];
    status_code = json['status_code'];
    status_message = json['status_message'];
  }
  int? id;
  String? name;
  bool? success;
  num? status_code;
  String? status_message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}