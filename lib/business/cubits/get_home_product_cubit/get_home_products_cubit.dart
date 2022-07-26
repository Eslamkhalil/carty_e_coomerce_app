
import 'package:carty_e_coomerce_app/data/models/home_model.dart';
import 'package:carty_e_coomerce_app/data/repositories/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/widgets/custom_toast.dart';
import '../change_product_faavorites_cubit/change_product_faavorites_cubit.dart';
import 'get_home_products_state.dart';

class GetHomeProductsCubit extends Cubit<GetHomeProductsState> {
  GetHomeProductsCubit({required this.homeRepository ,required this.changeFavoritesCubit})
      : super(GetHomeProductsInitial());

  static GetHomeProductsCubit get(context) => BlocProvider.of(context);

  ChangeFavoritesCubit changeFavoritesCubit;

  HomeRepository homeRepository;
  HomeModel? model;

  void getHomeProducts() async {
    emit(GetHomeProductsLoading());

    await homeRepository.fetchHomeData().then((value) {
      if (value.status == true) {
        model = value;
        for (var element in model!.data!.products) {
          changeFavoritesCubit
              .favorites
              .addAll({element.id: element.inFavorites});
          debugPrint('GetHomeProducts: ${changeFavoritesCubit.favorites.length}');
        }
        emit(GetHomeProductsSuccess(model: value));
      }
    }).catchError((onError) {
      debugPrint(onError.toString());
      customToast(msg: onError.toString(), state: ToastState.error);
      emit(GetHomeProductsError(error: onError.toString()));
    });
  }
}
