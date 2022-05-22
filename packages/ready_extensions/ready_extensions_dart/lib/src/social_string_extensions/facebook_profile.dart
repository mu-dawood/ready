part of 'social_string_extensions.dart';

class FacebookUrl {
  final FacebookProfileUrl? profileUrl;
  final FacebookProfileIdUrl? profileIdUrl;
  String? get name => profileUrl?.profile;
  String? get id => profileIdUrl?.profileId;
  FacebookUrl._(this.profileUrl, this.profileIdUrl);
  static FacebookUrl? parse(String url) {
    var profile = FacebookProfileUrl.parse(url);
    var id = FacebookProfileIdUrl.parse(url);
    if (profile == null && id == null) return null;
    return FacebookUrl._(profile, id);
  }
}

class FacebookProfileUrl {
  final String profile;

  FacebookProfileUrl._(this.profile);
  static FacebookProfileUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)?(?:facebook|fb)\.com\/(?<profile>(?![A-z]+\.php)(?!marketplace|gaming|watch|me|messages|help|search|groups)[A-z0-9_\-\.]+)\/?')
        .allMatches(url);
    var profile = matches.getValue("profile");
    if (profile == null) return null;
    return FacebookProfileUrl._(profile);
  }
}

class FacebookProfileIdUrl {
  final String profileId;

  FacebookProfileIdUrl._(this.profileId);
  static FacebookProfileIdUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)facebook.com/(?:profile.php\?id=)?(?<id>[0-9]+)')
        .allMatches(url);
    var id = matches.getValue("id");
    if (id == null) return null;
    return FacebookProfileIdUrl._(id);
  }
}
