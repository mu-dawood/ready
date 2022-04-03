/// all expressions taken from `https://github.com/lorey/social-media-profiles-regexs`
part 'angel.dart';
part 'crunchbase.dart';
part 'facebook_profile.dart';
part 'github.dart';
part 'google_plus.dart';
part 'hacker_news.dart';
part 'instagram.dart';
part 'linkedin.dart';
part 'medium.dart';
part 'reddit.dart';
part 'snapchat.dart';
part 'stack_exchange.dart';
part 'stackoverflow.dart';
part 'telegram.dart';
part 'twitter.dart';
part 'youtube.dart';

extension SocialStringExtensions on String? {
  /// Parse string to angle company url
  AngelCompanyUrl? get angelCompany => AngelCompanyUrl.parse(this ?? '');

  /// Parse string to angle job url
  AngelJobUrl? get angelJob => AngelJobUrl.parse(this ?? '');

  /// check string is angel company valid url
  bool isAngelCompany([String? company]) {
    var o = angelCompany;
    if (o == null) return false;
    return (company == null || o.company == company);
  }

  /// check string is angel job valid url
  bool isAngelJob([String? jobId]) {
    var o = angelJob;
    if (o == null) return false;
    return (jobId == null || o.jobId == jobId);
  }

  /// Parse string to crunches organization url
  CrunchbaseOrganizationUrl? get crunchbaseOrganization =>
      CrunchbaseOrganizationUrl.parse(this ?? '');

  /// Parse string to crunchbase person url
  CrunchbasePersonUrl? get crunchbasePersonUrl =>
      CrunchbasePersonUrl.parse(this ?? '');

  /// check string is runchbase organization url
  bool isCrunchbaseOrganization([String? organization]) {
    var o = crunchbaseOrganization;
    if (o == null) return false;
    return (organization == null || o.organization == organization);
  }

  /// check string is crunchbase person url
  bool isCrunchbasePerson([String? person]) {
    var o = crunchbasePersonUrl;
    if (o == null) return false;
    return (person == null || o.person == person);
  }

  /// Parse string to facebook url
  FacebookUrl? get facebookUrl => FacebookUrl.parse(this ?? '');

  /// Check string is facebook url
  bool isFacebookUrl({String? name, String? id}) {
    var o = facebookUrl;
    if (o == null) return false;
    return (name == null || o.name == name) && (id == null || o.id == id);
  }

  /// Parse string to github url
  GitHubUrl? get gitHubUrl => GitHubUrl.parse(this ?? '');

  /// Check string is github url
  bool isGitHubUrl({String? user, String? repositry}) {
    var o = gitHubUrl;
    if (o == null) return false;
    return (user == null || o.user == user) &&
        (repositry == null || o.repositry == repositry);
  }

  /// Parse string to google plus url

  GooglePlusUrl? get googlePlusUrl => GooglePlusUrl.parse(this ?? '');

  /// Check string is google plus url
  bool isGooglePlusUrl({String? userName, String? id}) {
    var o = googlePlusUrl;
    if (o == null) return false;
    return (userName == null || o.username == userName) &&
        (id == null || o.id == id);
  }

  /// Parse string to hacker news url

  HackerNewsUrl? get hackerNewsUrl => HackerNewsUrl.parse(this ?? '');

  /// Check string is hacker news user url
  bool isHackerNewsUserUrl({String? id}) {
    var o = hackerNewsUrl?.userUrl;
    if (o == null) return false;
    return (id == null || o.id == id);
  }

  /// Check string is hacker news url
  bool isHackerNewsItemUrl({String? id}) {
    var o = hackerNewsUrl?.itemUrl;
    if (o == null) return false;
    return (id == null || o.id == id);
  }

  /// Parse string to instagram  url

  InstagramUrl? get instagramUrl => InstagramUrl.parse(this ?? '');

  /// Check string is instagram url
  bool isInstagramUrl({String? user}) {
    var o = instagramUrl;
    if (o == null) return false;
    return (user == null || o.userName == user);
  }

  /// Parse string to linkedin  url

  LinkedInUrl? get linkedInUrl => LinkedInUrl.parse(this ?? '');

  /// Check string is linkedin profile url
  bool isLinkedInProfile({String? permalink}) {
    var o = linkedInUrl?.profileUrl;
    if (o == null) return false;
    return (permalink == null || o.permalink == permalink);
  }

  /// Check string is linkedin companey url
  bool isLinkedInCompaney({String? permalink}) {
    var o = linkedInUrl?.companeyUrl;
    if (o == null) return false;
    return (permalink == null || o.permalink == permalink);
  }

  /// Check string is linkedin post url
  bool isLinkedInPost({String? id}) {
    var o = linkedInUrl?.postUrl;
    if (o == null) return false;
    return (id == null || o.id == id);
  }

  /// Parse string to reddit  url
  RedditUrl? get redditUrl => RedditUrl.parse(this ?? '');

