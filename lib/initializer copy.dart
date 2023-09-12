import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/core/values/environment.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      await _initEnvironment();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initEnvironment() async {
    await dotenv.load(fileName: Environment.fileName);
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
