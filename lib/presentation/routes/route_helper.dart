import 'package:flutter/material.dart';

navigateAndRemoveUntil(
        {required BuildContext context, required String widgetId}) =>
    Navigator.pushNamedAndRemoveUntil(context, widgetId, (route) => false);

navigateTo({required BuildContext context, required String widgetId}) =>
    Navigator.pushNamed(context, widgetId);
