import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/cubit/article_cubit.dart';
import 'package:flutter_clean_arch/injection_container.dart';

import 'features/daily_news/presentation/pages/home/daily_news.dart';

void main() async {
  initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<ArticleCubit>(
          create: (context) => sl()..onGetArticles(), child: const DailyNews()),
    );
  }
}
