import 'package:carty_e_coomerce_app/data/network/dio_helper.dart';

import '../../constants/constant.dart';

import '../models/home_model.dart';

class HomeRepository {
  DioHelper dio;

  HomeRepository({required this.dio});

  Future<HomeModel> fetchHomeData() async {
    return await dio.getData(url: 'home', token: token).then(
          (value) {
        return
          HomeModel.fromJson(value.data);
      },
    );
  }
}
