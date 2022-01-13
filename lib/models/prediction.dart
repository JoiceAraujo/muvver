class Prediction {
  final String city;
  final String state;

  String get description => '$city, ${state.toUpperCase()}';

  Prediction.fromMap(Map<String, dynamic> map)
      : city = map['terms'][0]['value'],
        state = map['terms'][1]['value'];
}
