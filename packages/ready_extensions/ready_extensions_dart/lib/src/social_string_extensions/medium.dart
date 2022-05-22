part of 'social_string_extensions.dart';

class MediumPostUrl {
  final String? username;
  final String? publication;
  final String? slug;
  final String postId;

  MediumPostUrl._(this.username, this.publication, this.postId, this.slug);
  static MediumPostUrl? parse(String url) {
    var matches = RegExp(
            r'^(?:https?:)?\/\/medium\.com\/(?:(?:@(?<username>[A-z0-9]+))|(?<publication>[a-z-]+))\/(?<slug>[a-z0-9\-]+)-(?<post_id>[A-z0-9]+)(?:\?.*)?$')
        .allMatches(url);
    var postId = matches.getValue("post_id");
    if (postId == null) {
      matches = RegExp(
              r'^(?:https?:)?\/\/(?<publication>(?!www)[a-z-]+)\.medium\.com\/(?<slug>[a-z0-9\-]+)-(?<post_id>[A-z0-9]+)(?:\?.*)?$')
          .allMatches(url);
      postId = matches.getValue("post_id");
    }
    if (postId == null) return null;
    var slug = matches.getValue("slug");
    var userName = matches.getValue("username");
    var publication = matches.getValue("publication");
    return MediumPostUrl._(userName, publication, postId, slug);
  }
}

class MediumUserUrl {
  final String? userName;
  final String? id;

  MediumUserUrl._(this.id, this.userName);
  static MediumUserUrl? parse(String url) {
    var matches =
        RegExp(r'(?:https?:)?\/\/medium\.com\/@(?<username>[A-z0-9]+)(?:\?.*)?')
            .allMatches(url);
    var userName = matches.getValue("username");
    if (userName != null) {
      return MediumUserUrl._(null, userName);
    } else {
      matches = RegExp(
              r'(?:https?:)?\/\/medium\.com\/u\/(?<user_id>[A-z0-9]+)(?:\?.*)')
          .allMatches(url);
      var id = matches.getValue("user_id");
      if (id != null) return MediumUserUrl._(id, null);
    }
    return null;
  }
}
