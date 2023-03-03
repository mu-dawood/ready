### Fisrt you need your widgets with `ShimmerScope`
### Every widget must be wrapped with `Shimmer`

```dart

ShimmerScope(
   child: List(children:[
     Shimmer(child: Card(child:Text("Item 1"))),
     Shimmer(child: Card(child:Text("Item 2"))),
     Shimmer(child: Card(child:Text("Item 3"))),
     Shimmer(child: Card(child:Text("Item 4"))),
   ])
)
```

### enable or disable effect

```dart

Shimmer(
  enabled: true | false,
  child: Card(
     child: Text("Item 1")
   )
 ),
```
