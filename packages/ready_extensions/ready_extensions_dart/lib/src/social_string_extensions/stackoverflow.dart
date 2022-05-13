part of 'social_string_extensions.dart';

class StackoverflowQuestionUrl {
  final String id;
  final String? title;

  StackoverflowQuestionUrl._(this.id, this.title);
  static StackoverflowQuestionUrl? parse(String url) {
    var matches = RegExp(
            r'^(?:https?:)?\/\/(?:www\.)?stackoverflow\.com\/questions\/(?<id>[0-9]+)\/(?<title>[A-z0-9-_.]+)\/?$')
        .allMatches(url);
    var _id = matches.getValue("id");
    var _title = matches.getValue("title");
    if (_id == null) return null;
    return StackoverflowQuestionUrl._(_id, _title);
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
    var _id = matches.getValue("id");
    var _username = matches.getValue("username");
    if (_id == null) return null;
    return StackoverflowUserUrl._(_id, _username);
  }
}
