import 'package:example/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

class ReadyListExample extends StatelessWidget {
  final bool shimmer;
  const ReadyListExample({
    Key? key,
    required this.shimmer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadyList.list(
      key: Key(DateTime.now().toIso8601String()),
      pageSize: 40,
      padding: const EdgeInsets.all(20),
      allowFakeItems: shimmer,
      buildItem: (FakeItem? item, int index) {
        return _buildItem(item, index);
      },
      controller: ReadyListCubit(const ReadyListState.initializing()),
    );
  }

  Widget _buildItem(FakeItem? item, int index) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Animated.builder(
          transforms: [
            if (item == null) ...[
              const FlipAnimation(FlipType.negativeZ),
              const FlipAnimation(FlipType.x),
            ] else ...[
              const FlipAnimation(FlipType.negativeX),
            ],
          ],
          builder: (value) {
            return Shimmer(
              enabled: item == null,
              child: Card(
                child: ListTile(
                  title: Text(item?.name ?? '...'),
                  trailing: Text('${item?.rate}'),
                  leading: CircleAvatar(child: Text(item?.id ?? '#')),
                ),
              ),
            );
          },
          alignment: FractionalOffset.center,
        );
      },
    );
  }
}

abstract class BaseController extends Cubit<ReadyListState<FakeItem>>
    implements ReadyListController<FakeItem> {
  BaseController(ReadyListState<FakeItem> initialState) : super(initialState);
}

class ReadyListCubit extends BaseController with ReadyRemoteController {
  ReadyListCubit(ReadyListState<FakeItem> initialState) : super(initialState) {}

  @override
  Future<RemoteResult<FakeItem>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {
    var list = await FakeRepo.asyncList(30, const Duration(seconds: 3));
    return RemoteResult.success(list, 100);
  }

  @override
  void onChange(Change<ReadyListState<FakeItem>> change) {
    // print(change.currentState);
    // print(change.nextState);
    super.onChange(change);
  }
}
