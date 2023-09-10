import 'package:clean_arch/core/constants/api_endpoints.dart';
import 'package:clean_arch/core/constants/constants.dart';
import 'package:clean_arch/features/daily_news/data/models/article_model.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: APIEndpoints.newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<List<ArticleModel>> getNewsArticles(
      {@Query("apiKey") String apiKey,
      @Query("country") String? country,
      @Query("category") String? category});
}
