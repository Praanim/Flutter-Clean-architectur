import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/constants/constants.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/cubit/article_cubit.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily news"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (_, state) {
        if (state is ArticlesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ArticlesError) {
          return Center(
            child: Text(state.error!.message!),
          );
        } else if (state is ArticlesFetched) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final article = state.articles![index];

              return ListTile(
                leading: Container(
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage(article.urlToImage ?? noImageUrl))),
                ),
                title: Text(
                  article.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  article.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
