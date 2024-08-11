import 'package:calculator/calculator/logic/calculator_cubit.dart';
import 'package:calculator/calculator/presentation/widgets/buttons_grid_view.dart';
import 'package:calculator/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, String>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF16171C),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state,
                    style: AppStyles.style40Light,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  const ButtonsGridView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
