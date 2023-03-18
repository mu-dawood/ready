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
      controller: ReadyListCubit(const ReadyListState.initializing(args: null)),
    );
  }
}

abstract class BaseController extends Cubit<ReadyListState<FakeItem, dynamic>>
    implements ReadyListController<FakeItem, dynamic> {
  BaseController(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);
}

class ReadyListCubit extends BaseController with ReadyRemoteController {
  ReadyListCubit(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);

  @override
  Future<RemoteResult<FakeItem>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {
    var list = await FakeRepo.asyncList(pageSize ?? 20);
    return RemoteResult.success(list, 100);
  }
}
