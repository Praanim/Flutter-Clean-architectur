import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter_clean_arch/features/daily_news/data/models/article.dart';

import '../../../../../core/constants/constants.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle(
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  );
}

// class NewsApiService {
//   final Dio dio;
//   NewsApiService({
//     required this.dio,
//   });

//   Future<HttpResponse<List<ArticleModel>>> getNewsArticle(
//       String apiKey, String countryQuery, String categoryQuery) async {
//     final response = dio.get(newsApiBaseUrl, queryParameters: {
//       'country': countryQuery,
//       'category': categoryQuery,
//       'apiKey': apiKey
//     });

    


//   }
// }
