part of responsive_data_table;

typedef _BuildRowCallBack<T, TController extends ReadyListController<T>>
    = List<Widget> Function(TController controller, int index, T item);

class _DataTablePaging {
  final List<int> availableRowsPerPage;
  final int rowsPerPage;
  final int firstRow;
  final int columns;
  _DataTablePaging({
    required this.availableRowsPerPage,
    required this.rowsPerPage,
    this.firstRow = 0,
    required this.columns,
  });

  _DataTablePaging copyWith({
    List<int>? availableRowsPerPage,
    int? rowsPerPage,
    int? firstRow,
  }) {
    return _DataTablePaging(
        availableRowsPerPage: availableRowsPerPage ?? this.availableRowsPerPage,
        rowsPerPage: rowsPerPage ?? this.rowsPerPage,
        firstRow: firstRow ?? this.firstRow,
        columns: columns);
  }
}

class _DataTableSource<T, TController extends ReadyListController<T>>
    extends DataTableSource {
  final TController controller;
  final _BuildRowCallBack<T, TController> buildRow;
  final bool allowSelection;
  late StreamSubscription<ReadyListState<T>> _subscription;
  late _DataTablePaging paging;
  _DataTableSource({
    required this.controller,
    required this.allowSelection,
    required this.paging,
    required this.buildRow,
  }) {
    _subscription = controller.stream.listen((event) {
      event.mapOrNull(
        isLoadingFirst: (_) {
          _selectedItems.clear();
        },
        error: (_) {
          _selectedItems.clear();
        },
        isLoaded: (state) {
          _selectedItems
              .removeWhere((element) => element >= state.items.length);
        },
      );
      notifyListeners();
    });
  }
  List<int> _selectedItems = List<int>.empty(growable: true);
  List<int> get selectedItems => _selectedItems;
  bool get allSelected => controller.state.maybeWhen(
        orElse: () => false,
        isLoaded: (items, __, _) => selectedItems.length >= items.length,
      );

  void selectAll() {
    controller.state.whenOrNull(
      isLoaded: (items, __, _) {
        if (!allSelected) {
          _selectedItems = List.generate(items.length, (index) => index);
          notifyListeners();
        }
      },
    );
  }

  void unSelectAll() {
    selectedItems.clear();
    notifyListeners();
  }

  void selectItem(int index) {
    if (!selectedItems.contains(index)) {
      selectedItems.add(index);
      notifyListeners();
    }
  }

  void unselectItem(int index) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
      notifyListeners();
    }
  }

  bool isSelected(int index) => selectedItems.contains(index);

  bool get hasSelection => selectedItems.isNotEmpty;

  void _onPageChanged(int v) {
    paging = paging.copyWith(firstRow: v);
    notifyListeners();
    controller.state.whenOrNull(
      isLoaded: (items, total, _) {
        if (items.length >= total) return;
        var len = paging.rowsPerPage + v - items.length;
        if (len > 0) {
          controller.requestNext(len);
        }
      },
    );
  }

  void _onRowsPerPageChanged(int? v) {
    if (v == null) return;
    if (paging.rowsPerPage == v) {
      return;
    }
    paging = paging.copyWith(rowsPerPage: v);
    notifyListeners();
    controller.state.whenOrNull(
      isLoaded: (items, total, _) {
        if (items.length >= total) return;
        if (v > items.length) {
          controller.requestNext(paging.rowsPerPage);
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  DataRow _fakeRow(bool loading) {
    return DataRow(
      cells: List.filled(paging.columns, const DataCell(SizedBox())),
    );
  }

  DataRow _realRow(Iterable<T> items, int index) {
    return DataRow(
      selected: isSelected(index) && allowSelection,
      onSelectChanged: !allowSelection
          ? null
          : (v) {
              if (v == true) {
                selectItem(index);
              } else {
                unselectItem(index);
              }
            },
      cells: buildRow(controller, index, items.elementAt(index)).map((e) {
        return DataCell(e);
      }).toList(),
    );
  }

  DataRow _getRow(ILoadedState<T> state, int index) =>
      index < state.items.length
          ? _realRow(state.items, index)
          : _fakeRow(true);
  @override
  DataRow getRow(int index) {
    return controller.state.maybeMap(
      orElse: () => _fakeRow(false),
      isLoadingFirst: (_) => _fakeRow(true),
      requestFirstLoading: (_) => _fakeRow(true),
      initializing: (_) => _fakeRow(true),
      isLoaded: (state) => _getRow(state, index),
      isRefreshing: (state) => _getRow(state.oldState.oldState, index),
      isLoadingNext: (state) => _getRow(state.oldState.oldState, index),
      requestRefresh: (state) => _getRow(state.oldState, index),
      requestNext: (state) => _getRow(state.oldState, index),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount {
    return controller.state.maybeWhen(
      orElse: () => 0,
      isLoaded: (items, total, _) => total,
      isRefreshing: (items, state) => state.oldState.items.length,
      isLoadingNext: (items, state) => state.oldState.items.length,
      requestNext: (items, state) => state.items.length,
      requestRefresh: (items, state) => state.items.length,
    );
  }

  @override
  int get selectedRowCount => selectedItems.length;
}
