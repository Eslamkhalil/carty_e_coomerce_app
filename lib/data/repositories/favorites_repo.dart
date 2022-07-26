import 'package:carty_e_coomerce_app/constants/end_point.dart';
import 'package:carty_e_coomerce_app/data/network/dio_helper.dart';

import '../../constants/constant.dart';
import '../models/change_favorites_model.dart';
import '../models/get_favorites_model.dart';

class FavoritesRepository {
  late DioHelper dio;

  FavoritesRepository({required this.dio});

  Future<GetFavoritesModel> fetchFavorites() async {
    return await dio
        .getData(url: favorites, token: token)
        .then((value) => GetFavoritesModel.fromJson(value.data));
  }

  Future<ChangeFavoritesModel> changeFavorites(int productId) async {
    return await dio.postData(url: favorites, token: token, data: {
      'product_id': productId
    }).then((value) => ChangeFavoritesModel.fromJson(value.data));
  }
}
