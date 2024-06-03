// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';

import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/repository/firebase_repository.dart';
import 'package:flutter/material.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;
  BlogBloc(
    {required this.blogRepository}
  ) : super(BlogInitial()) {
    on<GetData>((event, emit) async{
      emit(BlogLoading());
      await Future.delayed(const Duration(seconds: 1));
      try{
        final data =await blogRepository.get();
        emit(BlogLoaded(mydata: data));
      }catch(e){
        emit(BlogError(error: e.toString()));
      }
    });
  }
}
