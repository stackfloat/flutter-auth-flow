import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/common/widgets/elevated_button_small_widget.dart';
import 'package:furniture_ecommerce_app/core/common/widgets/elevated_button_widget.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final ImageProvider image;
  final VoidCallback? onShopTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    this.onShopTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: const Color(0xFFD9DDE1), // light gray background
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left image
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image(
              image: image,
              width: 78,
              height: 92,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),

          // Right side: two columns split equally
          Expanded(
            child: SizedBox(
              height: 92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // First column: title (center vertically, left aligned)
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Second column: price + button (center vertically, left aligned)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                       ElevatedButtonSmallWidget(buttonLabel: 'SHOP', onPressEvent: onShopTap ?? () {})
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
