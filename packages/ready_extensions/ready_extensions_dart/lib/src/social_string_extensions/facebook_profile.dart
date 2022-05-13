part of 'social_string_extensions.dart';

class FacebookUrl {
  final FacebookProfileUrl? profileUrl;
  final FacebookProfileIdUrl? profileIdUrl;
  String? get name => profileUrl?.profile;
  String? get id => profileIdUrl?.profileId;
  FacebookUrl._(this.profileUrl, this.profileIdUrl);
  static FacebookUrl? parse(String url) {
    var _profile = FacebookProfileUrl.parse(url);
    var _id = FacebookProfileIdUrl.parse(url);
    if (_profile == null && _id == null) return null;
    return FacebookUrl._(_profile, _id);
  }
}

class FacebookProfileUrl {
  final String profile;

  FacebookProfileUrl._(this.profile);
  static FacebookProfileUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)?(?:facebook|fb)\.com\/(?<profile>(?![A-z]+\.php)(?!marketplace|gaming|watch|me|messages|help|search|groups)[A-z0-9_\-\.]+)\/?')
        .allMatches(url);
    var _profile = matches.getValue("profile");
    if (_profile == null) return null;
    return FacebookProfileUrl._(_profile);
  }
}

class FacebookProfileIdUrl {
  final String profileId;

  FacebookProfileIdUrl._(this.profileId);
  static FacebookProfileIdUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)facebook.com/(?:profile.php\?id=)?(?<id>[0-9]+)')
        .allMatches(url);
    var _id = matches.getValue("id");
    if (_id == null) return null;
    return FacebookProfileIdUrl._(_id);
  }
}
