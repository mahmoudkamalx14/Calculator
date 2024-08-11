import 'package:calculator/core/theme/color_manager.dart';
import 'package:calculator/core/utils/app_styles.dart';
import 'package:calculator/calculator/data/models/button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key,
    required this.onTap,
    required this.index,
    required this.item,
  });

  final Function() onTap;

  final int index;

  final ButtonModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: selectWidth(index),
        height: 72.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: selectColor(index),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        child: Center(
          child: Text(
            item.text,
            style: AppStyles.style32Regular,
          ),
        ),
      ),
    );
  }

  selectColor(int index) {
    if (index < 3) {
      return ColorManager.darkMedium;
    } else if ((index + 1) % 4 == 0) {
      return ColorManager.darkBlue;
    } else {
      return ColorManager.darkLow;
    }
  }

  double selectWidth(int index) {
    if (index == 18) {
      return 160.w;
    } else {
      return 72.w;
    }
  }
}
