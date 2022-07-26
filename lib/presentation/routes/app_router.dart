import 'package:carty_e_coomerce_app/business/cubits/boarding_cubit/boarding_cubit.dart';
import 'package:carty_e_coomerce_app/business/cubits/home_cubit/home_cubit.dart';
import 'package:carty_e_coomerce_app/constants/route_path.dart';
import 'package:carty_e_coomerce_app/data/network/dio_helper.dart';
import 'package:carty_e_coomerce_app/data/repositories/user_repo.dart';
import 'package:carty_e_coomerce_app/presentation/pages/boarding_screen.dart';
import 'package:carty_e_coomerce_app/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/auth_cubit/auth_cubit.dart';
import '../../business/cubits/change_product_faavorites_cubit/change_product_faavorites_cubit.dart';
import '../../business/cubits/get_categories_cubit/get_category_cubit.dart';
import '../../business/cubits/get_home_product_cubit/get_home_products_cubit.dart';
import '../../business/cubits/notification_cubit/notifications_cubit.dart';
import '../../data/repositories/category_repo.dart';
import '../../data/repositories/favorites_repo.dart';
import '../../data/repositories/home_repo.dart';
import '../../data/repositories/notifications_repo.dart';
import '../layout/home_layout.dart';
import '../pages/login_page.dart';
import '../pages/singup_page.dart';

class AppRouter {
  final dio = DioHelper();
  late UserRepository userRepository;
  late HomeRepository homeRepository;
  late CategoryRepository categoryRepository;
  late FavoritesRepository favoritesRepository;
  late NotificationsRepo notificationsRepo;

  late AuthCubit authCubit;
  late GetHomeProductsCubit getHomeProductsCubit;
  late GetCategoryCubit getCategoryCubit;
  late ChangeFavoritesCubit changeFavoritesCubit;
  late NotificationsCubit notificationsCubit;

  AppRouter() {
    userRepository = UserRepository(dio: dio);
    homeRepository = HomeRepository(dio: dio);
    categoryRepository = CategoryRepository(dio: dio);
    favoritesRepository = FavoritesRepository(dio: dio);
    notificationsRepo = NotificationsRepo(dio: dio);


    authCubit = AuthCubit(userRepository: userRepository);
    changeFavoritesCubit =
        ChangeFavoritesCubit(favoritesRepository: favoritesRepository);
    getHomeProductsCubit = GetHomeProductsCubit(
        homeRepository: homeRepository,
        changeFavoritesCubit: changeFavoritesCubit);
    getCategoryCubit = GetCategoryCubit(categoryRepository: categoryRepository);
    notificationsCubit = NotificationsCubit(repo: notificationsRepo);

  }

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return _materialPageRoute(const SplashScreen());
      case singUp:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => authCubit,
                  child: SingUp(),
                ));

      case login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => authCubit,
                  child: Login(),
                ));

      case boarding:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => BoardingCubit(),
                  child: BoardingScreen(),
                ));

      case home:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
              create: (context) =>
                  getHomeProductsCubit..getHomeProducts(),
            ),
            BlocProvider(
              create: (context) => getCategoryCubit..getCategories(),
            ),
            BlocProvider(
              create: (context) => changeFavoritesCubit..getFavorites(),
            ),
            BlocProvider(
              create: (context) => notificationsCubit..getAllNotifications(),
            ),
          ], child: const HomeLayout()),
        );
    }
    return null;
  }

  Route<dynamic> _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
