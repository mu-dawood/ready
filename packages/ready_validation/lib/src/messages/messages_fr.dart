import 'package:intl/intl.dart' as intl;
import 'messages.dart';

/// The translations for French (`fr`).
class ReadyValidationMessagesFr extends ReadyValidationMessages {
  ReadyValidationMessagesFr([String locale = 'fr']) : super(locale);

  @override
  String contains(String value, String res) {
    return 'Le texte doit contenir $res';
  }

  @override
  String containsItem(Iterable value, dynamic res) {
    return 'La liste doit contenir $res';
  }

  @override
  String endsWith(String value, String res) {
    return 'Le texte doit se terminer par $res';
  }

  @override
  String equal(dynamic value) {
    return 'Seule la valeur $value est autorisée.';
  }

  @override
  String greaterThan(bool equal, num value, num min) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'ou égal à', 'autre': '', 'other': ''},
        desc: 'No description provided in @greaterThan');

    return 'La valeur doit être supérieure à, ${selectString}';
  }

  @override
  String hasLength(String value, int length) {
    return 'Vous devez saisir un texte de $length caractères';
  }

  @override
  String hasMaxLength(String value, int max) {
    return 'Le texte ne doit pas dépasser $max';
  }

  @override
  String hasMinLength(String value, int min) {
    return 'La longueur du texte doit être d\'au moins $min';
  }

  @override
  String hasRange(String value, int min, int max) {
    return 'Vous devez saisir un texte d\'une longueur non inférieure à $min et non supérieure à $max';
  }

  @override
  String invalidAngelCompanyUrl(String value, String company) {
    final String selectString = intl.Intl.select(
        company, {'_': ' url ', 'other': ' avec nom: ${company}'},
        desc: 'No description provided in @invalidAngelCompanyUrl');

    return 'Pardon! vous devez entrer une société providentielle valide $selectString .';
  }

  @override
  String invalidAngelJobUrl(String value, String jobId) {
    final String selectString = intl.Intl.select(
        jobId, {'_': ' url ', 'other': ' avec identifiant: ${jobId}'},
        desc: 'No description provided in @invalidAngelJobUrl');

    return 'Pardon! vous devez saisir un job providentiel valide $selectString .';
  }

  @override
  String invalidCrunchbaseOrganizationUrl(String value, String organization) {
    final String selectString = intl.Intl.select(
        organization, {'_': ' url ', 'other': ' avec nom: ${organization}'},
        desc: 'No description provided in @invalidCrunchbaseOrganizationUrl');

    return 'Pardon! vous devez entrer une organisation crunchbase valide $selectString .';
  }

  @override
  String invalidCrunchbasePersonUrl(String value, String person) {
    final String selectString = intl.Intl.select(
        person, {'_': ' url ', 'other': ' avec nom: ${person}'},
        desc: 'No description provided in @invalidCrunchbasePersonUrl');

    return 'Pardon! vous devez entrer une personne crunchbase valide $selectString .';
  }

  @override
  String invalidFacebookUrl(String value, String name, String id) {
    final String selectString = intl.Intl.select(
        name,
        {
          '_': '{id, select, _{ url ',
          'other': ' user avec identifiant: ${id}',
          'other': ' user avec nom: ${name}'
        },
        desc: 'No description provided in @invalidFacebookUrl');

    return 'Pardon! vous devez entrer un $selectString .';
  }

  @override
  String invalidGitHubUrl(String value, String user, String repository) {
    final String selectString = intl.Intl.select(
        user,
        {
          '_': '{repository, select, _{ url ',
          'other': ' repository: $repository',
          'other': ' user avec nom: $user {repository, select, _{',
          'other': ' et dépôt : ${repository}'
        },
        desc: 'No description provided in @invalidGitHubUrl');

    return 'Pardon! vous devez saisir un gitHub $selectString .';
  }

  @override
  String invalidGooglePlusUrl(String value, String userName, String id) {
    final String selectString = intl.Intl.select(userName,
        {'_': ' url ', 'other': ' avec le nom d\'utilisateur : ${userName}'},
        desc: 'No description provided in @invalidGooglePlusUrl');

    return 'Pardon! vous devez entrer un google plus valide $selectString .';
  }

  @override
  String invalidHackerNewsItemUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' avec identifiant: ${id}'},
        desc: 'No description provided in @invalidHackerNewsItemUrl');

    return 'Pardon! vous devez saisir un article de hacker valide $selectString .';
  }

  @override
  String invalidHackerNewsUserUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' avec identifiant: ${id}'},
        desc: 'No description provided in @invalidHackerNewsUserUrl');

    return 'Pardon! vous devez saisir un utilisateur de hacker news valide $selectString .';
  }

  @override
  String invalidInstagramUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' url ', 'other': ' avec l\'utilisateur: ${user}'},
        desc: 'No description provided in @invalidInstagramUrl');

    return 'Pardon! vous devez entrer un instagram valide $selectString .';
  }

  @override
  String invalidLinkedInCompanyUrl(String value, String permalink) {
    return 'Pardon! vous devez entrer un lien valide dans l\'url de l\'entreprise. $permalink';
  }

  @override
  String invalidLinkedInPostUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' avec identifiant: ${id}'},
        desc: 'No description provided in @invalidLinkedInPostUrl');

    return 'Pardon! vous devez saisir un lien valide dans la publication ${selectString}';
  }

  @override
  String invalidLinkedInProfileUrl(String value, String permalink) {
    return 'Pardon! vous devez saisir une URL de profil liée valide. $permalink';
  }

  @override
  String invalidMediumPostUrl(String value, String postId) {
    final String selectString = intl.Intl.select(
        postId, {'_': ' url ', 'other': ' avec identifiant: ${postId}'},
        desc: 'No description provided in @invalidMediumPostUrl');

    return 'Pardon! vous devez saisir une publication de support valide $selectString .';
  }

  @override
  String invalidMediumUserUrl(String value, String userName, String id) {
    final String selectString = intl.Intl.select(
        userName,
        {
          '_': '{id, select, _{ url ',
          'other': ' avec identifiant: ${id}',
          'other': ' avec l\'utilisateur name: ${userName}'
        },
        desc: 'No description provided in @invalidMediumUserUrl');

    return 'Pardon! vous devez saisir un utilisateur de support valide $selectString .';
  }

  @override
  String invalidRedditUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' url ', 'other': ' avec l\'utilisateur: ${user}'},
        desc: 'No description provided in @invalidRedditUrl');

    return 'Pardon! vous devez entrer un reddit valide $selectString .';
  }

  @override
  String invalidSnapchatUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' url ', 'other': ' avec l\'utilisateur: ${user}'},
        desc: 'No description provided in @invalidSnapchatUrl');

    return 'Pardon! vous devez saisir un snapchat valide $selectString .';
  }

  @override
  String invalidStackexchangeUrl(String value, String user, String id) {
    final String selectString = intl.Intl.select(
        user,
        {
          '_': '{id, select, _{ url ',
          'other': ' avec identifiant: ${id}',
          'other': ' avec l\'utilisateur name: ${user}'
        },
        desc: 'No description provided in @invalidStackexchangeUrl');

    return 'Pardon! vous devez entrer un stackexchange valide $selectString .';
  }

  @override
  String invalidStackoverflowQuestionUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' avec identifiant: ${id}'},
        desc: 'No description provided in @invalidStackoverflowQuestionUrl');

    return 'Pardon! vous devez saisir une question stackoverflow valide $selectString .';
  }

  @override
  String invalidStackoverflowUserUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' avec identifiant: ${id}'},
        desc: 'No description provided in @invalidStackoverflowUserUrl');

    return 'Pardon! vous devez entrer un utilisateur stackoverflow valide $selectString .';
  }

  @override
  String invalidTelegramProfileUrl(String value, String userName) {
    final String selectString = intl.Intl.select(userName,
        {'_': ' url ', 'other': ' avec le nom d\'utilisateur : ${userName}'},
        desc: 'No description provided in @invalidTelegramProfileUrl');

    return 'Pardon! vous devez entrer un profil de télégramme valide $selectString .';
  }

  @override
  String invalidTwitterStatusUrl(
      String value, String userName, String tweetId) {
    final String selectString = intl.Intl.select(
        tweetId,
        {
          '_': ' url ',
          'other': ' avec identifiant: ${tweetId}',
          '_': '',
          'other': ' avec l\'utilisateur name: ${userName}'
        },
        desc: 'No description provided in @invalidTwitterStatusUrl');

    return 'Pardon! vous devez saisir un statut Twitter valide $selectString .';
  }

  @override
  String invalidTwitterUserUrl(String value, String userName) {
    final String selectString = intl.Intl.select(userName,
        {'_': ' url ', 'other': ' avec l\'utilisateur name: ${userName}'},
        desc: 'No description provided in @invalidTwitterUserUrl');

    return 'Pardon! vous devez saisir un utilisateur Twitter valide $selectString .';
  }

  @override
  String invalidYoutubeChannelUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' avec identifiant: ${id}'},
        desc: 'No description provided in @invalidYoutubeChannelUrl');

    return 'Pardon! vous devez saisir une chaîne youtube valide $selectString .';
  }

  @override
  String invalidYoutubeUserUrl(String value, String userName) {
    final String selectString = intl.Intl.select(userName,
        {'_': ' url ', 'other': ' avec l\'utilisateur name: ${userName}'},
        desc: 'No description provided in @invalidYoutubeUserUrl');

    return 'Pardon! vous devez saisir un utilisateur youtube valide $selectString .';
  }

  @override
  String invalidYoutubeVideoUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' avec identifiant: ${id}'},
        desc: 'No description provided in @invalidYoutubeVideoUrl');

    return 'Pardon! vous devez entrer une vidéo youtube valide $selectString .';
  }

  @override
  String isAfter(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'ou égal à', 'other': ''},
        desc: 'No description provided in @isAfter');

    return 'Vous devez entrer une date ultérieure ${selectString}';
  }

  @override
  String isBefore(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'ou égal à', 'other': ''},
        desc: 'No description provided in @isBefore');

    return 'Vous devez entrer une date antérieure ${selectString}';
  }

  @override
  String isBetween(bool equal, num value, num min, num max) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'ou égal', 'other': ''},
        desc: 'No description provided in @isBetween');

    return 'La valeur doit être ${selectString}';
  }

  @override
  String isCreditCard(String value) {
    return 'Vous devez entrer le numéro de carte de crédit';
  }

  @override
  String isDateBetween(bool equal, DateTime value, DateTime min, DateTime max) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'ou égal à un', 'other': ''},
        desc: 'No description provided in @isDateBetween');

    return 'Vous devez entrer une date ${selectString}';
  }

  @override
  String isDateTime(Object value) {
    return 'Vous devez entrer une date valide';
  }

  @override
  String isDecimal(Object value) {
    return 'Vous devez entrer un nombre décimal';
  }

  @override
  String isDivisibleBy(num value, num division) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat divisionNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String divisionString = divisionNumberFormat.format(division);

    return 'La valeur d\'entrée doit être divisible par $divisionString';
  }

  @override
  String isEmail(String value) {
    return 'Vous devez entrer un email valide';
  }

  @override
  String isEven(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'La valeur doit être un nombre pair';
  }

  @override
  String isIn(dynamic value, Iterable list) {
    return 'La valeur saisie doit faire partie de la {liste}';
  }

  @override
  String isInteger(Object value) {
    return 'Vous devez saisir un numéro valide';
  }

  @override
  String isNegative(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'La valeur doit être négative';
  }

  @override
  String isNotIn(dynamic value, Iterable list) {
    return 'La valeur saisie ne doit pas être dans $list';
  }

  @override
  String isNumber(Object value) {
    return 'Vous devez saisir un numéro valide';
  }

  @override
  String isOdd(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'La valeur doit être un nombre impair';
  }

  @override
  String isPositive(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'La valeur doit être positive';
  }

  @override
  String isTimeOfDay(Object value) {
    return 'Vous devez saisir une heure valide';
  }

  @override
  String lessThan(bool equal, num value, num max) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'ou égal à', 'autre': '', 'other': ''},
        desc: 'No description provided in @lessThan');

    return 'La valeur doit être inférieure à, ${selectString}';
  }

  @override
  String listHasLength(Iterable value, int length) {
    return 'Le nombre d\'éléments doit être égal à $length';
  }

  @override
  String listMaxLength(Iterable value, int max) {
    return 'Le nombre d\'articles ne doit pas dépasser $max';
  }

  @override
  String listMinLength(Iterable value, int min) {
    return 'Le nombre d\'articles ne doit pas être inférieur à $min';
  }

  @override
  String listRange(Iterable value, int min, int max) {
    return 'Le nombre d\'articles doit être d\'au moins ${min}et pas plus de $max';
  }

  @override
  String notContainsItem(Iterable value, dynamic res) {
    return 'La liste ne doit pas nécessairement contenir $res';
  }

  @override
  String get notEmpty => 'Une valeur vide ne doit pas être saisie';

  @override
  String notEqual(dynamic value) {
    return 'Non autorisé à entrer $value';
  }

  @override
  String get regexp => 'Le format demandé n’est pas compatible avec l’entrée';

  @override
  String get required => 'Excuse-moi! Ce champ est requis';

  @override
  String startsWith(String value, String res) {
    return 'Le texte doit commencer par $res';
  }
}
