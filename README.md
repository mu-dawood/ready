# Ready
[![N|Ready](https://img.shields.io/github/v/release/mo-ah-dawood/ready?style=for-the-badge)](https://github.com/mo-ah-dawood/ready) ![GitHub forks](https://img.shields.io/github/forks/mo-ah-dawood/ready?style=for-the-badge) ![GitHub Repo stars](https://img.shields.io/github/stars/mo-ah-dawood/ready?style=for-the-badge) ![GitHub watchers](https://img.shields.io/github/watchers/mo-ah-dawood/ready?style=for-the-badge) [![N|Ready](https://img.shields.io/pub/v/ready.svg?style=for-the-badge)](https://pub.dev/packages/ready)

##### - Ready is very simple package to allow you create your admin panal with flutter

##### - Not just an admin panal it also contains avery helpfull widgets that you can use with your mobile app

##### - Admin panal itself can be used in mobile apps as its responsive 

## Can i see it
 - Yes try this [Demo](https://ready-19c04.web.app)

## Where to get it
 - If you are seeing this in pub site so you are in the right place
 - if not you can get it  [Here](https://pub.dev/packages/ready)


## How to use it
 
 [ ] Fisrt if you support multi language you have to add ready delegate in your material app
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
 
 [x] [ReadyDashboard](https://pub.dev/packages/ready)
 - Admin panal layout ineasy way
 - [responsive] it can work in any device except watch ofcourse😄😄
 - ability to groub drawer iems
 - ability to add action buttons
 - ability to override action buttons for some pages
 - ability to add search input field in the top app bar
 

 [x] [ReadyList](https://pub.dev/packages/ready)
 - Pull to refresh
 - Infinite scroll
 - headers and footers
 - easy to work with flutter_bloc but you can use any state management solution
 - can be grid or list or your own builder
 - contains ready grid delegates to make it simple
 
  [x] [ResponsiveDataTable](https://pub.dev/packages/ready)
 - Responsive widget that show datatable in large devices and list or grid in smaller one
 - 6 layouts
 - can be configured to use list or datatable
 - can has selection in lists and datatables
 - can add filters , actions or actions for each row
 - work with the same controller [ReadyList] 
 
 [x] [Animated](https://pub.dev/packages/ready)
 - Fancy animations
 - able to merge between (flip , scale , fade, translate)
 - scoped  animated runs animations one after one
 - non scoped run all animations in parallel
 - ReadyList contains ascope so you dont need to add it
 
 [x] [Shimmer](https://pub.dev/packages/ready)
 - Show shimmer effect on a widget
 - drawing the shimmer on the whole scope the shimmer is in so the full page may has one scope and will paint the shimmer gradient on all [Shimmer] childs in its tree
 -like this

![LoadingShimmer](https://user-images.githubusercontent.com/31937782/147537961-2076ab13-9105-4251-83dc-62a2ae8d21fc.gif)

- see how the effect works its not related to card
 

## Packages

Thare is related packges that related  to  ready and you can use it

| Plugin | README |
| ------ | ------ |
| Packge | [packges/README.md] |

## How to contribute
- To make package smaller and cleaner as possible we will not add a lot of features to it
- instead we will add the new features in seperate packages and list it in the packages section
- in this way if any one need the new feature he can add its package to his project
- any package must has a good docs before it listed in packges list
