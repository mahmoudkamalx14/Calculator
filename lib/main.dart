import 'package:calculator/calculator_app.dart';
import 'package:calculator/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(CalculatorApp(appRouter: AppRouter()));
}
