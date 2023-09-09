import 'package:clean_arch/core/constants/constants.dart';
import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_arch/features/daily_news/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImp implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImp(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final articles = await _newsApiService.getNewsArticles(
          category: AppConstants.categoryQuery,
          country: AppConstants.countryQuery);
      return DataSuccess(articles);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
