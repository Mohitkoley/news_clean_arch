import 'package:clean_arch/features/daily_news/data/data_sources/local/DAO/app_database.dart';
import 'package:clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_arch/features/daily_news/data/repositories_impl/article_repository_impl.dart';
import 'package:clean_arch/features/daily_news/domain/repositories/article_repository.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/get_saved_article.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/remove_article.dart';
import 'package:clean_arch/features/daily_news/domain/use_cases/save_article.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('appdatabase.db').build();
  //register AppDatabase
  sl.registerSingleton<AppDatabase>(database);

  //register Dio
  sl.registerSingleton<Dio>(Dio());

  //register NewsApiService
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  //register ArticleRepository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImp(sl(), sl()));

  //register UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Database UseCases
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //factory Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  sl.registerFactory(() => LocalArticleBloc(sl(), sl(), sl()));
}
