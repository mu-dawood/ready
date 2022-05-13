part of 'social_string_extensions.dart';

class HackerNewsUrl {
  final HackerNewsItemUrl? itemUrl;
  final HackerNewsUserUrl? userUrl;
  String? get userId => userUrl?.id;
  String? get itemId => itemUrl?.id;
  HackerNewsUrl._(this.itemUrl, this.userUrl);
  static HackerNewsUrl? parse(String url) {
    var _item = HackerNewsItemUrl.parse(url);
    var _user = HackerNewsUserUrl.parse(url);
    if (_item == null && _user == null) return null;
    return HackerNewsUrl._(_item, _user);
  }
}

class HackerNewsItemUrl {
  final String id;

  HackerNewsItemUrl._(this.id);
  static HackerNewsItemUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/news\.ycombinator\.com\/item\?id=(?<item>[0-9]+)')
        .allMatches(url);
    var _id = matches.getValue("item");
    if (_id == null) return null;
    return HackerNewsItemUrl._(_id);
  }
}

class HackerNewsUserUrl {
  final String id;

  HackerNewsUserUrl._(this.id);
  static HackerNewsUserUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/news\.ycombinator\.com\/user\?id=(?<user>[A-z0-9_-]+)')
        .allMatches(url);
    var _id = matches.getValue("user");
    if (_id == null) return null;
    return HackerNewsUserUrl._(_id);
  }
}
