part of 'urls_and_socials_extensions.dart';

class LinkedInUrl {
  final LinkedInCompanyUrl? companyUrl;
  final LinkedInPostUrl? postUrl;
  final LinkedInProfileUrl? profileUrl;

  LinkedInUrl._(this.companyUrl, this.postUrl, this.profileUrl);
  static LinkedInUrl? parse(String url) {
    var company = LinkedInCompanyUrl.parse(url);
    var post = LinkedInPostUrl.parse(url);
    var profile = LinkedInProfileUrl.parse(url);
    if (company == null && post == null && profile == null) return null;
    return LinkedInUrl._(company, post, profile);
  }
}

class LinkedInCompanyUrl {
  final String type;
  final String permalink;

  LinkedInCompanyUrl._(this.type, this.permalink);
  static LinkedInCompanyUrl? parse(String url) {
    var matches = RegExp(
            r'^(?:https?:)?\/\/(?:[\w]+\.)?linkedin\.com\/(?<company_type>(company)|(school))\/(?<company_permalink>[A-z0-9-À-ÿ\.]+)\/?$')
        .allMatches(url);
    var type = matches.getValue("company_type");
    var permalink = matches.getValue("company_permalink");
    if (type == null || permalink == null) return null;
    return LinkedInCompanyUrl._(type, permalink);
  }
}

class LinkedInPostUrl {
  final String id;

  LinkedInPostUrl._(this.id);
  static LinkedInPostUrl? parse(String url) {
    var matches = RegExp(
            r'^(?:https?:)?\/\/(?:[\w]+\.)?linkedin\.com\/feed\/update\/urn:li:activity:(?<activity_id>[0-9]+)\/?$')
        .allMatches(url);
    var id = matches.getValue("activity_id");
    if (id == null) return null;
    return LinkedInPostUrl._(id);
  }
}

class LinkedInProfileUrl {
  final String permalink;

  LinkedInProfileUrl._(this.permalink);
  static LinkedInProfileUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/(?:[\w]+\.)?linkedin\.com\/in\/(?<permalink>[\w\-\_À-ÿ%]+)\/?')
        .allMatches(url);
    var permalink = matches.getValue("permalink");
    if (permalink == null) {
      matches = RegExp(
              r'(?:https?:)?\/\/(?:[\w]+\.)?linkedin\.com\/pub\/(?<permalink_pub>[A-z0-9_-]+)(?:\/[A-z0-9]+){3}\/?')
          .allMatches(url);
      permalink = matches.getValue("permalink_pub");
    }
    if (permalink == null) return null;
    return LinkedInProfileUrl._(permalink);
  }
}
