part of 'urls_and_socials_extensions.dart';

class YoutubeChannelUrl {
  final String id;

  YoutubeChannelUrl._(this.id);
  static YoutubeChannelUrl? parse(String url) {
    var matches = RegExp(
            r'^(?:https?:)?\/\/(?:[A-z]+\.)?youtube.com\/channel\/(?<id>[A-z0-9-\_]+)\/?$')
        .allMatches(url);
    var id = matches.getValue("id");
    if (id == null) return null;
    return YoutubeChannelUrl._(id);
  }
}

class YoutubeUserUrl {
  final String username;

  YoutubeUserUrl._(this.username);
  static YoutubeUserUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:[A-z]+\.)?youtube.com\/user\/(?<username>[A-z0-9]+)\/?')
        .allMatches(url);
    var username = matches.getValue("username");
    if (username == null) return null;
    return YoutubeUserUrl._(username);
  }
}

class YoutubeVideoUrl {
  final String id;

  YoutubeVideoUrl._(this.id);
  static YoutubeVideoUrl? parse(String url) {
    // cSpell: ignore youtu
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:(?:www\.)?youtube\.com\/(?:watch\?v=|embed\/)|youtu\.be\/)(?<id>[A-z0-9\-\_]+)')
        .allMatches(url);
    var id = matches.getValue("id");
    if (id == null) return null;
    return YoutubeVideoUrl._(id);
  }
}
