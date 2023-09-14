import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  Future<List<ArticleEntity>> getSavedArticle();

  Future<void> saveArticle(ArticleEntity articleEntity);

  Future<void> deleteArticle(ArticleEntity articleEntity);
}
