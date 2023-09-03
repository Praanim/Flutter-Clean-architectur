import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/resources/data_state.dart';
import 'package:flutter_clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_arch/features/daily_news/data/models/article.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/constants/constants.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(
    this._newsApiService,
  );

  @override
  Future<DatatState<List<ArticleModel>>> getNewArticles() async {
    final httpResponse = await _newsApiService.getNewsArticle(
        apiKey, countryQuery, categoryQuery);

    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
