part of 'social_string_extensions.dart';

class TwitterUserUrl {
  final String userName;

  TwitterUserUrl._(this.userName);
  static TwitterUserUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:[A-z]+\.)?twitter\.com\/@?(?!home|share|privacy|tos)(?<username>[A-z0-9_]+)\/?')
        .allMatches(url);
    var _username = matches.getValue("username");
    if (_username == null) return null;
    return TwitterUserUrl._(_username);
  }
}

class TwitterStatusUrl {
  final String userName;
  final String tweetId;

  TwitterStatusUrl._(this.userName, this.tweetId);
  static TwitterStatusUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:[A-z]+\.)?twitter\.com\/@?(?<username>[A-z0-9_]+)\/status\/(?<tweet_id>[0-9]+)\/?')
        .allMatches(url);
    var _username = matches.getValue("username");
    var _tweetId = matches.getValue("tweet_id");
    if (_username == null || _tweetId == null) return null;
    return TwitterStatusUrl._(_username, _tweetId);
  }
}
