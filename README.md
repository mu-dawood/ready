# Ready
[![N|Ready][releasesPadge]][releases] 

[![N|GitHub forks][forksPadge]][forks] [![N|GitHub Repo stars][starsPadge]][stars] [![N|GitHub watchers][watchersPadge]][watchers] [![N|Ready][pubPadge]][pubUrl]

# Other languages
- [Arabic](https://github.com/mo-ah-dawood/ready/blob/main/docs/ar/index.md)
- [Chineese](https://github.com/mo-ah-dawood/ready/blob/main/docs/ch/index.md)


##### - Ready is very simple package to allow you create your admin panel with flutter

##### - Not just an admin panel it also contains avery helpful widgets that you can use with your mobile app

##### - Admin panel itself can be used in mobile apps as its responsive 

## Can i see it

 - Yes try this [Demo][demo]

## Where to get it

 - If you are seeing this in pub site so you are in the right place
 - if not you can get it  [Here](pubUrl)

## How to use it

 
 [ ] First if you support multi language you have to add ready delegate in your material app

```dart
    return MaterialApp(
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        Ready.delegate,
      ],
    );
```

[ ] We currently support `arabic` and `english`

## Features

 > Here will explain each feature
 > Click on the feature name to see how to use it
 
 [x] [ReadyDashboard](ready_dashboard)
 - Admin panel layout in easy way
 - [responsive] it can work in any device except watch of course😄😄
 - ability to group drawer items
 - ability to add action buttons
 - ability to override action buttons for some pages
 - ability to add search input field in the top app bar
 

 [x] [ReadyList](ready_list)
 - Pull to refresh
 - Infinite scroll
 - headers and footers
 - easy to work with flutter_bloc but you can use any state management solution
 - can be grid or list or your own builder
 - contains ready grid delegates to make it simple
 
  [x] [ResponsiveDataTable](responsive_data_table)
 - Responsive widget that show DataTable in large devices and list or grid in smaller one
 - 6 layouts
 - can be configured to use list or DataTable
 - can has selection in lists and DataTables
 - can add filters , actions or actions for each row
 - work with the same controller [ReadyList] 
 
 [x] [Animated]()
 - Fancy animations
 - able to merge between (flip , scale , fade, translate)
 - scoped  animated runs animations one after one
 - non scoped run all animations in parallel
 - ReadyList contains a scope so you don't need to add it
 
 [x] [Shimmer](shimmer)
 - Show shimmer effect on a widget
 - drawing the shimmer on the whole scope the shimmer is in so the full page may has one scope and will paint the shimmer gradient on all [Shimmer] children in its tree
 -like this

![LoadingShimmer](https://user-images.githubusercontent.com/31937782/147537961-2076ab13-9105-4251-83dc-62a2ae8d21fc.gif)

* see how the effect works its not related to card
 

## Packages

There is related packages that related  to  ready and you can use it

| Plugin | Version | Depends on ready
| ------ | --------- | -|
| [![N\|Ready form][ready_form_github_padge]][ready_form_github]  | [![N\|Ready][ready_form_pub_padge]][ready_form_pub] | ❌ |
| [![N\|Ready validation][ready_validation_github_padge]][ready_validation_github]  | [![N\|Ready][ready_validation_pub_padge]][ready_validation_pub] | ❌ |
| [![N\|Ready extension][ready_extensions_github_padge]][ready_extensions_github]  | [![N\|Ready][ready_extensions_pub_padge]][ready_extensions_pub] | ❌ |
| [![N\|Ready picker][ready_picker_github_padge]][ready_picker_github]  | [![N\|Ready][ready_picker_pub_padge]][ready_picker_pub] | ✅  |
| [![N\|Ready image][ready_image_github_padge]][ready_image_github]  | [![N\|Ready][ready_image_pub_padge]][ready_image_pub] | ❌ |

## How to contribute

* To make package smaller and cleaner as possible we will not add a lot of features to it
* instead we will add the new features in separate packages and list it in the packages section
* in this way if any one need the new feature he can add its package to his project
* any package must has a good docs before it listed in packages list

[ready_dashboard]: https://github.com/mo-ah-dawood/ready/blob/main/docs/en/ready_dashboard.md
[animated]: https://github.com/mo-ah-dawood/ready/blob/main/docs/en/animated.md
[ready_list]: https://github.com/mo-ah-dawood/ready/blob/main/docs/en/ready_list.md
[responsive_data_table]: https://github.com/mo-ah-dawood/ready/blob/main/docs/en/responsive_data_table.md
[shimmer]: https://github.com/mo-ah-dawood/ready/blob/main/docs/en/shimmer.md

[demo]: https://ready-19c04.web.app
[pubUrl]: https://pub.dev/packages/ready
[pubPadge]: https://img.shields.io/pub/v/ready.svg?style=for-the-badge
[stars]: https://github.com/mo-ah-dawood/ready/stargazers
[starsPadge]: https://img.shields.io/github/stars/mo-ah-dawood/ready?style=for-the-badge
[watchers]: https://github.com/mo-ah-dawood/ready/watchers
[watchersPadge]: https://img.shields.io/github/watchers/mo-ah-dawood/ready?style=for-the-badge
[forks]: https://github.com/mo-ah-dawood/ready/network/members
[forksPadge]: https://img.shields.io/github/forks/mo-ah-dawood/ready?style=for-the-badge
[releases]: https://github.com/mo-ah-dawood/ready/releases
[releasesPadge]: https://img.shields.io/github/v/release/mo-ah-dawood/ready?style=for-the-badge

[ready_form_github]: https://github.com/mo-ah-dawood/ready/tree/main/packages/ready_form/README.md
[ready_form_github_padge]: https://img.shields.io/github/stars/mo-ah-dawood/ready?label=Ready%20form&logoColor=%23ff0000&style=for-the-badge
[ready_form_pub]: https://pub.dev/packages/ready_form
[ready_form_pub_padge]: https://img.shields.io/pub/v/ready_form.svg?style=for-the-badge

[ready_extensions_github]: https://github.com/mo-ah-dawood/ready/tree/main/packages/ready_extensions/README.md
[ready_extensions_github_padge]: https://img.shields.io/github/stars/mo-ah-dawood/ready?label=Ready%20extensions&logoColor=%23ff0000&style=for-the-badge
[ready_extensions_pub]: https://pub.dev/packages/ready_extensions
[ready_extensions_pub_padge]: https://img.shields.io/pub/v/ready_extensions.svg?style=for-the-badge

[ready_image_github]: https://github.com/mo-ah-dawood/ready/tree/main/packages/ready_image/README.md
[ready_image_github_padge]: https://img.shields.io/github/stars/mo-ah-dawood/ready?label=Ready%20image&logoColor=%23ff0000&style=for-the-badge
[ready_image_pub]: https://pub.dev/packages/ready_image
[ready_image_pub_padge]: https://img.shields.io/pub/v/ready_image.svg?style=for-the-badge

[ready_picker_github]: https://github.com/mo-ah-dawood/ready/tree/main/packages/ready_picker/README.md
[ready_picker_github_padge]: https://img.shields.io/github/stars/mo-ah-dawood/ready?label=Ready%20picker&logoColor=%23ff0000&style=for-the-badge
[ready_picker_pub]: https://pub.dev/packages/ready_picker
[ready_picker_pub_padge]: https://img.shields.io/pub/v/ready_picker.svg?style=for-the-badge

[ready_validation_github]: https://github.com/mo-ah-dawood/ready/tree/main/packages/ready_validation/README.md
[ready_validation_github_padge]: https://img.shields.io/github/stars/mo-ah-dawood/ready?label=Ready%20validation&logoColor=%23ff0000&style=for-the-badge
[ready_validation_pub]: https://pub.dev/packages/ready_validation
[ready_validation_pub_padge]: https://img.shields.io/pub/v/ready_validation.svg?style=for-the-badge
