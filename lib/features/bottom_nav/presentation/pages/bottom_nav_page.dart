import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/core/const/role.dart';
import 'package:yo_sales/features/cashier/presentation/pages/cashier_page.dart';
import 'package:yo_sales/features/history/presentation/pages/history_page.dart';
import 'package:yo_sales/features/home/presentation/pages/home_page.dart';
import 'package:yo_sales/features/outlet/presentation/pages/outlet_page.dart';
import 'package:yo_sales/features/product/presentation/pages/product_page.dart';
import 'package:yo_sales/features/profile/presentation/pages/profile_page.dart';
import 'package:yo_sales/features/report/presentation/pages/report_page.dart';
import 'package:yo_sales/l10n/app_localizations.dart';

import '../providers/bottom_nav_provider.dart';

class BottomNavPage extends ConsumerWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(bottomNavNotifierProvider);
    final notifier = ref.read(bottomNavNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;
    final userRole = Role.cashier;

    List<BottomNavigationBarItem> buildBottomNavigationBar() {
      List<BottomNavigationBarItem> navItems;

      if (userRole == Role.cashier) {
        navItems = [
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale),
            label: l10n.cashier,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: l10n.product,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: l10n.history,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: l10n.profile,
          ),
        ];
      } else if (userRole == Role.admin) {
        navItems = [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale),
            label: l10n.cashier,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: l10n.product,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: l10n.report,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: l10n.profile,
          ),
        ];
      } else {
        // Owner
        navItems = [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: l10n.report,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: l10n.outlet),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: l10n.product,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: l10n.profile,
          ),
        ];
      }

      return navItems;
    }

    void onBottomNavTapped(int index) {
      switch (userRole) {
        case Role.cashier:
          notifier.changePageCashier(index);
          break;
        case Role.admin:
          notifier.changePageAdmin(index);
          break;
        case Role.owner:
          notifier.changePageOwner(index);
          break;
      }
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomNavTapped,
        items: buildBottomNavigationBar(),
        currentIndex: asyncState.value ?? 0,
      ),
      body: Consumer(
        builder: (_, ref, _) {
          final index = ref.watch(bottomNavNotifierProvider).value ?? 0;
          List<Widget> pages() {
            switch (userRole) {
              case Role.cashier:
                return [
                  CashierPage(key: ValueKey("${index}_cashierPage")),
                  ProductPage(key: ValueKey("${index}_productPage")),
                  HistoryPage(key: ValueKey("${index}_historyPage")),
                  ProfilePage(key: ValueKey("${index}_profilePage")),
                ];
              case Role.admin:
                return [
                  HomePage(key: ValueKey("${index}_homePage")),
                  CashierPage(key: ValueKey("${index}_cashierPage")),
                  ProductPage(key: ValueKey("${index}_productPage")),
                  ReportPage(key: ValueKey("${index}_reportPage")),
                  ProfilePage(key: ValueKey("${index}_profilePage")),
                ];
              case Role.owner:
                return [
                  HomePage(key: ValueKey("${index}_homePage")),
                  ReportPage(key: ValueKey("${index}_reportPage")),
                  OutletPage(key: ValueKey("${index}_outletPage")),
                  ProductPage(key: ValueKey("${index}_productPage")),
                  ProfilePage(key: ValueKey("${index}_profilePage")),
                ];
            }
          }

          return SafeArea(
            child: IndexedStack(index: index, children: pages()),
          );
        },
      ),
    );
  }
}
