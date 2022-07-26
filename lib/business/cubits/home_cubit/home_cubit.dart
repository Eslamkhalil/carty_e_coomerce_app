
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/pages/favorites.dart';
import '../../../presentation/pages/home.dart';
import '../../../presentation/pages/notifications.dart';
import '../../../presentation/pages/profile.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  static HomeCubit get (context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> widgetsName= [
    'Home',
    'Favorites',
    'Notifications',
    'Profile',
  ];

  List<Widget> widgets =[
    const Home(),
    const Favorites(),
    const NotificationsScreen(),
    const Profile(),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(HomeChangeIndex());
  }
}
