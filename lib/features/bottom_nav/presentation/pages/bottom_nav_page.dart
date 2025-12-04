import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yo_sales/core/const/role.dart';
import 'package:yo_sales/features/cashier/presentation/pages/cashier_page.dart';
import 'package:yo_sales/features/history/presentation/pages/history_page.dart';
import 'package:yo_sales/features/home/presentation/pages/home_page.dart';
import 'package:yo_sales/features/outlet/presentation/pages/outlet_page.dart';
import 'package:yo_sales/features/product/presentation/pages/product_page.dart';
import 'package:yo_sales/features/profile/presentation/pages/profile_page.dart';
import 'package:yo_sales/features/report/presentation/pages/report_page.dart';
import 'package:yo_sales/l10n/app_localizations.dart';
import 'package:yo_ui/yo_ui.dart';

import '../providers/bottom_nav_provider.dart';

class BottomNavPage extends HookConsumerWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(bottomNavNotifierProvider);
    final notifier = ref.read(bottomNavNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;
    final userRole = Role.cashier;
    final toggleDrawer = useState(false);

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

    Widget buildDrawer(BuildContext context) {
      final List<Widget> children;

      Widget cardMenu({
        required String title,
        required int index,
        required IconData icon,
      }) {
        void handleTap(int i) {
          switch (userRole) {
            case Role.cashier:
              notifier.changePageCashier(i);
              break;
            case Role.admin:
              notifier.changePageAdmin(i);
              break;
            case Role.owner:
              notifier.changePageOwner(i);
              break;
          }
        }

        final i = ref.watch(bottomNavNotifierProvider).value ?? 0;

        return YoAnimatedCrossSwitch(
          condition: toggleDrawer.value == true,
          secondChild: Center(
            child: Padding(
              padding: YoPadding.bottom16,
              child: YoButtonIcon.custom(
                tooltip: title,
                size: YoIconButtonSize.large,
                backgroundColor: i == index
                    ? context.primaryColor
                    : Colors.transparent,
                icon: Icon(icon),
                onPressed: () => handleTap(index),
              ),
            ),
          ),
          firstChild: YoListTile(
            leading: Icon(icon),
            title: title,
            selected: i == index,
            onTap: () => handleTap(index),
          ),
        );
      }

      if (userRole == Role.cashier) {
        children = [
          cardMenu(title: l10n.cashier, index: 0, icon: Icons.point_of_sale),

          cardMenu(title: l10n.product, index: 1, icon: Icons.inventory_2),
          cardMenu(title: l10n.history, index: 2, icon: Icons.history),
          cardMenu(title: l10n.profile, index: 3, icon: Icons.person),
        ];
      } else if (userRole == Role.admin) {
        children = [
          cardMenu(title: l10n.home, index: 0, icon: Icons.dashboard),
          cardMenu(title: l10n.cashier, index: 1, icon: Icons.point_of_sale),
          cardMenu(title: l10n.product, index: 2, icon: Icons.inventory_2),
          cardMenu(title: l10n.report, index: 3, icon: Icons.bar_chart),
          cardMenu(title: l10n.profile, index: 4, icon: Icons.person),
        ];
      } else {
        // Owner
        children = [
          cardMenu(title: l10n.home, index: 0, icon: Icons.dashboard),
          cardMenu(title: l10n.report, index: 1, icon: Icons.bar_chart),
          cardMenu(title: l10n.outlet, index: 2, icon: Icons.store),
          cardMenu(title: l10n.product, index: 3, icon: Icons.inventory_2),
          cardMenu(title: l10n.profile, index: 4, icon: Icons.person),
        ];
      }

      return Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: context.primaryColor),
              child: Row(
                mainAxisAlignment: toggleDrawer.value ? .spaceBetween : .center,
                children: [
                  YoAnimatedCrossSwitch(
                    condition: toggleDrawer.value,
                    firstChild: Text(
                      userRole.name(context),
                      style: context.yoTitleLarge,
                    ),
                    secondChild: SizedBox(),
                  ),
                  YoButtonIcon.ghost(
                    icon: YoAnimatedCrossSwitch(
                      condition: !toggleDrawer.value,
                      firstChild: Icon(
                        Icons.arrow_circle_right,
                        color: context.onPrimaryColor,
                      ),
                      secondChild: Icon(
                        Icons.arrow_circle_left,
                        color: context.onPrimaryColor,
                      ),
                    ),
                    onPressed: () {
                      toggleDrawer.value = !toggleDrawer.value;
                    },
                  ),
                ],
              ),
            ),
            ...children,
          ],
        ),
      );
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
      bottomNavigationBar: context.yoIsLandscape
          ? SizedBox.shrink()
          : BottomNavigationBar(
              onTap: onBottomNavTapped,
              items: buildBottomNavigationBar(),
              currentIndex: asyncState.value ?? 0,
              selectedItemColor: context.primaryColor,
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
            child: context.yoIsLandscape
                ? Row(
                    children: [
                      AnimatedContainer(
                        width: toggleDrawer.value ? 275 : 90,
                        duration: const Duration(milliseconds: 300),
                        child: buildDrawer(context),
                      ),
                      Expanded(
                        flex: 8,
                        child: IndexedStack(index: index, children: pages()),
                      ),
                    ],
                  )
                : IndexedStack(index: index, children: pages()),
          );
        },
      ),
    );
  }
}
