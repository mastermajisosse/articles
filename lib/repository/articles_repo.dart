import 'dart:async';

import 'package:afaq/models/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Rep {
  Stream<List<ArticleModel>> article();
}

class ArticlesRepo {
  ArticlesRepo();

  final articlesCollection = Firestore.instance.collection('articles');

  Future<void> addNewTodo(ArticleModel articleModel) {
    return articlesCollection.add(articleModel.toEntity().toJson());
  }

  Future<void> deleteTodo(ArticleModel articleModel) async {
    return articlesCollection.document(articleModel.id).delete();
  }

  Stream<List<ArticleModel>> articles() {
    return articlesCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => ArticleModel.fromSnapshot(doc))
          .toList();
    });
  }

  Future<void> updateTodo(ArticleModel update) {
    return articlesCollection
        .document(update.id)
        .updateData(update.toEntity().toJson());
  }
}
