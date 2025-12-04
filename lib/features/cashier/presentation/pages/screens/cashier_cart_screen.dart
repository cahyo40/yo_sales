import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yo_sales/widgets/card_cart_cashier_widget.dart';
import 'package:yo_ui/yo_ui.dart';

class CashierCartScreen extends ConsumerWidget {
  const CashierCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: YoColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        padding: YoPadding.all16,
        children: [
          YoText.titleLarge("Cart"),
          YoSpace(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardCartCashier(
                  productName: "Product Name",
                  price: 190000,
                  imageUrl: index == 2
                      ? "https://fastly.picsum.photos/id/1/5000/3333.jpg?hmac=Asv2DU3rA_5D1xSe22xZK47WEAN0wjWeFOhzd13ujW4"
                      : null,
                  quantity: 1,
                  onIncrement: () {},
                  onDecrement: () {},
                  onRemove: () {},
                );
              },
            ),
          ),
          YoListTile(
            contentPadding: EdgeInsets.zero,
            trailing: YoText.monoSmall("Rp 190.000", color: context.gray300),
            dense: true,
            visualDensity: VisualDensity.compact,
            titleWidget: YoText.bodySmall("SubTotal (19 items)"),
          ),
          YoListTile(
            contentPadding: EdgeInsets.zero,
            trailing: YoText.monoSmall("Rp 190.000", color: context.gray300),
            dense: true,
            visualDensity: VisualDensity.compact,
            titleWidget: YoText.bodySmall("Pajak (11%)"),
          ),
          YoDivider(),
          YoListTile(
            contentPadding: EdgeInsets.zero,
            trailing: YoText.monoMedium("Rp 190.000", color: context.textColor),
            dense: true,
            visualDensity: VisualDensity.compact,
            titleWidget: YoText.bodyMedium("Total"),
          ),
          YoRow(
            spacing: context.yoSpacingSm,
            children: [
              YoButton.custom(
                textColor: context.onPrimaryColor,
                backgroundColor: context.errorColor.withOpacity(.75),
                onPressed: () {
                  context.pop();
                },
                text: "Saved",
              ),
              Expanded(
                child: YoButton.primary(onPressed: () {}, text: "Cash"),
              ),
              YoButton.secondary(
                onPressed: () {},
                text: "QRIS",
                icon: Icon(Icons.qr_code),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
