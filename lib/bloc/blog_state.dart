part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState{}

final class BlogLoaded extends BlogState{
  final List<BlogModel> mydata;

  BlogLoaded({required this.mydata});
}

final class BlogError extends BlogState{
  final String error;

  BlogError({required this.error});
}