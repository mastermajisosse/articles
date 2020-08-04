// part of 'articles_bloc.dart';
// import 'bloc.dart';

// @immutable/
import 'dart:io';

import 'package:afaq/models/article_model.dart';

abstract class ArticlesEvent {}

class ArticlesLoadSuccessE extends ArticlesEvent {}

class ArticleAdded extends ArticlesEvent {
  final ArticleModel article;
  final File file;

  ArticleAdded(this.article, this.file);

  @override
  List<Object> get props => [article];

  @override
  String toString() => 'articleAdded { article: $article } , ${file.path}';
}

class ArticleUpdated extends ArticlesEvent {
  final List<ArticleModel> article;

  ArticleUpdated(this.article);

  @override
  List<Object> get props => [article];

  @override
  String toString() => 'ArticleUpdated { article: $article }';
}

// class ArticleDeleted extends ArticlesEvent {
//   final List<ArticleModel> article;

//   ArticleDeleted(this.article);

//   @override
//   List<Object> get props => [article];

//   @override
//   String toString() => 'ArticleDeleted { article: $article }';
// }

// class ClearCompleted extends ArticlesEvent {}

// class ToggleAll extends ArticlesEvent {}
