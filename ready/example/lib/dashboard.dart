import 'package:example/animated_items.dart';
import 'package:example/ready_grid.dart';
import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import 'ready_list.dart';
import 'responsive.dart';

class DashBoardExample extends StatelessWidget {
  final ValueChanged<ThemeMode> onModeChanged;
  const DashBoardExample({Key? key, required this.onModeChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadyDashboard(
      currentUser: const CurrentUser.admin(),
      drawerOptions: (phone) => DrawerOptions(
        headers: [
          const DrawerHeader(child: CircleAvatar()),
          Builder(builder: (context) {
            var isDark = Theme.of(context).brightness == Brightness.dark;
            return CheckboxListTile(
              title: const Text('الوضع الليلي'),
              onChanged: (bool? value) {
                onModeChanged(isDark ? ThemeMode.light : ThemeMode.dark);
              },
              value: isDark,
            );
          }),
          const Divider()
        ],
        footer: const Align(
          alignment: AlignmentDirectional.bottomStart,
          child: ListTile(
            title: Text('© Mohamed dawood @ 2021'),
          ),
        ),
        logo: Row(
          children: const [
            SizedBox(width: 10),
            FlutterLogo(),
            SizedBox(width: 10),
            Text('Dashboard'),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notification_add),
        ),
      ],
      items: [
        DashboardItem.items(
          icon: const Icon(Icons.table_chart),
          label: 'Responsive',
          subItems: [
            DashboardItem(
              builder: (Map<String, dynamic> parameters) {
                return ResponsiveList();
              },
              icon: const Icon(Icons.table_chart),
              id: 'responsive',
              label: 'Data table',
            ),
            DashboardItem(
              builder: (Map<String, dynamic> parameters) {
                return const ReadyGridExample(gridDelegate: Grids.responsive);
              },
              icon: const Icon(Icons.local_cafe),
              id: 'grid responsive',
              label: 'Responsive grid',
            ),
          ],
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const AnimatedItemsExample();
          },
          authorization: Authorization(types: [
            AccessType.supervisor(const ['user'])
          ]),
          icon: const Icon(Icons.animation),
          id: 'animated',
          label: 'Animated items',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const AnimatedScopeItemsExample();
          },
          icon: const Icon(Icons.animation_rounded),
          id: 'animated2',
          label: 'Animated scope items',
        ),
        DashboardItem(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
            )
          ],
          builder: (Map<String, dynamic> parameters) {
            return Builder(
              builder: (context) {
                return CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context)),
                    const SliverToBoxAdapter(child: Text('App bar actions')),
                    const SliverToBoxAdapter(child: TextField())
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.attractions),
          id: 'actions',
          label: 'App bar actions',
        ),
        DashboardItem(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
            )
          ],
          builder: (Map<String, dynamic> parameters) {
            return Builder(
              builder: (context) {
                return CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context)),
                    const SliverToBoxAdapter(
                        child: Text('Override app bar actions')),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.attractions),
          id: 'actions2',
          overrideActions: true,
          label: 'Override app bar actions',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const ReadyListExample(
              shimmer: false,
            );
          },
          icon: const Icon(Icons.list),
          id: 'list1',
          label: 'List',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const ReadyListExample(shimmer: true);
          },
          icon: const Icon(Icons.list),
          id: 'list2',
          label: 'List with shimmer',
        ),
        DashboardItem.items(
          icon: const Icon(Icons.category),
          label: 'Grid',
          subItems: [
            DashboardItem(
              builder: (Map<String, dynamic> parameters) {
                return const ReadyGridExample(gridDelegate: Grids.columns_1);
              },
              icon: const Icon(Icons.local_cafe),
              id: 'grid 1',
              label: 'Grid 1',
            ),
            DashboardItem(
              builder: (Map<String, dynamic> parameters) {
                return const ReadyGridExample(gridDelegate: Grids.columns_2);
              },
              icon: const Icon(Icons.local_cafe),
              id: 'grid 2',
              label: 'Grid 2',
            ),
            DashboardItem(
              builder: (Map<String, dynamic> parameters) {
                return const ReadyGridExample(gridDelegate: Grids.columns_3);
              },
              icon: const Icon(Icons.local_cafe),
              id: 'grid 3',
              label: 'Grid 3',
            ),
            DashboardItem(
              builder: (Map<String, dynamic> parameters) {
                return const ReadyGridExample(gridDelegate: Grids.columns_4);
              },
              icon: const Icon(Icons.local_cafe),
              id: 'grid 4',
              label: 'Grid 4',
            ),
            DashboardItem(
              builder: (Map<String, dynamic> parameters) {
                return ReadyGridExample(gridDelegate: Grids.extent(150));
              },
              icon: const Icon(Icons.local_cafe),
              id: 'extent grid',
              label: 'Extent grid',
            ),
          ],
        ),
      ],
    );
  }
}
