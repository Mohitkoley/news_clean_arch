import 'package:clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity> articles;
  final DioException? exception;

  const RemoteArticleState({this.articles = const [], this.exception});

  @override
  List<Object?> get props => [articles, exception!];
}

class RemoteArticleLoadingState extends RemoteArticleState {
  const RemoteArticleLoadingState({List<ArticleEntity> articles = const []})
      : super(articles: articles);
}

class RemoteArticelFetchedState extends RemoteArticleState {
  const RemoteArticelFetchedState({List<ArticleEntity> articles = const []})
      : super(articles: articles);
}

class RemoteArticleErrorState extends RemoteArticleState {
  const RemoteArticleErrorState(DioException exception,
      {List<ArticleEntity> articles = const []})
      : super(articles: articles, exception: exception);
}
