import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  String id;
  String image;
  String title;
  String body;
  String authorName;
  String authorimg;
  DateTime date;
  String country;
  String tags;

  ArticleModel({
    this.id,
    this.image,
    this.title,
    this.body,
    this.authorName,
    this.authorimg,
    this.date,
    this.country,
    this.tags,
  });

  static ArticleModel fromData(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    return ArticleModel(
      id: map['id'],
      image: map['image'],
      title: map['title'],
      body: map['body'],
      authorName: map['authorName'],
      authorimg: map['authorimg'],
      date: map['date'],
      country: map['country'],
      tags: map['tags'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? "",
      'image': image ?? "",
      'title': title ?? "",
      'body': body ?? "",
      'authorName': authorName ?? "",
      'authorimg': authorimg ?? "",
      'date': date ?? DateTime.now(),
      'country': country ?? "",
      'tags': tags ?? "",
    };
  }

  ArticleModel toEntity() {
    return ArticleModel(
      id: id,
      image: image,
      title: title,
      body: body,
      authorName: authorName,
      authorimg: authorimg,
      date: date,
      country: country,
      tags: tags,
    );
  }

  static ArticleModel fromSnapshot(DocumentSnapshot snap) {
    return ArticleModel(
      id: snap.data['id'],
      image: snap.data['image'],
      title: snap.data['title'],
      body: snap.data['body'],
      authorName: snap.data['authorName'],
      authorimg: snap.data['authorimg'],
      date: snap.data['date'].toDate(),
      // date: snap.data['date'],
      country: snap.data['country'],
      tags: snap.data['tags'],
    );
  }

  @override
  String toString() {
    return 'Article { complete: $id, task: $title, note: $body, id: $date authorName:$authorName }';
  }
}
