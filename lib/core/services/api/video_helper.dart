import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:videoapplication/core/core.dart';

import 'package:videoapplication/src/video/video.dart';
import 'package:http/http.dart' as http;

class VideoHelper {
  Future<VideoModel> fetchVideoList() async {
    Uri api = Uri.parse("$baseUrl/db");
    debugPrint("API => $api");
    try {
      http.Response response = await http.get(api);

      return VideoModel.fromJson(jsonDecode(response.body));
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return VideoModel.withError("Failed to fetch data.", []);
    }
  }
}
