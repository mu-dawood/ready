part of 'social_string_extensions.dart';

class GitHubUrl {
  final String? repositry;
  final String user;

  GitHubUrl._(this.user, this.repositry);
  static GitHubUrl? parse(String url) {
    var matches = RegExp(r'(?:https?:)?\/\/(?:www\.)?github\.com\/(?<login>[A-z0-9_-]+)\/(?<repo>[A-z0-9_-]+)\/?').allMatches(url);
    var _user = matches.getValue("login");
    if (_user == null) {
      var matches = RegExp(r'(?:https?:)?\/\/(?:www\.)?github\.com\/(?<login>[A-z0-9_-]+)\/?').allMatches(url);
      _user = matches.getValue("login");
    }
    if (_user == null) return null;

    var _repo = matches.getValue("repo");
    return GitHubUrl._(_user, _repo);
  }
}
