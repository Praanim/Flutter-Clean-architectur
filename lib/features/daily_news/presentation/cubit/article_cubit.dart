import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/resources/data_state.dart';

import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repository/article_repository.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleRepository articleRepository; //useCase halni
  ArticleCubit(
    this.articleRepository,
  ) : super(const ArticlesLoading());

  void onGetArticles() async {
    final dataState = await articleRepository.getNewArticles();

    if (dataState is DataSuccess) {
      emit(ArticlesFetched(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(ArticlesError(dataState.error!));
    }
  }
}
