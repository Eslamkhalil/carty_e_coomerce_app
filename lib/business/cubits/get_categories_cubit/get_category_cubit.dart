
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/categories_model.dart';
import '../../../data/repositories/category_repo.dart';
import 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit({required this.categoryRepository})
      : super(GetCategoryInitial());
  CategoryRepository categoryRepository;

  CategoriesModel? categoriesModel;

  static GetCategoryCubit get(context) => BlocProvider.of(context);

  void getCategories() async {
    emit(GetCategoryLoading());
    await categoryRepository.fetchCategories().then((value) {
      if (value.status == true) {
        categoriesModel = value;
        emit(GetCategorySuccess(model: categoriesModel!));
      }
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetCategoryError(error: onError.toString()));
    });
  }
}
