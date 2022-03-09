import 'package:example/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

class ReadyGridExample extends StatelessWidget {
  final GridDelegateCallback gridDelegate;
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
      buildItem: (FakeItem? item, int index) {
        return Animated(
          fade: const FadeAnimation(),
          child: Card(
            child: ListTile(
              title: Text(item!.name),
              trailing: Text('${item.rate}'),
              leading: CircleAvatar(child: Text(item.id)),
            ),
          ),
        );
      },
      controller: ReadyListCubit(const ReadyListState.needFirstLoading()),
    );
  }
}

class ReadyListCubit extends Cubit<ReadyListState<FakeItem>>
    implements ReadyListController<FakeItem> {
  ReadyListCubit(ReadyListState<FakeItem> initialState) : super(initialState);

  @override
  ListLoadingHandler<FakeItem>? get handler => DefaultListLoadingHandler(
        loadData: (skip, pageSize, cancelToken) async {
          var list = await FakeRepo.asyncList(pageSize);
          return ReadyListResponse.success(items: list, total: 100);
        },
        controller: this,
      );
}
