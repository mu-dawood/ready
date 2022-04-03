part of 'social_string_extensions.dart';

class AngelCompanyUrl {
  final String company;
  final String? subpage;

  AngelCompanyUrl._(this.company, this.subpage);
  static AngelCompanyUrl? parse(String url) {
    var matches = RegExp(
            r'(?:https?:)?\/\/angel\.co\/company\/(?<company>[A-z0-9_-]+)(?:\/(?<company_subpage>[A-z0-9-]+))?')
        .allMatches(url);
    var _companey = matches.getValue("company");
    var _subpage = matches.getValue("company_subpage");
    if (_companey == null) return null;
    return AngelCompanyUrl._(_companey, _subpage);
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
    var _companey = matches.getValue("company");
    var _jobId = matches.getValue("job_id");
    var _jobPermalink = matches.getValue("job_permalink");
    var _jobSlug = matches.getValue("job_slug");
    if (_companey == null) return null;
    if (_jobId == null) return null;
    return AngelJobUrl._(
      company: _companey,
      jobId: _jobId,
      jobPermalink: _jobPermalink,
      jobSlug: _jobSlug,
    );
  }
}
