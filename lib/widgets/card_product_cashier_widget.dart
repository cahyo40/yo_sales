import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/core/assets/images/images_const.dart';
import 'package:yo_ui/yo_ui.dart';

class CardProductCashierWidget extends ConsumerWidget {
  const CardProductCashierWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return YoCard(
      onTap: () {},
      shadows: YoBoxShadow.soft(context),
      child: YoColumn(
        padding: YoPadding.all4,
        mainAxisAlignment: .spaceBetween,
        children: [
          YoImage.asset(
            borderRadius: BorderRadius.circular(12.0),
            assetPath: YoAssetsImage.login,
            fit: BoxFit.cover,
          ),
          YoSpace(height: 2.0.scaled(context)),
          SizedBox(
            width: double.infinity,
            child: YoColumn(
              spacing: 3.0.scaled(context),
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                YoText.bodySmall(
                  'Product Name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                YoText.monoSmall(
                  YoCurrencyFormatter.formatCurrency(100000),
                  color: context.primaryColor,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Stock: ', style: context.yoBodySmall),
                      TextSpan(text: '100', style: context.yoCurrencySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
