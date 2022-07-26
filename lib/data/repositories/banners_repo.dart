import 'package:carty_e_coomerce_app/constants/end_point.dart';
import 'package:carty_e_coomerce_app/data/network/dio_helper.dart';
import 'package:flutter/material.dart';

import '../models/banner_model.dart';

class BannerRepository {
  late DioHelper dio;

  BannerRepository({required this.dio});

  Future<BannerModel> fetchBanners() async {
    return await dio
        .getData(url: banners)
        .then((value) {
      debugPrint('Banners ${value.data}');
          return BannerModel.fromJson(value.data);
        },)
        .catchError((onError) {
      debugPrint(onError.toString());
    });
  }
}
