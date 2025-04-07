part of 'blog_bloc_bloc.dart';

@immutable
sealed class BlogBlocState {}

final class BlogBlocInitial extends BlogBlocState {}

final class BlogblocLoading extends BlogBlocState {}

final class BlogblocSucess extends BlogBlocState {}

final class Blogblocfailure extends BlogBlocState {}
