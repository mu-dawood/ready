import 'package:example/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

class ReadyListExample extends StatelessWidget {
  const ReadyListExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadyList.list(
      pageSize: 40,
      padding: const EdgeInsets.all(20),
      buildItem: (FakeItem item, int index) {
        return SlideFadeItem(
          child: Card(
            child: ListTile(
              title: Text(item.name),
              trailing: Text('${item.rate}'),
              leading: CircleAvatar(child: Text(item.id)),
            ),
          ),
        );
      },
      controller: ReadyListCubit(ReadyListState.needIntialLoading()),
    );
  }
}

class ReadyListCubit extends Cubit<ReadyListState<FakeItem>> implements ReadyListController<FakeItem> {
  ReadyListCubit(ReadyListState<FakeItem> initialState) : super(initialState);
  @override
  Future<ReadylistResponse<FakeItem>> loadData(
      {ICancelToken? cancelToken, required int skip, required int pageSize}) async {
    var list = await FakeRepo.asyncList(100);
    return ReadylistResponse.success(items: list, total: 100);
  }
}
