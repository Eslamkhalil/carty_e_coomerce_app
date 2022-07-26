

import 'package:carty_e_coomerce_app/constants/end_point.dart';
import 'package:flutter/cupertino.dart';

import '../models/categories_model.dart';
import '../network/dio_helper.dart';

class CategoryRepository {
  late DioHelper dio;

  CategoryRepository({required this.dio});

  Future<CategoriesModel> fetchCategories() async {
    return await dio
        .getData(url: categories)
        .then((value) {
      debugPrint('Banners ${value.data}');
      return CategoriesModel.fromJson(value.data);
    },)
        .catchError((onError) {
      debugPrint(onError.toString());
    });
  }
}
