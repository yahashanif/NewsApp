part of 'google_sign_in_cubit.dart';

@immutable
sealed class GoogleSignInState {}

final class GoogleSignInInitial extends GoogleSignInState {}

final class GoogleSignInLoading extends GoogleSignInState {}

final class GoogleSignInSuccess extends GoogleSignInState {
  final UserCredential userCredential;

  GoogleSignInSuccess({required this.userCredential});
}

final class GoogleSignInError extends GoogleSignInState {
  final String error;

  GoogleSignInError({required this.error});
}
