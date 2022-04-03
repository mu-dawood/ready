import 'package:ready_extensions_dart/ready_extensions_dart.dart';
import 'package:test/test.dart';

void main() {
  test('bool extension test', () {
    //! OnTrue
    expect(true.onTrue('result'), 'result');
    expect(null.onTrue('result'), null);
    expect(false.onTrue('result'), null);
    //! OnFalse
    expect(false.onFalse('result'), 'result');
    expect(null.onFalse('result'), null);
    expect(true.onFalse('result'), null);
    //! onFalseOrNull
    expect(false.onFalseOrNull('result'), 'result');
    expect(null.onFalseOrNull('result'), 'result');
    expect(true.onFalseOrNull('result'), null);
    //! onTrueOrNull
    expect(false.onTrueOrNull('result'), null);
    expect(null.onTrueOrNull('result'), 'result');
    expect(true.onTrueOrNull('result'), 'result');
  });

  test('duration extensions', () {
    expect(const Duration(hours: 16767).format(), 'one year & 11 months');
  });

  test('num extensions', () {
    expect(15.0.noTrailing(), '15');
    expect((15.5).noTrailing(), '15.5');
    expect((15.55).noTrailing(), '15.55');
    expect((15.500005).noTrailing(), '15.500005');
    expect((15.5000050).noTrailing(10), '15.5000050000');
    expect((15.50000500000).noTrailing(), '15.500005');
    expect((15.5000050).noTrailing(), '15.500005');
    expect((0.5000050).noTrailing(), '0.500005');
    expect((15.5).noTrailing(2), '15.50');
    expect((15.00).noTrailing(2), '15.00');
    expect((15.05).noTrailing(2), '15.05');
    expect(15.5.noTrailing(), '15.5');
    expect((30000.0).noTrailing(), '30000');
  });

  test('iterable extensions', () {
    var list = [DateTime(2000), DateTime(2001), DateTime(2002)];
    expect(list.firstOrDefault(), list[0]);
    expect(list.firstOrDefault((i) => i.year == 2001), list[1]);
    expect(list.firstOrDefault((i) => i.year == 2005), null);

    expect(list.lastOrDefault(), list[2]);
    expect(list.lastOrDefault((i) => i.year == 2001), list[1]);
    expect(list.lastOrDefault((i) => i.year == 2005), null);
  });

  test('Angel url string extensions', () {
    expect("https://angel.co/company/twitter".angelCompany?.company, "twitter");
    expect(
        "https://angel.co/company/twitter/test".angelCompany?.subpage, "test");
    expect("https://angel.co/company/twitter".isAngelCompany(), true);
    expect(
        "https://angel.co/company/twitter/jobs/576275-engineering-manager"
            .isAngelJob(),
        true);
    expect(
        "https://angel.co/company/twitter/jobs/576275-engineering-manager"
            .angelJob
            ?.jobId,
        "576275");
  });
  test('crunchbase url string extensions', () {
    expect(
        "http://crunchbase.com/organization/twitter"
            .crunchbaseOrganization
            ?.organization,
        "twitter");
    expect("http://crunchbase.com/person/dawood".crunchbasePersonUrl?.person,
        "dawood");
    expect(
        "http://crunchbase.com/organization/twitter".isCrunchbaseOrganization(),
        true);
    expect("http://crunchbase.com/organization/twitter".isCrunchbasePerson(),
        false);
    expect("http://crunchbase.com/person/dawood".isCrunchbasePerson(), true);
    expect("http://crunchbase.com/person/dawood".isCrunchbaseOrganization(),
        false);
  });

  test('facebook url string extensions', () {
    expect("http://fb.com/peter_parker-miller".isFacebookUrl(), true);
    expect("https://facebook.com/peter.parker".isFacebookUrl(), true);
    expect("https://facebook.com/peterparker".isFacebookUrl(), true);
    expect("https://dkdj.com/peterparker".isFacebookUrl(), false);
    expect("https://facebook.com/peterparker".facebookUrl?.name, "peterparker");
    expect("https://www.facebook.com/100004123456789".isFacebookUrl(), true);
    expect(
        "https://www.facebook.com/profile.php?id=100004123456789"
            .isFacebookUrl(),
        true);

    expect("https://www.facebook.com/100004123456789".facebookUrl?.id,
        "100004123456789");
    expect(
        "https://www.facebook.com/profile.php?id=100004123456789"
            .facebookUrl
            ?.id,
        "100004123456789");
  });

  test('other string extensions', () {
    expect(
        "https://github.com/lorey/socials"
            .isGitHubUrl(user: "lorey", repositry: "socials"),
        true);
    expect("https://github.com/lorey".isGitHubUrl(user: "lorey"), true);
    expect(
        "https://plus.google.com/111111111111111111111"
            .isGooglePlusUrl(id: "111111111111111111111"),
        true);
    expect(
        "https://plus.google.com/+googleplususername"
            .isGooglePlusUrl(userName: "googleplususername"),
        true);

    expect(
        "https://news.ycombinator.com/item?id=23290375"
            .isHackerNewsItemUrl(id: "23290375"),
        true);
    expect(
        "https://news.ycombinator.com/user?id=CamelCaps"
            .isHackerNewsUserUrl(id: "CamelCaps"),
        true);
    expect(
        "https://instagram.com/__disco__dude"
            .isInstagramUrl(user: "__disco__dude"),
        true);
    expect(
        "https://instagram.com/mahmoudibra30?utm_medium=copy_link"
            .isInstagramUrl(user: "mahmoudibra30"),
        true);
    expect(
        "https://fr.linkedin.com/school/université-grenoble-alpes"
            .isLinkedInCompaney(permalink: "université-grenoble-alpes"),
        true);
    expect(
        "https://linkedin.com/company/dash-company.io"
            .isLinkedInCompaney(permalink: "dash-company.io"),
        true);
    expect(
        "https://www.linkedin.com/company/1234567"
            .isLinkedInCompaney(permalink: "1234567"),
        true);
    expect(
        "https://www.linkedin.com/feed/update/urn:li:activity:6665508550111912345/"
            .isLinkedInPost(id: "6665508550111912345"),
        true);
    expect(
        "https://de.linkedin.com/in/peter-m%C3%BCller-81a8/"
            .isLinkedInProfile(permalink: "peter-m%C3%BCller-81a8"),
        true);
    expect(
        "https://linkedin.com/pub/karllorey/abc/123/be"
            .isLinkedInProfile(permalink: "karllorey"),
        true);
  });

  test('medium string extensions', () {
    expect(
        "https://medium.com/@karllorey/keeping-pandas-dataframes-clean-when-importing-json-348d3439ed67"
            .isMediumPostUrl(postId: "348d3439ed67"),
        true);
    expect(
        "https://medium.com/does-exist/some-post-123abc"
            .isMediumPostUrl(postId: "123abc"),
        true);

    expect(
        "https://onezero.medium.com/what-facebooks-remote-work-policy-means-for-the-future-of-tech-salaries-everywhere-edf859226b62?source=grid_home------"
            .isMediumPostUrl(postId: "edf859226b62"),
        true);
    expect(
        "https://onezero.medium.com/what-facebooks-remote-work-policy-means-for-the-future-of-tech-salaries-everywhere-edf859226b62?source=grid_home------"
            .mediumPostUrl
            ?.publication,
        "onezero");
    expect(
        "https://medium.com/@karllorey".isMediumUserUrl(userName: "karllorey"),
        true);
    expect(
        "https://medium.com/u/b3d3d3653c2c?source=post_page-----da92b81b85ef----------------------"
            .isMediumUserUrl(id: "b3d3d3653c2c"),
        true);
  });

  test('reddit string extensions', () {
    expect("https://old.reddit.com/user/ar-guetita".isRedditUrl(), true);
    expect("https://reddit.com/u/ar-guetita".isRedditUrl(), true);
  });
  test('snapchat string extensions', () {
    expect("https://www.snapchat.com/add/peterparker".isSnapchatUrl(), true);
    expect(
        "https://www.snapchat.com/add/peterparker"
            .isSnapchatUrl(user: "peterparker"),
        true);
  });

  test('stackexchange string extensions', () {
    expect(
        "https://stackexchange.com/users/12345/lorey"
            .isStackexchangeUrl(id: "12345"),
        true);
    expect(
        "https://gaming.stackexchange.com/users/12345/lorey"
            .isStackexchangeUrl(id: "12345", community: "gaming"),
        true);
  });

  test('stackoverflow string extensions', () {
    expect(
        "https://stackoverflow.com/questions/12345/how-to-embed"
            .isStackoverflowQuestionUrl(id: "12345"),
        true);
    expect(
        "https://stackoverflow.com/users/12345/lorey"
            .isStackoverflowUserUrl(id: "12345"),
        true);
  });

  test('telegram string extensions', () {
    expect(
        "https://t.me/peterparker"
            .isTelegramProfileUrl(userName: "peterparker"),
        true);
  });
  test('twitter string extensions', () {
    expect(
        "https://twitter.com/karllorey/status/1259924082067374088"
            .isTwitterStatusUrl(
                userName: "karllorey", tweetId: "1259924082067374088"),
        true);
    expect(
        "http://twitter.com/@karllorey".isTwitterUserUrl(userName: "karllorey"),
        true);
    expect(
        "http://twitter.com/karllorey".isTwitterUserUrl(userName: "karllorey"),
        true);
    expect(
        "https://twitter.com/karllorey".isTwitterUserUrl(userName: "karllorey"),
        true);
  });

  test('youtube string extensions', () {
    expect(
        "https://www.youtube.com/channel/UC3y00Z1zFPc-8Z9xg8ydC-A"
            .isYoutubeChannelUrl(id: "UC3y00Z1zFPc-8Z9xg8ydC-A"),
        true);
    expect(
        "https://www.youtube.com/user/JPPGmbH"
            .isYoutubeUserUrl(username: "JPPGmbH"),
        true);
    expect(
        "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
            .isYoutubeVideoUrl(id: "dQw4w9WgXcQ"),
        true);
    expect("https://youtu.be/dQw4w9WgXcQ".isYoutubeVideoUrl(id: "dQw4w9WgXcQ"),
        true);
    expect(
        "https://youtube.com/embed/dQw4w9WgXcQ"
            .isYoutubeVideoUrl(id: "dQw4w9WgXcQ"),
        true);
    expect(
        "https://youtube.com/watch?v=6_b7RDuLwcI"
            .isYoutubeVideoUrl(id: "6_b7RDuLwcI"),
        true);
  });
}
