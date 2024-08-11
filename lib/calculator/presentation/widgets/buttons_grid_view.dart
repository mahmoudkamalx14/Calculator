import 'package:calculator/calculator/data/models/button_model.dart';
import 'package:calculator/calculator/presentation/widgets/button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:calculator/calculator/logic/calculator_cubit.dart';

class ButtonsGridView extends StatelessWidget {
  const ButtonsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var itemsList = buttonList;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.55,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              shrinkWrap: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) => ButtonItem(
                item: itemsList[index],
                index: index,
                onTap: () {
                  CalculatorCubit.get(context)
                      .selectExpr(itemsList[index].text);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
