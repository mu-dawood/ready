part of 'social_string_extensions.dart';

class RedditUrl {
  final String userName;

  RedditUrl._(this.userName);
  static RedditUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:[a-z]+\.)?reddit\.com\/(?:u(?:ser)?)\/(?<username>[A-z0-9\-\_]*)\/?')
        .allMatches(url);
    var username = matches.getValue("username");
    if (username == null) return null;
    return RedditUrl._(username);
  }
}
