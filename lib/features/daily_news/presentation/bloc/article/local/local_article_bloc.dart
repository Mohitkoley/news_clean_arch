import 'package:clean_arch/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/get_saved_article.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/remove_article.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/save_article.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticleLoading()) {
    on<GetSavedArticle>(onGetSavedArticles);
    on<SaveArticle>(onSaveArticles);
    on<RemoveArticle>(onRemoveArticles);
  }

  void onGetSavedArticles(
      GetSavedArticle event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase(null);
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticles(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(removeArticle.articleEntity);
    final articles = await _getSavedArticleUseCase(null);
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticles(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(saveArticle.articleEntity);
    final articles = await _getSavedArticleUseCase(null);
    emit(LocalArticlesDone(articles));
  }
}
