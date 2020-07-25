import 'dart:async';

import 'package:afaq/models/article_model.dart';
import 'package:afaq/repository/articles_repo.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesRepo articlesRepository;
  StreamSubscription articlesSubscription;
  ArticlesBloc(this.articlesRepository) : super(ArticleLoadInProgress());

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    if (event is ArticlesLoadSuccessE) {
      yield* _mapLoadArticlessToState();
      // } else if (event is ArticleAdded) {
      // yield* _mapAddArticlesToState(event);
      // } else if (event is UpdateArticles) {
      //   yield* _mapUpdateArticlesToState(event);
      // } else if (event is DeleteArticles) {
      //   yield* _mapDeleteArticlesToState(event);
      // } else if (event is ToggleAll) {
      //   yield* _mapToggleAllToState();
      // } else if (event is ClearCompleted) {
      //   yield* _mapClearCompletedToState();
    } else if (event is ArticleUpdated) {
      yield* _mapArticlessUpdateToState(event);
    }
  }

  Stream<ArticlesState> _mapLoadArticlessToState() async* {
    List<ArticleModel> articles;
    try {
      articlesSubscription?.cancel();
      articlesSubscription = articlesRepository.articles().listen((articles) {
        add(ArticleUpdated(articles));
      });
    } catch (_) {
      yield ArticleLoadFailure();
    }
  }

  // Stream<ArticlesState> _mapAddArticlesToState(AddArticles event) async* {
  //   articlesRepository.addNewArticles(event.todo);
  // }

  // Stream<ArticlesState> _mapUpdateArticlesToState(UpdateArticles event) async* {
  //   articlesRepository.updateArticles(event.updatedArticles);
  // }

  // Stream<ArticlesState> _mapDeleteArticlesToState(DeleteArticles event) async* {
  //   articlesRepository.deleteArticles(event.todo);
  // }

  // Stream<ArticlesState> _mapToggleAllToState() async* {
  //   final currentState = state;
  //   if (currentState is ArticlessLoaded) {
  //     final allComplete = currentState.articles.every((todo) => todo.complete);
  //     final List<Articles> updatedArticless = currentState.articles
  //         .map((todo) => todo.copyWith(complete: !allComplete))
  //         .toList();
  //     updatedArticless.forEach((updatedArticles) {
  //       articlesRepository.updateArticles(updatedArticles);
  //     });
  //   }
  // }

  // Stream<ArticlesState> _mapClearCompletedToState() async* {
  //   final currentState = state;
  //   if (currentState is ArticlessLoaded) {
  //     final List<Articles> completedArticless =
  //         currentState.articles.where((todo) => todo.complete).toList();
  //     completedArticless.forEach((completedArticles) {
  //       articlesRepository.deleteArticles(completedArticles);
  //     });
  //   }
  // }

  Stream<ArticlesState> _mapArticlessUpdateToState(
      ArticleUpdated event) async* {
    yield ArticleLoadSuccesS(articles: event.article);
  }

  @override
  Future<void> close() {
    articlesSubscription?.cancel();
    return super.close();
  }
}
