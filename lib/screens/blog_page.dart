// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_app/bloc/blog_bloc.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/widgets/blog_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BlogBloc>(context).add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Blog',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'ify',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogLoaded) {
            List<BlogModel> data = state.mydata;
            return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return BlogsTile(
                    imgUrl: data[index].imgUrl,
                    blogUrl: data[index].blogUrl,
                    title: data[index].title,
                    summary: data[index].summary,
                  );
                });
          } else if (state is BlogLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
