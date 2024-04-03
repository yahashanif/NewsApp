import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/article_cubit.dart';
import 'package:news_app/widgets/base_appbar.dart';
import 'package:news_app/widgets/custom_textfield.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context
        .read<ArticleCubit>()
        .getArticle(codeCountry: 'id', typeNews: 'business');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
        title: "News",
        color: Colors.orange,
        backSHow: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextField(
              preffixIcon: Icon(Icons.search),
              hintText: "Search",
              onChanged: (p0) {
                setState(() {});
              },
              controller: searchController),
          BlocBuilder<ArticleCubit, ArticleState>(
            builder: (context, state) {
              if (state is ArticleLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...state.list
                        .where((element) => element.title
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()))
                        .map((e) => Container(
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Text(
                                  e.title,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  e.description ?? '--',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text("SOURCE : ${e.source.name}"),
                                )
                              ],
                            )))
                  ],
                );
              } else if (state is ArticleLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
