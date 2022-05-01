# wrapper for cached network image but with additional features

# how to use 

```dart
/// only the path property is required
 ReadyImage(
        path: //url or just file name as the there is a global url resolver that can handle the url,
        height: /// image height,
        width: /// image width
        queryParameters: /// query parameters to be added to the url,
        resolveUrl: /// url resolver to override the global one,
        imageRenderMethodForWeb: /// how web images can be handled,
        errorPlaceholder: /// widget in case of error,
        loadingPlaceholder: /// widget while loading,
        foregroundDecoration: /// decoration to be applied above the image,
        decoration: /// decoration behind the image,
        outerDecoration:/// decoration behind the image and its decoration ,
        outerPadding: /// the padding between the outer decoration and the image decoration,
        innerPadding: /// padding between the image and its decoration,
        fit: /// ,
        headers:/// headers to be passed ,
        cacheManager:/// image cacheManager ,
        forceForegroundRadiusSameAsBackground: /// if true will override the foreground border radius to be the sme as background,
       
      ),
```

### You can also configure these properties globally so that all images in your app can have the same shape

```dart
/// all of these properties are optional
 ReadyImageConfig(
        resolveUrl: (context, path) => Uri.parse('http://someurl/$path'),
        imageRenderMethodForWeb: ,
        errorPlaceholder: ,
        loadingPlaceholder: ,
        foregroundDecoration: ,
        decoration: ,
        outerDecoration: ,
        outerPadding: EdgeInsetsDirectional.only(start: 20),
        innerPadding: ,
        fit: ,
        headers: ,
        cacheManager: ,
        forceForegroundRadiusSameAsBackground: ,
         child: MaterialApp(),
 )
```

### this alow has its own hero image which animate all of its decoration while navigating from one screen to other

```dart
   HeroReadyImage(path:///)
```

### in some cases you may need to create an image provider not the image it self like in container background 

this will allow to make benefit of global configuration

```dart
Container(
      decoration: BoxDecoration(image: context.readyImageDecoration(path: 'path')),
    );

CircleAvatar(
      backgroundImage: context.readyImageProvider(path: 'path'),
    );
```

See the other packages in ready

[![N|Ready][pubPadge]][pubUrl]

[pubUrl]: https://pub.dev/packages/ready
[pubPadge]: https://img.shields.io/pub/v/ready.svg?style=for-the-badge
