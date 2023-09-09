import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/core/use_cases/use_case.dart';

import 'package:clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call(void params) async {
    return await _articleRepository.getNewsArticles();
  }
}
