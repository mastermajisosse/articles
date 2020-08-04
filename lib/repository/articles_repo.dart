import 'dart:async';

import 'package:afaq/models/article_model.dart';
import 'package:afaq/repository/uploadImage_repo.dart';
import 'package:afaq/repository/user_auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Rep {
  Stream<List<ArticleModel>> article();
}

class ArticlesRepo {
  ArticlesRepo();

  final articlesCollection = Firestore.instance.collection('articles');

  Future<void> addNewArticles(ArticleModel articleModel, file) async {
    // need nicer way to make
    // articleModel.authorName = await UserRepository().getUserName();
    return UploadImage().tofireBase(articleModel, file);

    // articlesCollection.add(articleModel.toEntity().toJson());
  }

  Future<void> deleteArticles(ArticleModel articleModel) async {
    return articlesCollection.document(articleModel.id).delete();
  }

  Stream<List<ArticleModel>> articles() {
    return articlesCollection
        .orderBy(
          'date',
          descending: false,
        )
        .snapshots()
        .map((snapshot) {
      return snapshot.documents
          .map((doc) => ArticleModel.fromSnapshot(doc))
          .toList();
    });
  }

  Future<void> updateArticles(ArticleModel update) {
    return articlesCollection
        .document(update.id)
        .updateData(update.toEntity().toJson());
  }
}
