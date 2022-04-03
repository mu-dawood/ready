part of 'social_string_extensions.dart';

class MediumPostUrl {
  final String? username;
  final String? publication;
  final String? slug;
  final String postId;

  MediumPostUrl._(this.username, this.publication, this.postId, this.slug);
  static MediumPostUrl? parse(String url) {
    var matches = RegExp(r'^(?:https?:)?\/\/medium\.com\/(?:(?:@(?<username>[A-z0-9]+))|(?<publication>[a-z-]+))\/(?<slug>[a-z0-9\-]+)-(?<post_id>[A-z0-9]+)(?:\?.*)?$').allMatches(url);
    var _postId = matches.getValue("post_id");
    if (_postId == null) {
      matches = RegExp(r'^(?:https?:)?\/\/(?<publication>(?!www)[a-z-]+)\.medium\.com\/(?<slug>[a-z0-9\-]+)-(?<post_id>[A-z0-9]+)(?:\?.*)?$').allMatches(url);
      _postId = matches.getValue("post_id");
    }
    if (_postId == null) return null;
    var _slug = matches.getValue("slug");
    var _userName = matches.getValue("username");
    var _publication = matches.getValue("publication");
    return MediumPostUrl._(_userName, _publication, _postId, _slug);
  }
}

class MediumUserUrl {
  final String? userName;
  final String? id;

  MediumUserUrl._(this.id, this.userName);
  static MediumUserUrl? parse(String url) {
    var matches = RegExp(r'(?:https?:)?\/\/medium\.com\/@(?<username>[A-z0-9]+)(?:\?.*)?').allMatches(url);
    var _userName = matches.getValue("username");
    if (_userName != null) {
      return MediumUserUrl._(null, _userName);
    } else {
      matches = RegExp(r'(?:https?:)?\/\/medium\.com\/u\/(?<user_id>[A-z0-9]+)(?:\?.*)').allMatches(url);
      var _id = matches.getValue("user_id");
      if (_id != null) return MediumUserUrl._(_id, null);
    }
  }
}
