## how to use 
just call the extension
``` dart
 print("55.5".isDouble) // true
```
- The next sections show the extensions for every type

## String extensions
```dart
  /// will convert from english numbers to arabic numbers
  String? englishToArabicNumbers();

  /// will convert from arabic numbers to english numbers
  String? arabicToEnglishNumbers();

  /// check the string can be double
  bool get isDouble ;

  /// check the string is null or empty or whitespace
  bool get isNullOrEmptyOrWhiteSpace;
  
  /// check the string is null or empty
  bool get isNullOrEmpty;
  
  /// check string is local egyptian phone

  bool get isLocalEgyptianPhone;
  
  /// check string is international egyptian phone
  bool get isInternationalEgyptianPhone;
  
  /// check string is local ksa phone
  bool get isLocalKsaPhone;

  /// check string is international ksa phone
  bool get isInternationalKsaPhone;

  /// return `true` if the are equals with case matching
  bool equal(String? str);

  /// return `true` if the are equals without case matching
  bool equalIgnoreCase(String? str);

  /// return `Sting` without any spaces
  String? get hardTrim;

  /// `queen` will return ['q','u','e','e','n']
  List<String> get toChars;

  /// check the string can be DateTime
  bool get isDateTime;

  /// convert `String` to `DateTime` if is possible
  /// else will return null
  DateTime? toDate();

  /// convert `String` to `double` if is possible
  /// else will return null
  double? toDouble();

  /// convert `String` to `int` if is possible
  /// else will return null
  int? toInt();

  /// convert `String` to `num` if is possible
  /// else will return null
  num? toNumber();
```

## strin social media extensios
```dart
 /// Parse string to angle company url
  AngelCompanyUrl? get angelCompany;

  /// Parse string to angle job url
  AngelJobUrl? get angelJob;

  /// check string is angel company valid url
  bool isAngelCompany([String? company]);

  /// check string is angel job valid url
  bool isAngelJob([String? jobId]);

  /// Parse string to crunches organization url
  CrunchbaseOrganizationUrl? get crunchbaseOrganization;

  /// Parse string to crunchbase person url
  CrunchbasePersonUrl? get crunchbasePersonUrl;

  /// check string is runchbase organization url
  bool isCrunchbaseOrganization([String? organization]);

  /// check string is crunchbase person url
  bool isCrunchbasePerson([String? person]);

  /// Parse string to facebook url
  FacebookUrl? get facebookUrl;

  /// Check string is facebook url
  bool isFacebookUrl({String? name, String? id});

  /// Parse string to github url
  GitHubUrl? get gitHubUrl;

  /// Check string is github url
  bool isGitHubUrl({String? user, String? repositry});

  /// Parse string to google plus url

  GooglePlusUrl? get googlePlusUrl;

  /// Check string is google plus url
  bool isGooglePlusUrl({String? userName, String? id});

  /// Parse string to hacker news url

  HackerNewsUrl? get hackerNewsUrl;

  /// Check string is hacker news user url
  bool isHackerNewsUserUrl({String? id});

  /// Check string is hacker news url
  bool isHackerNewsItemUrl({String? id});
  /// Parse string to instagram  url

  InstagramUrl? get instagramUrl;

  /// Check string is instagram url
  bool isInstagramUrl({String? user});

  /// Parse string to linkedin  url
  LinkedInUrl? get linkedInUrl;

  /// Check string is linkedin profile url
  bool isLinkedInProfile({String? permalink});

  /// Check string is linkedin companey url
  bool isLinkedInCompaney({String? permalink});
  
  /// Check string is linkedin post url
  bool isLinkedInPost({String? id});

  /// Parse string to reddit  url
  RedditUrl? get redditUrl;

  /// Check string is reddit url
  bool isRedditUrl({String? user});

  /// Parse string to snapchat  url
  SnapchatUrl? get snapchatUrl;

  /// Check string is snapchat url
  bool isSnapchatUrl({String? user});

  /// Parse string to stack exchange  url
  StackexchangeUrl? get stackexchangeUrl;

  /// Check string is stack exchange url
  bool isStackexchangeUrl({String? user, String? id, String? community});

  /// Parse string to stackoverflow question  url
  StackoverflowQuestionUrl? get stackoverflowQuestionUrl;

  /// Check string is stackoverflow question url
  bool isStackoverflowQuestionUrl({String? id});

  /// Parse string to stackoverflow user  url
  StackoverflowUserUrl? get stackoverflowUserUrl;

  /// Check string is stackoverflow user url
  bool isStackoverflowUserUrl({String? id});

  /// Parse string to telegram profile  url
  TelegramProfileUrl? get telegramProfileUrl;

  /// Check string is telegram profile  url
  bool isTelegramProfileUrl({String? userName});

  /// Parse string to medium post url
  MediumPostUrl? get mediumPostUrl ;

  /// Check string is  medium post url
  bool isMediumPostUrl({String? postId}) ;

  /// Parse string to medium user url
  MediumUserUrl? get mediumUserUrl;

  /// Check string is  medium user url
  bool isMediumUserUrl({String? userName, String? id});

  /// Parse string to twitter status url
  TwitterStatusUrl? get twitterStatusUrl ;

  /// Check string is twitter status  url
  bool isTwitterStatusUrl({String? userName, String? tweetId});

  /// Parse string to twitter user url
  TwitterUserUrl? get twitterUserUrl;

  /// Check string is twitter user  url
  bool isTwitterUserUrl({String? userName});

  /// Parse string to youtube channel url
  YoutubeChannelUrl? get youtubeChannelUrl;

  /// Check string is youtube channelr  url
  bool isYoutubeChannelUrl({String? id}) ;
  /// Parse string to youtube video url
  YoutubeVideoUrl? get youtubeVideoUrl ;

  /// Check string is youtube video  url
  bool isYoutubeVideoUrl({String? id});

  /// Parse string to youtube user url
  YoutubeUserUrl? get youtubeUserUrl;

  /// Check string is youtube user  url
  bool isYoutubeUserUrl({String? username});
```

