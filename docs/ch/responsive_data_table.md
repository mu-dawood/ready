# Responsive widget that show datatable in large devices and list or grid in medium and small devices

# usage

## First create controller same as [ReadyList controller](https://github.com/mo-ah-dawood/ready/wiki/ReadyList#first-create-controller)

## Then

```dart
return ResponsiveDataTable(
  controller: controller,
  dataTable: DataTableOptions(
    buildItem: (int index, FakeItem item) {
      return [
        Text(item.id),
        Text(item.name),
        Text(item.rate.toString()),
      ];
    },
    headers: ['#', "Name", "Rate"].toDataColumns(),
  ),
  list: ListOptions(title: (FakeItem item) => Text(item.name)),
);
```

Property | Description  | Nullable
-- | ------ | -
dataTable |  object of [ `DataTableOptions` ](#DataTableOptions) to configure how DataTable work | 
list |  object of [ `ListOptions ` ](#ListOptions) to configure how ReadyList work | 
controller |  The list state controller | 
keepAlive |  Whether to keep a live or not | 
type |  whether to show list or datatable , leave empty for automatic | ✓
actions |  actions to display at the top of datatable or list | 
rowActions |  list of [ `Action` ](#row-actions) to display in each row | 
filters |  List of widgets to display in [filters](#Filters) sheet like search or date | 
selectionButton | Widget builder for the button to be visible when there is selection, leave empty to disable selections | ✓

# DataTableOptions

Property | Description  | Nullable
-- | ------ | -
headers | list of `DataColumn` to be displayed in the header | 
buildItem |  function that return `List<Widget>` for each row | 
padding |  Padding to applied for datatable | 
refreshButton |  Custom refresh button to be displayed at the top of datatable , leave empty for default | 
availableRowsCount |  list of `int` that will be displayed to user to choose one of them, must contain `initialRowsPerPage` | 
initialRowsPerPage |  the initial rows per page , its must be one of `availableRowsCount` | 

# ListOptions

My be simple like that 

```dart
ListOptions(
   title: (FakeItem item) => Text(item.name),
)
```

Or you can build your own 

```dart
ListOptions.builder(
  builder: (item, int index, LayoutType layout, List<Widget> actions) {
    // Your own widget
  },
)
```

Property | Description  | Nullable
-- | ------ | -
scrollController |  List scroll controller | ✓
headerSlivers |  Slivers at the top of the list or grid | ✓
footerSlivers |  Slivers at the end | ✓
innerFooterSlivers |  Sliver at the end but before the infinite loading| ✓
placeholdersConfig | Config for placeholders when list is empty or has error | ✓
allowRefresh | whether to allow pull to refresh or not | ✓
allowLoadNext |  whether to allow infinite scroll or not | ✓
noMoreText | The text to displayed when no more items | ✓
loadMoreText | The text to display when  items loaded but not fill the screen | ✓
padding | padding of the list | ✓
reverse | whether to reverse the list or not | ✓
showNoMoreText | if false we will not show 'No more text' at the end of the list | ✓
shimmerScopeGradient | gradient of shimmer scope | ✓
allowFakeItems | if this is true the the item that passed to builder item may be null, useful to display shimmer | ✓
shrinkWrap | whether to shrink-wrap or not | ✓
axis | axis of the list | ✓
physics | physics of the list | ✓
topLevelFooterSlivers | The first items in the list | ✓
topLevelHeaderSlivers | The last items in the list | ✓
pageSize |  page size to be passed to controller loadData| ✓

# Row Actions

These actions will be displayed at the end of each row or list item

currently there is `IconAction` that you can make your own actions by extending `Action`

```dart
  IconAction({
    required this.action,
    required this.icon,
    required this.color,
    required this.toolTip,
    this.enabled = _defEnabled,
  });
```

### View action

```dart
IconAction.view(
  action: (BuildContext context, ReadyListCubit controller, FakeItem item) {
   
  },
),
```

### Delete action

```dart
IconAction.delete(
  action: (BuildContext context, ReadyListCubit controller, FakeItem item) {
   
  },
),
```

### Edit action

```dart
IconAction.edit(
  action: (BuildContext context, ReadyListCubit controller, FakeItem item) {
   
  },
),
```

### Deactivate action

```dart
IconAction.deactivate(
  action: (BuildContext context, ReadyListCubit controller, FakeItem item) {
   
  },
),
```

### Activate action

```dart
IconAction.activate(
  action: (BuildContext context, ReadyListCubit controller, FakeItem item) {
   
  },
),
```

### Toggle action

```dart
IconAction.toggle(
  isActive: true | false,
  action: (BuildContext context, ReadyListCubit controller, FakeItem item) {
   
  },
),
```

# Filters

Filters is list of widgets so it can be any thing but we already had some widgets that may be used as filters

### Search filter

```dart
SearchFilter(
  onChange: (String? value) {
    /// 
  },
),
```

### Toggle filter

```dart
ToggleFilter(
  onChange: (bool? value) {
    /// 
  },
),
```

### Time filter

```dart
TimeFilter(
  onChange: (TimeOfDay? value) {
    /// 
  },
),
```

### Date filter

```dart
DateFilter(
  onChange: (DateTime? value) {
    /// 
  },
),
```

### Options filter

```dart
SingleOptionFilter(
  onChange: (int? value) {
    ///
  },
  display: 'My option',
  items: [
    OptionFilterItem(display: 'Item 1',value: 1),
    OptionFilterItem(display: 'Item 2',value: 2),
    OptionFilterItem(display: 'Item 3',value: 3),
  ],
),
```

It can be of any type not just `int`
