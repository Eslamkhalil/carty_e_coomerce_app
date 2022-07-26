
import 'package:carty_e_coomerce_app/business/cubits/boarding_cubit/boarding_state.dart';
import 'package:carty_e_coomerce_app/presentation/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/route_path.dart';
import '../../../data/local/cache_helper.dart';
import '../../../data/models/boarding_model.dart';


class BoardingCubit extends Cubit<BoardingState>{
  BoardingCubit():super(BoardingInitial());
   bool isLast= false;
   
   static BoardingCubit get (context) => BlocProvider.of(context);

  List<BoardingModel> boards = [
    BoardingModel(
      image: 'assets/images/splash_1.png',
      body:
      'Easily find your grocery items and you will get delivery in wide range',
      title: 'Choose your item',
    ),
    BoardingModel(
      image: 'assets/images/splash_2.png',
      body:
      'We make ordering fast, simple and free-no matter if you order online or cash',
      title: 'Pick Up or Delivery',
    ),
    BoardingModel(
      image: 'assets/images/splash_3.png',
      body: 'Pay for order using credit or debit card',
      title: 'Pay quick and easy',
    ),
  ];


  void boardsLast(bool last){
    isLast = last;
    debugPrint('onBoarding: $last');
    emit(BoardingCurrentIndexChange());
  }
  void onBoardingSaved({ required BuildContext context} ){
    CacheHelper.saveData(key:'onBoarding',value: true).then((value) => {
      if(value){
        debugPrint('onBoarding: $value'),
        debugPrint('onBoarding: $value'),
        navigateTo(context: context, widgetId: login),
       // navigateAndFinish(context: context, widget: ShopLogin()),
      }
    });
  }


}