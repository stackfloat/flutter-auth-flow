import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:furniture_ecommerce_app/core/theme/theme_extensions.dart';
import 'package:furniture_ecommerce_app/features/home/presentation/widgets/category_card.dart';
import 'package:furniture_ecommerce_app/features/home/presentation/widgets/header_basket_icon.dart';
import 'package:furniture_ecommerce_app/features/home/presentation/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discover', style: context.typography.pageTitle),
                      const HeaderBasketIcon(),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      'assets/images/home_banner.png',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: context.typography.pageTitleMedium,
                      ),
                      GestureDetector(
                        onTap: () => context.pushNamed('categories'),
                        child: Text(
                          'VIEW ALL',
                          style: context.typography.pageTitleSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 190.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 12.w),
                      itemBuilder: (context, index) {
                        final List<Map<String, dynamic>> categories = [
                          {'icon': Icons.chair, 'title': 'Chair'},
                          {'icon': Icons.carpenter, 'title': 'Carpenter'},
                          {'icon': Icons.chair, 'title': 'Chair'},
                          {'icon': Icons.chair, 'title': 'Chair'},
                          {'icon': Icons.chair, 'title': 'Chair'},
                          {'icon': Icons.chair, 'title': 'Chair'},
                        ];
                        return CategoryCard(
                          icon: categories[index]['icon'],
                          title: categories[index]['title'],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending',
                        style: context.typography.pageTitleMedium,
                      ),
                      Text(
                        'VIEW ALL',
                        style: context.typography.pageTitleSmall,
                      ),
                    ],
                  ),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final products = [
                        {
                          'title': 'Kitchen cabinet',
                          'price': 125,
                          'image': const AssetImage(
                            'assets/images/product_1.png',
                          ),
                        },
                        {
                          'title': 'Modern Sofa',
                          'price': 280,
                          'image': const AssetImage(
                            'assets/images/product_1.png',
                          ),
                        },
                        {
                          'title': 'Dining Table',
                          'price': 340,
                          'image': const AssetImage(
                            'assets/images/product_1.png',
                          ),
                        },
                        {
                          'title': 'Office Desk',
                          'price': 199,
                          'image': const AssetImage(
                            'assets/images/product_1.png',
                          ),
                        },
                        {
                          'title': 'Lounge Chair',
                          'price': 150,
                          'image': const AssetImage(
                            'assets/images/product_1.png',
                          ),
                        },
                      ];
                      final product = products[index];
                      return ProductCard(
                        title: product['title'] as String,
                        price: (product['price'] as num).toDouble(),
                        image: product['image'] as AssetImage,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
