part of 'social_string_extensions.dart';

class AngelCompanyUrl {
  final String company;
  final String? subPage;
  // cSpell: ignore company_subpage

  AngelCompanyUrl._(this.company, this.subPage);
  static AngelCompanyUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/angel\.co\/company\/(?<company>[A-z0-9_-]+)(?:\/(?<company_subpage>[A-z0-9-]+))?')
        .allMatches(url);
    var company = matches.getValue("company");
    var subPage = matches.getValue("company_subpage");
    if (company == null) return null;
    return AngelCompanyUrl._(company, subPage);
  }
}

class AngelJobUrl {
  final String company;
  final String? jobPermalink;
  final String jobId;
  final String? jobSlug;

  AngelJobUrl._({
    required this.company,
    required this.jobPermalink,
    required this.jobId,
    required this.jobSlug,
  });
  static AngelJobUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/angel\.co\/company\/(?<company>[A-z0-9_-]+)\/jobs\/(?<job_permalink>(?<job_id>[0-9]+)-(?<job_slug>[A-z0-9-]+))')
        .allMatches(url);
    var company = matches.getValue("company");
    var jobId = matches.getValue("job_id");
    var jobPermalink = matches.getValue("job_permalink");
    var jobSlug = matches.getValue("job_slug");
    if (company == null) return null;
    if (jobId == null) return null;
    return AngelJobUrl._(
      company: company,
      jobId: jobId,
      jobPermalink: jobPermalink,
      jobSlug: jobSlug,
    );
  }
}
