part of 'article_cubit.dart';

abstract class ArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;
  const ArticleState({
    this.articles,
    this.error,
  });

  @override
  List<Object> get props => [articles!, error!];
}

class ArticlesLoading extends ArticleState {
  const ArticlesLoading();
}

class ArticlesFetched extends ArticleState {
  const ArticlesFetched(List<ArticleEntity> articles)
      : super(articles: articles);
}

class ArticlesError extends ArticleState {
  const ArticlesError(DioException error) : super(error: error);
}
