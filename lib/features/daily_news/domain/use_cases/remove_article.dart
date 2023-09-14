import 'package:clean_arch/core/use_cases/use_case.dart';

import 'package:clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);
  @override
  Future<void> call(ArticleEntity? articleEntity) async {
    return _articleRepository.deleteArticle(articleEntity!);
  }
}
