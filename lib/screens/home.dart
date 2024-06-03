import 'package:blog_app/bloc/blog_bloc.dart';
import 'package:blog_app/repository/firebase_repository.dart';
import 'package:blog_app/screens/blog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => BlogBloc(
        blogRepository: RepositoryProvider.of<BlogRepository>(context),
      ),
      child: Scaffold(
        key: scaffoldKey,
        body: BlocBuilder<BlogBloc, BlogState>(
          builder: (context, state) {
            if (state is BlogError) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const BlogPage();
          },
        ),
      ),
    );
  }
}