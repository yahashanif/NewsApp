import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/route.dart';
import 'package:news_app/cubit/article_cubit.dart';
import 'package:news_app/cubit/google_sign_in_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GoogleSignInCubit(),
        ),
        BlocProvider(
          create: (context) => ArticleCubit(),
        )
      ],
      child: const MaterialApp(
        initialRoute: splash,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