  /// Check string is reddit url
  bool isRedditUrl({String? user}) {
    var o = redditUrl;
    if (o == null) return false;
    return (user == null || o.userName == user);
  }

  /// Parse string to snapchat  url
  SnapchatUrl? get snapchatUrl => SnapchatUrl.parse(this ?? '');

  /// Check string is snapchat url
  bool isSnapchatUrl({String? user}) {
    var o = snapchatUrl;
    if (o == null) return false;
    return (user == null || o.userName == user);
  }

  /// Parse string to stack exchange  url
  StackexchangeUrl? get stackexchangeUrl => StackexchangeUrl.parse(this ?? '');

  /// Check string is stack exchange url
  bool isStackexchangeUrl({String? user, String? id, String? community}) {
    var o = stackexchangeUrl;
    if (o == null) return false;
    return (user == null || o.userName == user) &&
        (id == null || o.id == id) &&
        (community == null || o.community == community);
  }

  /// Parse string to stackoverflow question  url
  StackoverflowQuestionUrl? get stackoverflowQuestionUrl =>
      StackoverflowQuestionUrl.parse(this ?? '');

  /// Check string is stackoverflow question url
  bool isStackoverflowQuestionUrl({String? id}) {
    var o = stackoverflowQuestionUrl;
    if (o == null) return false;
    return (id == null || o.id == id);
  }

  /// Parse string to stackoverflow user  url
  StackoverflowUserUrl? get stackoverflowUserUrl =>
      StackoverflowUserUrl.parse(this ?? '');

  /// Check string is stackoverflow user url
  bool isStackoverflowUserUrl({String? id}) {
    var o = stackoverflowUserUrl;
    if (o == null) return false;
    return (id == null || o.id == id);
  }

  /// Parse string to telegram profile  url
  TelegramProfileUrl? get telegramProfileUrl =>
      TelegramProfileUrl.parse(this ?? '');

  /// Check string is telegram profile  url
  bool isTelegramProfileUrl({String? userName}) {
    var o = telegramProfileUrl;
    if (o == null) return false;
    return (userName == null || o.userName == userName);
  }

  /// Parse string to medium post url
  MediumPostUrl? get mediumPostUrl => MediumPostUrl.parse(this ?? '');

  /// Check string is  medium post url
  bool isMediumPostUrl({String? postId}) {
    var o = mediumPostUrl;
    if (o == null) return false;
    return (postId == null || o.postId == postId);
  }

  /// Parse string to medium user url
  MediumUserUrl? get mediumUserUrl => MediumUserUrl.parse(this ?? '');

  /// Check string is  medium user url
  bool isMediumUserUrl({String? userName, String? id}) {
    var o = mediumUserUrl;
    if (o == null) return false;
    return (userName == null || o.userName == userName) &&
        (id == null || o.id == id);
  }

  /// Parse string to twitter status url
  TwitterStatusUrl? get twitterStatusUrl => TwitterStatusUrl.parse(this ?? '');

  /// Check string is twitter status  url
  bool isTwitterStatusUrl({String? userName, String? tweetId}) {
    var o = twitterStatusUrl;
    if (o == null) return false;
    return (userName == null || o.userName == userName) &&
        (tweetId == null || o.tweetId == tweetId);
  }

  /// Parse string to twitter user url
  TwitterUserUrl? get twitterUserUrl => TwitterUserUrl.parse(this ?? '');

  /// Check string is twitter user  url
  bool isTwitterUserUrl({String? userName}) {
    var o = twitterUserUrl;
    if (o == null) return false;
    return (userName == null || o.userName == userName);
  }

  /// Parse string to youtube channel url
  YoutubeChannelUrl? get youtubeChannelUrl =>
      YoutubeChannelUrl.parse(this ?? '');

  /// Check string is youtube channelr  url
  bool isYoutubeChannelUrl({String? id}) {
    var o = youtubeChannelUrl;
    if (o == null) return false;
    return (id == null || o.id == id);
  }

  /// Parse string to youtube video url
  YoutubeVideoUrl? get youtubeVideoUrl => YoutubeVideoUrl.parse(this ?? '');

  /// Check string is youtube video  url
  bool isYoutubeVideoUrl({String? id}) {
    var o = youtubeVideoUrl;
    if (o == null) return false;
    return (id == null || o.id == id);
  }

  /// Parse string to youtube user url
  YoutubeUserUrl? get youtubeUserUrl => YoutubeUserUrl.parse(this ?? '');

  /// Check string is youtube user  url
  bool isYoutubeUserUrl({String? username}) {
    var o = youtubeUserUrl;
    if (o == null) return false;
    return (username == null || o.username == username);
  }
}

extension RegExpMatchsExtensions on Iterable<RegExpMatch> {
  String? getValue(String name) {
    var matches = this
        .where((element) => element.groupNames.contains(name))
        .map((e) => e.namedGroup(name))
        .where((element) => element != null);
    if (matches.length == 0) return null;
    return matches.first;
  }
}
