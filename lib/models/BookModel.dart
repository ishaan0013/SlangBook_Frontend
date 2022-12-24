class BookModel {
  BookModel({
      this.id, 
      this.genresId, 
      this.name, 
      this.author, 
      this.shortDesc, 
      this.bookUrl, 
      this.bookPreviewUrl, 
      this.createdAt, 
      this.updatedAt,});

  BookModel.fromJson(dynamic json) {
    id = json['id'];
    genresId = json['genres_id'];
    name = json['name'];
    author = json['author'];
    shortDesc = json['short_desc'];
    bookUrl = json['book_url'];
    bookPreviewUrl = json['book_preview_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? genresId;
  String? name;
  String? author;
  String? shortDesc;
  String? bookUrl;
  String? bookPreviewUrl;
  String? createdAt;
  String? updatedAt;
BookModel copyWith({  int? id,
  int? genresId,
  String? name,
  String? author,
  String? shortDesc,
  String? bookUrl,
  String? bookPreviewUrl,
  String? createdAt,
  String? updatedAt,
}) => BookModel(  id: id ?? this.id,
  genresId: genresId ?? this.genresId,
  name: name ?? this.name,
  author: author ?? this.author,
  shortDesc: shortDesc ?? this.shortDesc,
  bookUrl: bookUrl ?? this.bookUrl,
  bookPreviewUrl: bookPreviewUrl ?? this.bookPreviewUrl,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['genres_id'] = genresId;
    map['name'] = name;
    map['author'] = author;
    map['short_desc'] = shortDesc;
    map['book_url'] = bookUrl;
    map['book_preview_url'] = bookPreviewUrl;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}