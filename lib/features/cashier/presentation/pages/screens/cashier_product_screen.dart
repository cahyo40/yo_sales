import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/widgets/card_product_cashier_widget.dart';
import 'package:yo_ui/yo_ui.dart';

class CashierProductScreen extends ConsumerWidget {
  const CashierProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return YoColumn(
      padding: YoPadding.all16,
      spacing: context.yoSpacingMd.scaled(context),
      mainAxisSize: .min,
      children: [
        YoRow(
          spacing: context.yoSpacingMd.scaled(context),
          children: [
            Expanded(
              child: YoTextFormField(
                inputStyle: YoInputStyle.minimal,
                prefixIcon: Icon(Icons.search),
                inputType: YoInputType.search,
                hintText: 'Search product',
              ),
            ),
            YoButtonIcon.primary(
              icon: Icon(Icons.qr_code),
              onPressed: () {},
              shape: YoIconButtonShape.rounded,
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.yoIsMobile ? 2 : 4,
              crossAxisSpacing: 8.0.scaled(context),
              childAspectRatio: 2.15 / 3,
              mainAxisSpacing: 8.0.scaled(context),
            ),
            itemBuilder: (context, index) {
              return CardProductCashierWidget();
            },
          ),
        ),
      ],
    );
  }
}
