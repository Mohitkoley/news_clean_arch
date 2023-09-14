import 'dart:developer';

import 'package:clean_arch/core/constants/app_constants.dart';
import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/enviroment/env.dart';
import 'package:clean_arch/features/daily_news/data/data_sources/local/DAO/app_database.dart';
import 'package:clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_arch/features/daily_news/data/models/article_model.dart';
import 'package:clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_arch/features/daily_news/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImp implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImp(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final articles = await _newsApiService.getNewsArticles(
          apiKey: Enviroment.apiKey,
          category: AppConstants.categoryQuery,
          country: AppConstants.countryQuery);
      return DataSuccess(articles);
    } on DioException catch (e) {
      log(e.toString());
      return DataFailed(e);
    }
  }

  @override
  Future<void> deleteArticle(ArticleEntity articleEntity) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(ArticleEntity));
  }

  @override
  Future<List<ArticleEntity>> getSavedArticle() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> saveArticle(ArticleEntity articleEntity) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(articleEntity));
  }
}
