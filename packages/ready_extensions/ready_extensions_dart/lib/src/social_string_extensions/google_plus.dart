part of 'social_string_extensions.dart';

class GooglePlusUrl {
  final GooglePlusIdUrl? idUrl;
  final GooglePlusUserNameUrl? userNameUrl;
  String? get username => userNameUrl?.username;
  String? get id => idUrl?.id;
  GooglePlusUrl._(this.idUrl, this.userNameUrl);
  static GooglePlusUrl? parse(String url) {
    var _userName = GooglePlusUserNameUrl.parse(url);
    var _id = GooglePlusIdUrl.parse(url);
    if (_userName == null && _id == null) return null;
    return GooglePlusUrl._(_id, _userName);
  }
}

class GooglePlusIdUrl {
  final String id;

  GooglePlusIdUrl._(this.id);
  static GooglePlusIdUrl? parse(String url) {
    var matches = RegExp(r'(?:https?:)?\/\/plus\.google\.com\/(?<id>[0-9]{21})')
        .allMatches(url);
    var _id = matches.getValue("id");
    if (_id == null) return null;
    return GooglePlusIdUrl._(_id);
  }
}

class GooglePlusUserNameUrl {
  final String username;

  GooglePlusUserNameUrl._(this.username);
  static GooglePlusUserNameUrl? parse(String url) {
    var matches =
        RegExp(r'(?:https?:)?\/\/plus\.google\.com\/\+(?<username>[A-z0-9+]+)')
            .allMatches(url);
    var _username = matches.getValue("username");
    if (_username == null) return null;
    return GooglePlusUserNameUrl._(_username);
  }
}
