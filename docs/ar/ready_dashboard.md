# Admin panal layout in easy way

## Usage

```dart
  return ReadyDashboard(
      items: [],
  );
```

| Property | Type | Required| Description | Default |
| -- | -- |  - | ------ | - |
| items | [ `List<DashboardItem>` ](#DashboardItem) | ✓ | List of [ `DashboardItem` ](#DashboardItem) to be added to the dashboard | |
| initialIndex | `int?` |  | The first page to be displayed | 0 |
| drawerOptions | [ `DrawerOptions` ](#DrawerOptions) | ✓ | options to configure the drawer of dashboard | [ `DrawerOptions()` ](#DrawerOptions) |
| appBarOptions | [ `AppBarOptions` ](#AppBarOptions) | ✓ | options to configure the appBar of dashboard | [ `AppBarOptions()` ](#AppBarOptions) |
| actions | `List<Widget>` | ✓ | List of widgets to added to the app bar actions | `[]` |

# DashboardItem
* Describe the pages of the dashboard 
* Can be single or item group

[x] Single

```dart
DashboardItem(
  builder: () {
    // return const YourPage();
  },
  icon: const Icon(Icons.animation),
  id: 'item_id',
  label: 'Item label',
)
```

[x] Group

```dart
DashboardItem.items(
  icon: const Icon(Icons.category),
  label: 'Grid',
  subItems: [
    /// Group items
  ],
)
```

| Property | Type | Required| Description | Default |
| -- | -- |  - | ------ | - |
| icon | `Widget` | ✓ | The first page to be displayed |  |
| id | `String` | ✓ | the id of the item , must be uniq |  |
| label | `String` | ✓ | the Label to be displayed in the app bar of the dashboard |  |
| search | `Function` |  | if added a search input will be added at the app bar and label will not be displayed | |
| actions | `List<Widget>` | ✓ | List of widgets to added to the app bar actions , this will be merged with the base actions of dashboard | `[]` |
| overrideActions | `bool` | ✓ | if true actions of item will override dashboard actions instead of maere with them | `false` |
| -- | -- |  - | ------ | - |
| subItems | [ `List<DashboardItem>` ](#DashboardItem) | ✓ | List of [ `DashboardItem` ](#DashboardItem) to be added to the group | |

# DrawerOptions

| Property | Type | Required| Description | Default |
| -- | -- |  - | ------ | - |
| image | `DecorationImage?` |  | image to be added as background of the drawer | |
| backgroundColor | `Color?` |  | the background color of the drawer  |  |
| gradient | `Gradient?` |  | gradient to be added as background of the drawer| |
| headers | `List<Widget>` | ✓ | List of widgets to be added to the top of  drawer  under expand button| `[]` |
| footer | `Widget?` |  | Widget that will be added at the end of the drawer it can be aligned by wrapping it with `Align` | |
| logo | `Widget?` |  | Widget that will be added at the top of the drawer  in the same line of expand button| |

# AppBarOptions

Property | Type | Required| Description | Default 
-- | -- |  - | ------ | - 
theme | `AppBarTheme?` |  | Theme to be applied to app bar | Transparent background and normal text color
inputDecoration | `InputDecoration?` |  | decoration of search box |
flexibleSpace | `Widget?` |  | This property is used to configure an `AppBar` . flexibleSpace |
bottom | `PreferredSizeWidget?` |  | This property is used to configure an `AppBar` . bottom |
primary | `bool?` |  | This property is used to configure an `AppBar` . primary |
collapsedHeight | `double?` |  | This property is used to configure an `AppBar` . collapsedHeight |
expandedHeight | `double?` |  | This property is used to configure an `AppBar` . expandedHeight |
floating | `bool?` |  | This property is used to configure an `AppBar` . floating |
pinned | `bool?` |  | This property is used to configure an `AppBar` . pinned |
snap | `bool?` |  | This property is used to configure an `AppBar` . snap |
stretch | `bool?` |  | This property is used to configure an `AppBar` . stretch |
stretchTriggerOffset | `double?` |  | This property is used to configure an `AppBar` . stretchTriggerOffset |
onStretchTrigger | `AsyncCallback?` |  | This property is used to configure an `AppBar` . onStretchTrigger |
