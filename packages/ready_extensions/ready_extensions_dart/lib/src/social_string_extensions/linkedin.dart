part of 'social_string_extensions.dart';

class LinkedInUrl {
  final LinkedInCompaneyUrl? companeyUrl;
  final LinkedInPostUrl? postUrl;
  final LinkedInProfileUrl? profileUrl;

  LinkedInUrl._(this.companeyUrl, this.postUrl, this.profileUrl);
  static LinkedInUrl? parse(String url) {
    var _company = LinkedInCompaneyUrl.parse(url);
    var _post = LinkedInPostUrl.parse(url);
    var _profile = LinkedInProfileUrl.parse(url);
    if (_company == null && _post == null && _profile == null) return null;
    return LinkedInUrl._(_company, _post, _profile);
  }
}

class LinkedInCompaneyUrl {
  final String type;
  final String permalink;

  LinkedInCompaneyUrl._(this.type, this.permalink);
  static LinkedInCompaneyUrl? parse(String url) {
    var matches = RegExp(
            r'^(?:https?:)?\/\/(?:[\w]+\.)?linkedin\.com\/(?<company_type>(company)|(school))\/(?<company_permalink>[A-z0-9-À-ÿ\.]+)\/?$')
        .allMatches(url);
    var _type = matches.getValue("company_type");
    var _permalink = matches.getValue("company_permalink");
    if (_type == null || _permalink == null) return null;
    return LinkedInCompaneyUrl._(_type, _permalink);
  }
}

class LinkedInPostUrl {
  final String id;

  LinkedInPostUrl._(this.id);
  static LinkedInPostUrl? parse(String url) {
    var matches = RegExp(
            r'^(?:https?:)?\/\/(?:[\w]+\.)?linkedin\.com\/feed\/update\/urn:li:activity:(?<activity_id>[0-9]+)\/?$')
        .allMatches(url);
    var _id = matches.getValue("activity_id");
    if (_id == null) return null;
    return LinkedInPostUrl._(_id);
  }
}

class LinkedInProfileUrl {
  final String permalink;

  LinkedInProfileUrl._(this.permalink);
  static LinkedInProfileUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:[\w]+\.)?linkedin\.com\/in\/(?<permalink>[\w\-\_À-ÿ%]+)\/?')
        .allMatches(url);
    var _permalink = matches.getValue("permalink");
    if (_permalink == null) {
      matches = RegExp(
              r'(?:https?:)?\/\/(?:[\w]+\.)?linkedin\.com\/pub\/(?<permalink_pub>[A-z0-9_-]+)(?:\/[A-z0-9]+){3}\/?')
          .allMatches(url);
      _permalink = matches.getValue("permalink_pub");
    }
    if (_permalink == null) return null;
    return LinkedInProfileUrl._(_permalink);
  }
}
