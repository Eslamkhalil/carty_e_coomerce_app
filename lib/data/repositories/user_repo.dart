

import '../../constants/end_point.dart';
import '../models/user_model.dart';
import '../network/dio_helper.dart';

class UserRepository {
  late DioHelper dio;


  UserRepository({required this.dio});

  Future<UserModel> login({required Map<String, dynamic> data}) async {
    return  await dio.postData(
        url: LOGIN,
        data: data,

        query: {}).then((value) => UserModel.fromJson(value.data));
  }
  Future<UserModel> singUp( {required Map<String, dynamic> data}) {
    return dio.postData(
        url: REGISTER,
        data: data,
        token: '',
        ).then((value) => UserModel.fromJson(value.data));
  }

}
