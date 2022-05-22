part of 'social_string_extensions.dart';

class GitHubUrl {
  final String? repository;
  final String user;

  GitHubUrl._(this.user, this.repository);
  static GitHubUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:www\.)?github\.com\/(?<login>[A-z0-9_-]+)\/(?<repo>[A-z0-9_-]+)\/?')
        .allMatches(url);
    var user = matches.getValue("login");
    if (user == null) {
      var matches = RegExp(
              r'(?:https?:)?\/\/(?:www\.)?github\.com\/(?<login>[A-z0-9_-]+)\/?')
          .allMatches(url);
      user = matches.getValue("login");
    }
    if (user == null) return null;

    var repo = matches.getValue("repo");
    return GitHubUrl._(user, repo);
  }
}
