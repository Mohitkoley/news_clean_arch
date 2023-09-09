import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'remote_article_event.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoadingState()) {
    on<FetchRemoteArticle>(onGetArticles);
  }

  void onGetArticles(
      FetchRemoteArticle event, Emitter<RemoteArticleState> emit) async {
    emit(const RemoteArticleLoadingState());
    final dataState = await _getArticleUseCase.call(null);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticelFetchedState(articles: dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteArticleErrorState(dataState.exception!));
    }
  }
}
