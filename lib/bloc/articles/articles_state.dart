// part of 'articles_bloc.dart';

// @immutable
import 'package:afaq/models/article_model.dart';

abstract class ArticlesState {}

class ArticleLoadInProgress extends ArticlesState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadSuccesS extends ArticlesState {
  List<ArticleModel> articles;

  ArticleLoadSuccesS({this.articles});

  @override
  List<Object> get props => [articles];

  @override
  String toString() => 'articleLoadSuccess { articles: $articles }';
}

class ArticleLoadFailure extends ArticlesState {
  String message;

  ArticleLoadFailure({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}