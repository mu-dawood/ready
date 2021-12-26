import 'package:example/ready_grid.dart';
import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import 'ready_list.dart';
import 'responsive.dart';

class DashBoardExample extends StatelessWidget {
  const DashBoardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadyDashboard(
      drawerOptions: DrawerOptions(
        header: const DrawerHeader(child: CircleAvatar()),
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
        )
      ],
      items: [
        DashboardItem(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
            )
          ],
          builder: () {
            return Container();
          },
          icon: const Icon(Icons.dashboard),
          id: 'main',
          label: 'Main',
        ),
        DashboardItem(
          builder: () {
            return const ReadyListExample();
          },
          search: (value) {},
          icon: const Icon(Icons.list),
          id: 'list1',
          label: 'List',
        ),
        DashboardItem.items(
          icon: const Icon(Icons.category),
          label: 'Grid',
          subItems: [
            DashboardItem(
              builder: () {
                return const ReadyGridExample(gridDelegate: Grids.columns_1);
              },
              search: (value) {},
              icon: const Icon(Icons.local_cafe),
              id: 'grid 1',
              label: 'Grid 1',
            ),
            DashboardItem(
              builder: () {
                return const ReadyGridExample(gridDelegate: Grids.columns_2);
              },
              search: (value) {},
              icon: const Icon(Icons.local_cafe),
              id: 'grid 2',
              label: 'Grid 2',
            ),
            DashboardItem(
              builder: () {
                return const ReadyGridExample(gridDelegate: Grids.columns_3);
              },
              search: (value) {},
              icon: const Icon(Icons.local_cafe),
              id: 'grid 3',
              label: 'Grid 3',
            ),
            DashboardItem(
              builder: () {
                return const ReadyGridExample(gridDelegate: Grids.columns_4);
              },
              search: (value) {},
              icon: const Icon(Icons.local_cafe),
              id: 'grid 4',
              label: 'Grid 4',
            ),
          ],
        ),
        DashboardItem(
          builder: () {
            return const ResponsiveList();
          },
          search: (value) {},
          icon: const Icon(Icons.table_chart),
          id: 'responsive',
          label: 'Responsive',
        ),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
