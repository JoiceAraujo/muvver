import 'package:flutter/foundation.dart';

class ApiHost {
  static const String _apiKey = 'AIzaSyAHLKjXh4RAge3yV_zg66jz2aX-d8MEamI';

  static String get baseUrl {
    if (kDebugMode) {
      return 'https://maps.googleapis.com';
    } else {
      return 'https://maps.googleapis.com';
    }
  }

  static Map<String, dynamic> get authenticationParams {
    return <String, dynamic>{'key': _apiKey};
  }
}
