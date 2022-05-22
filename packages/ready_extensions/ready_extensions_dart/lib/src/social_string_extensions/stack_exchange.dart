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
    var id = matches.getValue("id");
    if (id == null) {
      matches = RegExp(
              r'(?:https?:)?\/\/(?:(?<community>[a-z]+(?!www))\.)?stackexchange\.com\/users\/(?<id>[0-9]+)\/(?<username>[A-z0-9-_.]+)\/?')
          .allMatches(url);
      id = matches.getValue("id");
    }
    if (id == null) return null;

    var username = matches.getValue("username");
    var community = matches.getValue("community");
    if (username == null) return null;
    return StackexchangeUrl._(username, community, id);
  }
}
