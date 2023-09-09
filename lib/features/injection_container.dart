import 'package:clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_arch/features/daily_news/data/repositories_impl/article_repository_impl.dart';
import 'package:clean_arch/features/daily_news/domain/repositories/article_repository.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //register Dio
  sl.registerSingleton<Dio>(Dio());

  //register NewsApiService
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  //register ArticleRepository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImp(sl()));

  //register UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //factory Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
