import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_ui/yo_ui.dart';

class CardCartCashier extends ConsumerWidget {
  final String productName;
  final String? productDescription;
  final double price;
  final String? imageUrl;
  final int quantity;
  final Function()? onIncrement;
  final Function()? onDecrement;
  final Function()? onRemove;

  const CardCartCashier({
    super.key,
    required this.productName,
    this.productDescription,
    required this.price,
    this.imageUrl,
    required this.quantity,
    this.onIncrement,
    this.onDecrement,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = price * quantity;

    return Container(
      padding: YoPadding.bottom4,
      child: YoCard(
        shadows: YoBoxShadow.soft(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image - Only show if provided
            if (imageUrl != null && imageUrl!.isNotEmpty && imageUrl != "")
              Padding(
                padding: EdgeInsets.only(right: 12.0.scaled(context)),
                child: YoImage.network(
                  url: imageUrl,
                  width: 60.0.scaled(context),
                  height: 60.0.scaled(context),
                ),
              ),

            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  YoText.bodyMedium(
                    productName,
                    fontWeight: FontWeight.bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  YoText.monoSmall(
                    "${_formatPrice(price)}/Items",

                    color: context.primaryColor,
                    fontSize: 10,
                  ),

                  // Product Description (if any)
                  if (productDescription != null &&
                      productDescription!.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 2.0.scaled(context)),
                      child: YoText.bodySmall(
                        productDescription!,
                        color: context.gray600,
                      ),
                    ),

                  const SizedBox(height: 4),

                  // Controls Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Controls
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: context.gray300, width: 1),
                        ),
                        child: Row(
                          children: [
                            // Decrement
                            IconButton(
                              onPressed: quantity > 1 ? onDecrement : null,
                              icon: Icon(
                                Icons.remove,
                                size: 16,
                                color: quantity > 1
                                    ? context.gray400
                                    : context.errorColor,
                              ),
                              padding: const EdgeInsets.all(4),
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                            ),

                            // Quantity
                            SizedBox(
                              width: 30,
                              child: Center(
                                child: YoText.monoSmall(
                                  quantity.toString(),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // Increment
                            IconButton(
                              onPressed: onIncrement,
                              icon: Icon(
                                Icons.add,
                                size: 16,
                                color: context.primaryColor,
                              ),
                              padding: const EdgeInsets.all(4),
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Remove Button
                      if (onRemove != null)
                        IconButton(
                          onPressed: onRemove,
                          icon: Icon(
                            Icons.delete_outline,
                            size: 20,
                            color: context.errorColor,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Total Price
                  YoText.monoSmall(
                    _formatPrice(totalPrice),
                    fontWeight: FontWeight.bold,
                    color: context.primaryColor,
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    return YoCurrencyFormatter.formatCurrency(price);
  }
}
