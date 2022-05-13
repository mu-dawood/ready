part of 'social_string_extensions.dart';

class StackexchangeUrl {
  final String userName;
  final String id;
  final String? community;

  StackexchangeUrl._(this.userName, this.community, this.id);
  static StackexchangeUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)?stackexchange\.com\/users\/(?<id>[0-9]+)\/(?<username>[A-z0-9-_.]+)\/?')
        .allMatches(url);
    var _id = matches.getValue("id");
    if (_id == null) {
      matches = RegExp(
              r'(?:https?:)?\/\/(?:(?<community>[a-z]+(?!www))\.)?stackexchange\.com\/users\/(?<id>[0-9]+)\/(?<username>[A-z0-9-_.]+)\/?')
          .allMatches(url);
      _id = matches.getValue("id");
    }
    if (_id == null) return null;

    var _username = matches.getValue("username");
    var _community = matches.getValue("community");
    if (_username == null) return null;
    return StackexchangeUrl._(_username, _community, _id);
  }
}
