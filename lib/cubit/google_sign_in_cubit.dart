import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:news_app/services/google_Service.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit() : super(GoogleSignInInitial());

  void googleSignIn() async {
    try {
      emit(GoogleSignInLoading());
      final result = await GoogleServices().signInWithGoogle();
      emit(GoogleSignInSuccess(userCredential: result));
    } catch (e) {
      print(e);
      emit(GoogleSignInError(error: e.toString()));
    }
  }
}
