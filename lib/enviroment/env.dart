import 'package:clean_arch/core/constants/app_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String get apiKey => _apiKey;
  static String _apiKey = "";

  //static final Enviroment _instance = Enviroment._();

  // factory Enviroment() {
  //   return _instance;
  // }

  Enviroment() {
    _initialize();
  }

  // Enviroment._() {
  //   _initialize();
  // }

  _initialize() async {
    await dotenv.load(fileName: AppConstants.envPath);
    _apiKey = dotenv.env['APIKEY']!;
  }
}
