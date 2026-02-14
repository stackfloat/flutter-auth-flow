import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_ecommerce_app/core/theme/app_colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(centerTitle: true, title: const Text('Categories')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: _CategoryListView(categories: _categories),
        ),
      ),
    );
  }
}

class _CategoryListView extends StatelessWidget {
  final List<_CategoryUiModel> categories;

  const _CategoryListView({required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      separatorBuilder: (_, _) => SizedBox(height: 14.h),
      itemBuilder: (context, index) {
        final category = categories[index];
        return _CategoryTile(category: category);
      },
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final _CategoryUiModel category;

  const _CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  category.imagePath,
                  width: 58.w,
                  height: 58.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${category.itemCount} Items',
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.lightTextSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.chevron_right_rounded,
                size: 26.sp,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryUiModel {
  final String title;
  final int itemCount;
  final String imagePath;

  const _CategoryUiModel({
    required this.title,
    required this.itemCount,
    required this.imagePath,
  });
}

const _categories = [
  _CategoryUiModel(
    title: 'Light',
    itemCount: 2140,
    imagePath: 'assets/images/categories/category_1.jpg',
  ),
  _CategoryUiModel(
    title: 'Aram Chair',
    itemCount: 1280,
    imagePath: 'assets/images/categories/category_2.jpg',
  ),
  _CategoryUiModel(
    title: 'Bedroom',
    itemCount: 860,
    imagePath: 'assets/images/categories/category_3.jpg',
  ),
  _CategoryUiModel(
    title: 'Dressing Table',
    itemCount: 2140,
    imagePath: 'assets/images/categories/category_4.jpg',
  ),
  _CategoryUiModel(
    title: 'Bedside Table',
    itemCount: 470,
    imagePath: 'assets/images/categories/category_5.jpg',
  ),
  _CategoryUiModel(
    title: 'Sofa',
    itemCount: 980,
    imagePath: 'assets/images/categories/category_6.png',
  ),
  _CategoryUiModel(
    title: 'Office Furnitures',
    itemCount: 460,
    imagePath: 'assets/images/categories/category_1.jpg',
  ),
];
