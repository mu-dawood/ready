part of 'social_string_extensions.dart';

class HackerNewsUrl {
  final HackerNewsItemUrl? itemUrl;
  final HackerNewsUserUrl? userUrl;
  String? get userId => userUrl?.id;
  String? get itemId => itemUrl?.id;
  HackerNewsUrl._(this.itemUrl, this.userUrl);
  static HackerNewsUrl? parse(String url) {
    var item = HackerNewsItemUrl.parse(url);
    var user = HackerNewsUserUrl.parse(url);
    if (item == null && user == null) return null;
    return HackerNewsUrl._(item, user);
  }
}

class HackerNewsItemUrl {
  final String id;

  HackerNewsItemUrl._(this.id);
  static HackerNewsItemUrl? parse(String url) {
    // cSpell: ignore ycombinator
    var matches = RegExp(
            r'(?:https?:)?\/\/news\.ycombinator\.com\/item\?id=(?<item>[0-9]+)')
        .allMatches(url);
    var id = matches.getValue("item");
    if (id == null) return null;
    return HackerNewsItemUrl._(id);
  }
}

class HackerNewsUserUrl {
  final String id;

  HackerNewsUserUrl._(this.id);
  static HackerNewsUserUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/news\.ycombinator\.com\/user\?id=(?<user>[A-z0-9_-]+)')
        .allMatches(url);
    var id = matches.getValue("user");
    if (id == null) return null;
    return HackerNewsUserUrl._(id);
  }
}
