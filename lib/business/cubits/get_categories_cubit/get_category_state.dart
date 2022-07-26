


import '../../../data/models/categories_model.dart';

abstract class GetCategoryState {}

class GetCategoryInitial extends GetCategoryState {}
class GetCategoryLoading extends GetCategoryState {}

class GetCategorySuccess extends GetCategoryState {
  CategoriesModel model;
  GetCategorySuccess({required this.model});

}

class GetCategoryError extends GetCategoryState {
  dynamic error;

  GetCategoryError({required this.error});
}
