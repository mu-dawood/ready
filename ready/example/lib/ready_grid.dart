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
      controller: ReadyListCubit(ReadyListState.intitial()),
    );
  }
}

abstract class BaseController<T, S extends ReadyListState<T>> extends Cubit<S>
    implements ReadyListController<T, S> {
  BaseController(S initialState) : super(initialState);
}

abstract class BaseController2<T> extends BaseController<T, ReadyListState<T>>
    with ReadyListControllerCopyMixin {
  BaseController2(ReadyListState<T> initialState) : super(initialState);
}

class ReadyListCubit extends BaseController2<FakeItem>
    with ReadyRemoteControllerMixin {
  ReadyListCubit(ReadyListState<FakeItem> initialState) : super(initialState);

  @override
  Future<RemoteResult<FakeItem>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {
    var list = await FakeRepo.asyncList(pageSize ?? 20);
    return RemoteResult.success(list, 100);
  }
}
