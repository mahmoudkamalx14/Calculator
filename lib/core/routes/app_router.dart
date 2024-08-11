import 'package:calculator/calculator/logic/calculator_cubit.dart';
import 'package:calculator/calculator/presentation/screens/calculator_screen.dart';
import 'package:calculator/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final String routeName = settings.name!;

    switch (routeName) {
      case Routes.calculatorScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CalculatorCubit(),
            child: const CalculatorScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
