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
      controller: ReadyListCubit(ReadyListState()),
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

class ReadyListCubit extends Cubit<ReadyListState<FakeItem>>
    implements RemoteReadyListController<FakeItem> {
  ReadyListCubit(ReadyListState<FakeItem> initialState) : super(initialState);
  @override
  Future<ReadyListResponse<FakeItem>> loadData(
      {ICancelToken? cancelToken,
      required int skip,
      required int pageSize}) async {
    var list = await FakeRepo.asyncList(30, const Duration(seconds: 3));
    return ReadyListResponse.success(items: list, total: 100);
  }
}
