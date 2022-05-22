part of 'social_string_extensions.dart';

class TelegramProfileUrl {
  final String userName;

  TelegramProfileUrl._(this.userName);
  static TelegramProfileUrl? parse(String url) {
    // cSpell: ignore elegram
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:t(?:elegram)?\.me|telegram\.org)\/(?<username>[a-z0-9\_]{5,32})\/?')
        .allMatches(url);
    var username = matches.getValue("username");
    if (username == null) return null;
    return TelegramProfileUrl._(username);
  }
}
