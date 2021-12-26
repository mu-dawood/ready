import 'package:example/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

class ResponsiveList extends StatelessWidget {
  const ResponsiveList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ResponsiveDataTable(
        controller: ReadyListCubit(),
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
        type: ResponsiveDataTableType.list,
        list: ListOptions(
          title: (FakeItem item) => Text(item.name),
        ),
      ),
    );
  }
}

class CancelTokenImpl implements ICancelToken {
  @override
  void cancel([reason]) {
    // fake dont do any thing
  }
}

class ReadyListCubit extends Cubit<ReadyListState<FakeItem>> implements ReadyListController<FakeItem> {
  ReadyListCubit() : super(ReadyListState.needIntialLoading());

  @override
  Future<ReadylistResponse<FakeItem>> loadData(
      {ICancelToken? cancelToken, required int skip, required int pageSize}) async {
    var list = await FakeRepo.asyncList(pageSize);
    return ReadylistResponse.success(items: list, total: 100);
  }
}
