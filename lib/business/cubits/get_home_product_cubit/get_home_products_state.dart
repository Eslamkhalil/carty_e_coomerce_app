import 'package:carty_e_coomerce_app/data/models/home_model.dart';

abstract class GetHomeProductsState {}

class GetHomeProductsInitial extends GetHomeProductsState {}

class GetHomeProductsLoading extends GetHomeProductsState {}

class GetHomeProductsSuccess extends GetHomeProductsState {
  HomeModel? model;

  GetHomeProductsSuccess({required this.model});
}

class GetHomeProductsError extends GetHomeProductsState {
  dynamic error;

  GetHomeProductsError({required this.error});
}
