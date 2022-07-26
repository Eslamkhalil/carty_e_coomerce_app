import 'dart:async';
import 'dart:io';

import 'package:carty_e_coomerce_app/data/local/cache_helper.dart';
import 'package:carty_e_coomerce_app/presentation/routes/route_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import '../../constants/route_path.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  bool? onboard = CacheHelper.getData(key: 'onBoarding');





  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startDelay() => _timer = Timer(const Duration(seconds: 2), _goNext);

  void _goNext() {
    debugPrint(' onboard splash:$onboard');
    debugPrint(' token : $token');


    if(onboard != null){
      if(token.isNotEmpty){
        navigateAndRemoveUntil(context: context, widgetId: home);
      }else{
        navigateAndRemoveUntil(context: context, widgetId: login);
      }
    }else{
      navigateAndRemoveUntil(context: context, widgetId: boarding);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Platform.isAndroid
            ? const CircularProgressIndicator()
            : const CupertinoActivityIndicator(),
      ),
    );
  }
}
