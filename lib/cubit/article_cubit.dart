import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/new_api_services.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  void getArticle(
      {required String codeCountry, required String typeNews}) async {
    try {
      emit(ArticleLoading());
      final result = await NewsAPIService()
          .getArticles(codeCountry: codeCountry, typeNews: typeNews);
      emit(ArticleLoaded(list: result));
    } catch (e) {
      emit(ArticleError(error: e.toString()));
    }
  }
}
