import 'dart:developer';

import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:clean_arch/features/daily_news/presentation/widgets/daily_news_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNewsScreen extends StatefulWidget {
  const DailyNewsScreen({super.key});

  @override
  State<DailyNewsScreen> createState() => _DailyNewsScreenState();
}

class _DailyNewsScreenState extends State<DailyNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return DailyNewsAppBarWidget();
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
      if (state is RemoteArticleLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is RemoteArticleErrorState) {
        print(state.exception!.message);
        log(state.exception!.message!);
        return Center(
            child: GestureDetector(
          onTap: () {},
          child: Icon(Icons.refresh_outlined),
        ));
      }
      if (state is RemoteArticelFetchedState) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.articles[index].title),
                subtitle: Text(state.articles[index].description),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: state.articles.length);
      }
      return const SizedBox();
    });
  }
}
