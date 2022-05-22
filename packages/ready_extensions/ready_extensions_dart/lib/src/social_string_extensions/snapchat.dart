part of 'social_string_extensions.dart';

class SnapchatUrl {
  final String userName;

  SnapchatUrl._(this.userName);
  static SnapchatUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)?snapchat\.com\/add\/(?<username>[A-z0-9\.\_\-]+)\/?')
        .allMatches(url);
    var username = matches.getValue("username");
    if (username == null) return null;
    return SnapchatUrl._(username);
  }
}
