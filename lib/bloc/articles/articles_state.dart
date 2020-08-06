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
  List other = List();

  articlesofmonth() {
    return articles.firstWhere((article) => article.id == "1",
        orElse: () => null);
  }

  List myother() {
    other = articles;
    // other.removeWhere((article) => article.id == "1");
    return other;
  }

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

class ArticleAddSuccess extends ArticlesState {
  ArticleModel articleModel;

  ArticleAddSuccess({this.articleModel});

  @override
  // TODO: implement props
  List<Object> get props => [articleModel];
}

class ArticleAddErr extends ArticlesState {}

class ArticleAddLoading extends ArticlesState {}
