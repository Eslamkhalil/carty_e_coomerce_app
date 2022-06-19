
import 'package:carty_e_coomerce_app/business/cubits/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ChangeAppInitialize());

  bool isDark = false;


  static ThemeCubit get (context) => BlocProvider.of(context);

  void toggle({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppTheme(isDark: isDark));
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        debugPrint( 'dataSaved : $isDark');
        emit(ChangeAppTheme(isDark: isDark));
      });
    }
  }
}