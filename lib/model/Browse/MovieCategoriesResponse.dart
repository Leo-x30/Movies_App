class MovieCategoriesResponse {
  MovieCategoriesResponse({
    this.status_code,
      this.status_message,
      this.success,
      this.genres,});

  MovieCategoriesResponse.fromJson(dynamic json) {
    success = json['success'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
  List<Genres>? genres;
    bool? success;
  num? status_code;
  String? status_message;

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
      });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    
  }
  int? id;
  String? name;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}