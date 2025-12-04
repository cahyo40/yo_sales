import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/features/cashier/presentation/pages/screens/cashier_cart_screen.dart';
import 'package:yo_sales/features/cashier/presentation/pages/screens/cashier_product_screen.dart';
import 'package:yo_ui/yo_ui.dart';

class CashierPage extends ConsumerWidget {
  const CashierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      endDrawer: context.yoIsPortrait
          ? Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(0),
              ),
              child: CashierCartScreen(),
            )
          : null,

      appBar: YoAppBar(
        title: 'Transaction',
        centerTitle: false,
        actions: [
          Visibility(
            visible: context.yoIsPortrait,
            child: YoBadge.primary(
              iconPosition: IconPosition.left,
              text: "19",
              icon: Icon(Icons.shopping_cart),
              onTap: () {
                key.currentState?.openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: context.yoIsPortrait
          ? CashierProductScreen()
          : YoRow(
              children: [
                Expanded(flex: 7, child: CashierProductScreen()),
                Expanded(flex: 3, child: CashierCartScreen()),
              ],
            ),
    );
  }
}
