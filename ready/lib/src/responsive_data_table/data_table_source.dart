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
        isLoaded: (items, __, ___) => selectedItems.length >= items.length,
      );

  void selectAll() {
    controller.state.mapOrNull(
      isLoaded: (state) {
        if (!allSelected) {
          _selectedItems = List.generate(state.items.length, (index) => index);
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
    controller.state.mapOrNull(
      isLoaded: (state) {
        if (state.items.length >= state.totalCount) return;
        var len = paging.rowsPerPage + v - state.items.length;
        if (len > 0) {
          controller.emit(ReadyListState.requestNext(
            previousState: state,
            pageSize: len,
          ));
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
    controller.state.mapOrNull(
      isLoaded: (state) {
        if (state.items.length >= state.totalCount) return;
        if (v > state.items.length) {
          controller.emit(ReadyListState.requestNext(
            previousState: state,
            pageSize: paging.rowsPerPage,
          ));
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

  DataRow _getRow(Iterable<T> items, int index) =>
      index < items.length ? _realRow(items, index) : _fakeRow(true);
  @override
  DataRow getRow(int index) {
    return controller.state.maybeMap(
      orElse: () => _fakeRow(false),
      isLoadingFirst: (_) => _fakeRow(true),
      requestFirstLoading: (_) => _fakeRow(true),
      initializing: (_) => _fakeRow(true),
      isLoaded: (state) => _getRow(state.items, index),
      isRefreshing: (state) =>
          _getRow(state.previousState().previousState.items, index),
      isLoadingNext: (state) =>
          _getRow(state.previousState().previousState.items, index),
      requestRefresh: (state) => _getRow(state.previousState.items, index),
      requestNext: (state) => _getRow(state.previousState.items, index),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount {
    return controller.state.maybeMap(
      orElse: () => 0,
      isLoaded: (state) => state.totalCount,
      isRefreshing: (state) => state.previousState().previousState.items.length,
      isLoadingNext: (state) =>
          state.previousState().previousState.items.length,
      requestNext: (state) => state.previousState.items.length,
      requestRefresh: (state) => state.previousState.items.length,
    );
  }

  @override
  int get selectedRowCount => selectedItems.length;
}
