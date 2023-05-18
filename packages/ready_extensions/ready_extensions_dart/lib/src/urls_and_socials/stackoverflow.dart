part of 'urls_and_socials_extensions.dart';

class StackoverflowQuestionUrl {
  final String id;
  final String? title;

  StackoverflowQuestionUrl._(this.id, this.title);
  static StackoverflowQuestionUrl? parse(String url) {
    var matches = RegExp(
            r'^(?:https?:)?\/\/(?:www\.)?stackoverflow\.com\/questions\/(?<id>[0-9]+)\/(?<title>[A-z0-9-_.]+)\/?$')
        .allMatches(url);
    var id = matches.getValue("id");
    var title = matches.getValue("title");
    if (id == null) return null;
    return StackoverflowQuestionUrl._(id, title);
  }
}

class StackoverflowUserUrl {
  final String id;
  final String? userName;

  StackoverflowUserUrl._(this.id, this.userName);
  static StackoverflowUserUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)?stackoverflow\.com\/users\/(?<id>[0-9]+)\/(?<username>[A-z0-9-_.]+)\/?')
        .allMatches(url);
    var id = matches.getValue("id");
    var username = matches.getValue("username");
    if (id == null) return null;
    return StackoverflowUserUrl._(id, username);
  }
}
