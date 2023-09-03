import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_arch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/cubit/article_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependicies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //Blocs
  sl.registerFactory<ArticleCubit>(() => ArticleCubit(sl()));
}
