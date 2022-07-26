import 'package:carty_e_coomerce_app/business/cubits/auth_cubit/auth_state.dart';
import 'package:carty_e_coomerce_app/data/local/cache_helper.dart';
import 'package:carty_e_coomerce_app/data/models/user_model.dart';
import 'package:carty_e_coomerce_app/data/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/widgets/custom_toast.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.userRepository}) : super(AuthInitial());

  final UserRepository userRepository;
  bool isPasswordShown = true;
  IconData suffix = Icons.visibility_off_outlined;
  UserModel? user;

  static AuthCubit get(context) => BlocProvider.of(context);

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    debugPrint('$isPasswordShown');
    suffix = isPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(PasswordShownChange());
  }

  void userLogin({required String email, required String password}) async {
    emit(UserLoginLoading());
    user = await userRepository.login(data: {
      'email': email,
      'password': password,
    }).then((value) {
      debugPrint("${value.message}");
      if (value.status == true) {
        CacheHelper.saveData(key: 'token', value: value.data!.token);
        emit(UserLoginSuccess(user: value));
        customToast(msg: value.message.toString(), state: ToastState.success);
      }else{
        emit(UserLoginError(error: value.message.toString()));
        customToast(msg: value.message.toString(), state: ToastState.error);
      }

    }).catchError((onError) {
      customToast(msg: onError.toString(),state:  ToastState.error);
      emit(UserLoginError(error: onError.toString()));
    });
  }

  void userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(UserRegisterLoading());
    user = await userRepository.singUp(data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'image':'',

    }).then((value) {
      debugPrint("${value.message}");
      if (value.status == true) {
        CacheHelper.saveData(key: 'token', value: value.data!.token);
        emit(UserRegisterSuccess(user: value));
        customToast(msg: value.message.toString(),state:  ToastState.error);
      }else{
        customToast(msg: value.message.toString(),state:  ToastState.warning);
        emit(UserRegisterError(error: value.message.toString()));
      }


    }).catchError((onError) {
      customToast(msg: onError.toString(),state:  ToastState.error);
      emit(UserRegisterError(error: onError.toString()));
    });
  }
}
