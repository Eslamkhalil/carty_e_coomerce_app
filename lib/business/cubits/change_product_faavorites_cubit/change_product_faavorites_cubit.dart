import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/change_favorites_model.dart';
import '../../../data/models/get_favorites_model.dart';
import '../../../data/repositories/favorites_repo.dart';
import '../../../presentation/widgets/custom_toast.dart';
import 'change_product_faavorites_state.dart';

class ChangeFavoritesCubit extends Cubit<ChangeFavoritesState> {
  ChangeFavoritesCubit({required this.favoritesRepository})
      : super(ChangeFavoritesInitial());

  FavoritesRepository favoritesRepository;

  ChangeFavoritesModel? changeFavoritesModel;
  GetFavoritesModel? getFavoritesModel;

  static ChangeFavoritesCubit get(context) => BlocProvider.of(context);
  Map<int, bool> favorites = {};

  void changeFavorites(int productId) async {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavoritesSuccess());
    await favoritesRepository
        .changeFavorites(productId)
        .then((value) => {
              changeFavoritesModel = value,
              if (!value.status!)
                {
                  favorites[productId] = !favorites[productId]!,
                  debugPrint(
                      ' changeFavorites:  ${changeFavoritesModel!.data!.product!.image}'),
                }
              else
                {
                  getFavorites(),
                  customToast(
                      msg: value.message.toString(), state: ToastState.error),
                  debugPrint(' changeFavorites:  ${value.message.toString()}'),
                },
              emit(ChangeFavoritesSuccess()),
            })
        .catchError((onError) {
      favorites[productId] = !favorites[productId]!;
      debugPrint(' changeFavorites:  ${onError.toString()}');
    });
  }

  void getFavorites() async {
    emit(GetFavoritesLoading());
    await favoritesRepository.fetchFavorites().then((value) {
      if (value.status == true) {
        getFavoritesModel = value;
        emit(GetFavoritesSuccess());
      }
    }).catchError((onError) {
      emit(GetFavoritesError(error: onError.toString()));
    });
  }
}
