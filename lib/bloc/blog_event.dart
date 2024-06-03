part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent{}

class GetData extends BlogEvent{
  GetData();
}
