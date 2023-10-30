import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = "";

loadEnv() async {
  await dotenv.load(fileName: ".env");

  baseUrl = dotenv.env['BASEURL'] ?? "";
}
