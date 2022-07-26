import 'package:bloc/bloc.dart';

import 'package:carty_e_coomerce_app/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'data/local/cache_helper.dart';
import 'data/network/dio_helper.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  bool? isDarkMode = CacheHelper.getData(key: 'isDark');

  BlocOverrides.runZoned(() {
    runApp(MyApp(
      appRouter: AppRouter(),
      isDark: isDarkMode,
    ));
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter, this.isDark})
      : super(key: key);
  final AppRouter appRouter;
  final bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      onGenerateRoute: appRouter.generateRouter,
    );
  }
}
