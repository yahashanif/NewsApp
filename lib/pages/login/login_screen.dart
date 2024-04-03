import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:news_app/app/route.dart';
import 'package:news_app/app/themes.dart';
import 'package:news_app/cubit/google_sign_in_cubit.dart';
import 'package:news_app/widgets/backgorund.dart';
import 'package:news_app/widgets/curve_appbar.dart';
import 'package:news_app/widgets/custom_button.dart';
import 'package:news_app/widgets/custom_textfield.dart';

import '../../widgets/base_appbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
        title: "Lorem Ipsum",
        color: Colors.orange,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: 40,
          ),
          CustomTextField(
              hintText: "Nama", controller: TextEditingController()),
          CustomTextField(
              hintText: "Email", controller: TextEditingController()),
          CustomTextField(
              hintText: "Password", controller: TextEditingController()),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text("Remember Me ?")
                ],
              ),
              Text(
                "Lorem Ipsum ?",
                style: TextStyle(color: primaryMainColor),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            text: "Sign Up",
            onPressed: () {
              Navigator.pushNamed(context, mainRoute);
            },
            textColor: netralColor10,
          ),
          // Spacer(),
          SizedBox(
            height: 40,
          ),
          BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
            listener: (context, state) {
              print(state);
              if (state is GoogleSignInSuccess) {
                Navigator.pushNamed(context, mainRoute);
              }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  context.read<GoogleSignInCubit>().googleSignIn();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/google-logo.png",
                        height: 24,
                        width: 24,
                      ),
                      Text("Login With Google")
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
