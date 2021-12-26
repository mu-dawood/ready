import 'package:example/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

class ReadyGridExample extends StatelessWidget {
  final SliverStaggeredGridDelegate Function(int? length) gridDelegate;
  const ReadyGridExample({
    Key? key,
    required this.gridDelegate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadyList.grid(
      padding: const EdgeInsets.all(20),
      pageSize: 40,
      gridDelegate: gridDelegate,
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
    var list = await FakeRepo.asyncList(pageSize);
    return ReadylistResponse.success(items: list, total: 100);
  }
}
