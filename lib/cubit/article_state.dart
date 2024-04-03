part of 'article_cubit.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

final class ArticleLoading extends ArticleState {}

final class ArticleLoaded extends ArticleState {
  final List<Article> list;

  ArticleLoaded({required this.list});
}

final class ArticleError extends ArticleState {
  final String error;

  ArticleError({required this.error});
}
