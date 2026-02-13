import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_ecommerce_app/core/theme/app_colors.dart';
import 'package:furniture_ecommerce_app/core/theme/app_spacing.dart';

class HeaderBasketIcon extends StatelessWidget {
  const HeaderBasketIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.shopping_cart,
      size: 22.w,
      color: AppColors.lightText,
    );
  }
}
