import 'dart:math';

class FakeItem {
  final String id;
  final String name;
  final int rate;

  FakeItem(this.id, this.name, this.rate);
}

class FakeRepo {
  static final List<String> _names = [
    'Amir Cormier',
    'Vladimir Spinka',
    'Rosendo Marquardt',
    'Bryon Spencer',
    'Odell Larson',
    'Easter Ortiz',
    'Wilmer Morissette',
    'Herbert Kozey',
    'Sherwood Homenick',
    'Neil Adams',
    'Dr. Luther Bernier MD',
    'Walker Hills',
    'Clinton Padberg',
    'Reyes Lowe III',
    'Ike Hickle'
  ];
  static Future<FakeItem> getItem() async {
    await Future.delayed(const Duration(seconds: 2));
    Random rnd = Random();
    var n = rnd.nextInt(_names.length - 1);
    return FakeItem('$n', _names[n], rnd.nextInt(5));
  }

  static Future<List<FakeItem>> asyncList(int count,
      [Duration duration = const Duration(seconds: 1)]) async {
    await Future.delayed(duration);
    return List.generate(count, (index) {
      Random rnd = Random();
      var n = rnd.nextInt(_names.length - 1);
      return FakeItem(index.toString(), _names[n], rnd.nextInt(5));
    });
  }

  static List<FakeItem> syncList() {
    return List.generate(10, (index) {
      Random rnd = Random();
      var n = rnd.nextInt(_names.length - 1);
      return FakeItem(index.toString(), _names[n], rnd.nextInt(5));
    });
  }
}
