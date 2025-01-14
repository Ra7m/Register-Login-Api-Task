sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSucessState extends AuthState {
  // ignore: prefer_typing_uninitialized_variables
  final Map<String, dynamic> userdata;
  AuthSucessState({required this.userdata});
}

class ChooseImage extends AuthState {}

