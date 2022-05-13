part of 'social_string_extensions.dart';

class InstagramUrl {
  final String? userName;

  InstagramUrl._(this.userName);
  static InstagramUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)?(?:instagram\.com|instagr\.am)\/(?<username>[A-Za-z0-9_](?:(?:[A-Za-z0-9_]|(?:\.(?!\.))){0,28}(?:[A-Za-z0-9_]))?)')
        .allMatches(url);
    var _user = matches.getValue("username");
    if (_user == null) return null;
    return InstagramUrl._(_user);
  }
}
