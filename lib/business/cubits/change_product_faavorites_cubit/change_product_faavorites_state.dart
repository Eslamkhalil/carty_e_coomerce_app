

abstract class ChangeFavoritesState {}

class ChangeFavoritesInitial extends ChangeFavoritesState {}

class ChangeFavoritesLoading extends ChangeFavoritesState {}

class ChangeFavoritesSuccess extends ChangeFavoritesState {

}

class ChangeFavoritesError extends ChangeFavoritesState {
  dynamic error;

  ChangeFavoritesError({required this.error});
}




class GetFavoritesLoading extends ChangeFavoritesState {}

class GetFavoritesSuccess extends ChangeFavoritesState {

}

class GetFavoritesError extends ChangeFavoritesState {
  dynamic error;

  GetFavoritesError({required this.error});
}
