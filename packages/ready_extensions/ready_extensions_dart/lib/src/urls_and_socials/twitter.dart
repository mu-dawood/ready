part of 'urls_and_socials_extensions.dart';

class TwitterUserUrl {
  final String userName;

  TwitterUserUrl._(this.userName);
  static TwitterUserUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:[A-z]+\.)?twitter\.com\/@?(?!home|share|privacy|tos)(?<username>[A-z0-9_]+)\/?')
        .allMatches(url);
    var username = matches.getValue("username");
    if (username == null) return null;
    return TwitterUserUrl._(username);
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
    var username = matches.getValue("username");
    var tweetId = matches.getValue("tweet_id");
    if (username == null || tweetId == null) return null;
    return TwitterStatusUrl._(username, tweetId);
  }
}
