import 'package:example/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

class ResponsiveList extends StatelessWidget {
  final controller = ReadyListCubit();
  ResponsiveList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ResponsiveDataTable(
        controller: controller,
        dataTable: DataTableOptions(
          buildItem: (int index, FakeItem item) {
            return [
              Text(item.id),
              Text(item.name),
              Text(item.rate.toString()),
            ];
          },
          headers: ['#', "Name", "Rate"].toDataColumns(),
        ),
        list: ListOptions(
          title: (FakeItem item) => Text(item.name),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
        filters: [
          SearchFilter(
            decoration: const InputDecoration(hintText: 'Search here'),
            onChange: (String? value) {
              controller.loadIntial(16);
            },
          ),
        ],
        selectionButton: (type, selected) {
          return IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          );
        },
        rowActions: [
          IconAction.view(
            action: (BuildContext context, ReadyListCubit controller,
                FakeItem item) {
              return showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text(item.id),
                    content: ListTile(
                      title: Text(item.name),
                      trailing: Text(item.rate.toString()),
                    ),
                  );
                },
              );
            },
          ),
          IconAction.delete(action: (BuildContext context,
              ReadyListCubit controller, FakeItem item) async {
            await Future.delayed(const Duration(seconds: 1));
            controller.removeItem(item);
          }),
        ],
      ),
    );
  }
}

class ReadyListCubit extends Cubit<ReadyListState<FakeItem>>
    implements ReadyListController<FakeItem> {
  ReadyListCubit() : super(ReadyListState());

  @override
  Future<ReadylistResponse<FakeItem>> loadData(
      {ICancelToken? cancelToken,
      required int skip,
      required int pageSize}) async {
    var list = await FakeRepo.asyncList(pageSize);
    return ReadylistResponse.success(items: list, total: 100);
  }
}
