import 'package:clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? articleEntity;

  const LocalArticleEvent({this.articleEntity});

  @override
  List<Object?> get props => [articleEntity];
}

class GetSavedArticle extends LocalArticleEvent {
  const GetSavedArticle();
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle({required ArticleEntity articleEntity})
      : super(articleEntity: articleEntity);
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle({required ArticleEntity articleEntity})
      : super(articleEntity: articleEntity);
}
