part of responsive_data_table;

typedef _BuildRowCallBack<T, TController extends ReadyListController<T>> = List<Widget> Function(
    TController controller, int index, T item);

class _DataTablePaging {
  final List<int> availableRowsPerPage;
  final int rowsPerPage;
  final int currentPage;
  final int columns;
  _DataTablePaging({
    required this.availableRowsPerPage,
    required this.rowsPerPage,
    this.currentPage = 0,
    required this.columns,
  });

  _DataTablePaging copyWith({
    List<int>? availableRowsPerPage,
    int? rowsPerPage,
    int? currentPage,
  }) {
    return _DataTablePaging(
        availableRowsPerPage: availableRowsPerPage ?? this.availableRowsPerPage,
        rowsPerPage: rowsPerPage ?? this.rowsPerPage,
        currentPage: currentPage ?? this.currentPage,
        columns: columns);
  }
}

class _DataTableSource<T, TController extends ReadyListController<T>> extends DataTableSource {
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
      event.whenOrNull(
        intialLoading: (_) {
          _selectedItems.clear();
        },
        error: (_) {
          _selectedItems.clear();
        },
        items: (items, __, ___) {
          _selectedItems.removeWhere((element) => element >= items.length);
        },
      );
      notifyListeners();
    });
  }
  List<int> _selectedItems = List<int>.empty(growable: true);
  List<int> get selectedItems => _selectedItems;
  bool get allSelected => controller.state.maybeWhen(
        orElse: () => false,
        items: (items, __, ___) => selectedItems.length >= items.length,
      );

  void selectAll() {
    controller.state.whenOrNull(
      items: (items, __, ___) {
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
    paging = paging.copyWith(currentPage: v);
    notifyListeners();
    controller.state.whenOrNull(
      items: (items, total, _) {
        if (paging.rowsPerPage * paging.currentPage > items.length) {
          controller.nextData(paging.rowsPerPage);
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
      items: (items, total, _) {
        if (paging.rowsPerPage * paging.currentPage > items.length) {
          controller.nextData(paging.rowsPerPage);
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

  @override
  DataRow getRow(int index) {
    return controller.state.maybeWhen(
      orElse: () => _fakeRow(false),
      intialLoading: (_) => _fakeRow(true),
      items: (items, _, __) => index < items.length ? _realRow(items, index) : _fakeRow(true),
      refreshing: (items, _, __) => index < items.length ? _realRow(items, index) : _fakeRow(true),
      loadingNext: (items, _, __) => index < items.length ? _realRow(items, index) : _fakeRow(true),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount {
    return controller.state.maybeWhen(
      orElse: () => 0,
      items: (items, total, ___) => total,
      refreshing: (items, total, ___) => total,
      loadingNext: (items, total, ___) => total,
    );
  }

  @override
  int get selectedRowCount => selectedItems.length;
}
