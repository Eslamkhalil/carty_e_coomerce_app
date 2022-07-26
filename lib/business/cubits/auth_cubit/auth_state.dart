import '../../../data/models/user_model.dart';

class AuthState{}

class AuthInitial extends AuthState{}
class PasswordShownChange extends AuthState{}


class UserLoginLoading extends AuthState{}
class UserLoginSuccess extends AuthState{
  UserModel? user;

  UserLoginSuccess({required this.user});
}
class UserLoginError extends AuthState{
    dynamic error;
  UserLoginError({required this.error});
}

class UserRegisterLoading extends AuthState{}
class UserRegisterSuccess extends AuthState{
  UserModel? user;

  UserRegisterSuccess({required this.user});
}
class UserRegisterError extends AuthState{
  dynamic error;
  UserRegisterError({required this.error});
}
