part of 'social_string_extensions.dart';

class CrunchbaseOrganizationUrl {
  final String organization;

  CrunchbaseOrganizationUrl._(this.organization);
  static CrunchbaseOrganizationUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/crunchbase\.com\/organization\/(?<organization>[A-z0-9_-]+)')
        .allMatches(url);
    var organization = matches.getValue("organization");
    if (organization == null) return null;
    return CrunchbaseOrganizationUrl._(organization);
  }
}

class CrunchbasePersonUrl {
  final String person;

  CrunchbasePersonUrl._(this.person);
  static CrunchbasePersonUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/crunchbase\.com\/person\/(?<person>[A-z0-9_-]+)')
        .allMatches(url);
    var person = matches.getValue("person");
    if (person == null) return null;
    return CrunchbasePersonUrl._(person);
  }
}