## Boolean extensions
- example 
```dart
var value=true;

return value.onTrue("yes")
```
- extensions
```dart
/// When true this will return call back
  /// When false or null this will return other
  T? onTrue<T>(T callback, [T? otherCallBack]);

  /// When true or null this will return call back
  /// When false this will return other
  T? onTrueOrNull<T>(T callback, [T? otherCallBack]);

  /// When false or null this will return call back
  /// When true this will return other
  T? onFalseOrNull<T>(T callback, [T? otherCallBack]);

  /// When false this will return call back
  /// When true or null this will return other
  T? onFalse<T>(T callback, [T? otherCallBack]);

  /// convert `bool` to int with value `0` or `1` based on `boolean value`
  int get toInt
```


## Int extensions
```dart
  /// return `false` if = 0  else return 'true`
  bool get toBool;
```

## Number extensions (double or int)
```dart
/// format the current number using NumberFormat
  String format(NumberFormat format);

  /// remove trailing zeros from the number
  /// ex: 15.00 => 15
  /// if fractionDigits is specified ex noTrailing(2)
  /// 15.5 => 15.50
  /// 15.500 => 15.50
  /// 15.00 => 15.00
  String noTrailing([int? fractionDigits]);

  /// format number with intl currency format
  String currency({
    String? locale,
    String? name,
    String? symbol,
    int? decimalDigits,
    String? customPattern,
  });

  /// format number with intl simpleCurrency format
  String simpleCurrency({
    String? locale,
    String? name,
    int? decimalDigits,
  });

  /// format number with intl compactCurrency format
  String compactCurrency({
    String? locale,
    String? name,
    String? symbol,
    int? decimalDigits,
    String? customPattern,
  });

  /// format number with intl compactSimpleCurrency format
  String compactSimpleCurrency({
    String? locale,
    String? name,
    int? decimalDigits,
  });

  /// format number with intl compact format
  String compact([String? locale]);

  /// format number with intl compactLong format
  String compactLong([String? locale]);

  /// format number with intl decimalPattern format
  String decimalPattern([String? locale]);

  /// format number with intl percentPattern format
  String percentPattern([String? locale]);

  /// format number with intl scientificPattern format
  String scientificPattern([String? locale]);

  /// format number with intl decimalPercentPattern format
  String decimalPercentPattern({
    String? locale,
    int? decimalDigits,
  });
```

# Iterable extensions
```dart
/// get the first item that match expression or null if not any
  T? firstOrDefault([bool Function(T element)? test]);

  /// get the last item that match expression or null if not any
  T? lastOrDefault([bool Function(T element)? test]);

  /// map elements with index and return new map
  Iterable<E> indexedMap<E>(E Function(int index, T e) f);

  /// loop items with index and element arguments
  void indexedForEach(void Function(int index, T element) f);

  /// Return a new list without duplicated elements
  /// you can use `.toSet().toList()` but the order may not be the same
  List<T> removeDuplicates([bool Function(T a, T b)? compare]);
```

## Duration extensions
```dart
/// Format duration to readable string
  String format({
    int maxParts = 2,
    int secondsToShowNow = 0,
    DurationFormatter formatter = const DefaultDurationFormatter(),
  });
  
   /// count down this duration with n microseconds
  Duration minusMicroSeconds([int v = 1]);

  /// count down this duration with n milliseconds
  Duration minusMilliSeconds([int v = 1]);

  /// count down this duration with n seconds
  Duration minusSeconds([int v = 1]);

  /// count down this duration with n minutes
  Duration minusMinutes([int v = 1]);

  /// count down this duration with n hours
  Duration minusHours([int v = 1]);

  /// count down this duration with n days
  Duration minusDays([int v = 1]);
  
  /// count up this duration with n microseconds
  Duration plusMicroSeconds([int v = 1]);

  /// count up this duration with n milliseconds
  Duration plusMilliSeconds([int v = 1]);
  
  /// count up this duration with n seconds
  Duration plusSeconds([int v = 1]) {
    return this + Duration(seconds: v);
  }

  /// count up this duration with n minutes
  Duration plusMinutes([int v = 1]);

  /// count up this duration with n hours
  Duration plusHours([int v = 1]);

  /// count up this duration with n days
  Duration plusDays([int v = 1]);
```
