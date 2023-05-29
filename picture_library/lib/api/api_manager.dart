import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/constants.dart';

enum APIType {
  tPost,
  tGet,
  tPut,
}

class API {
  static Future<dynamic> callAPI({
    required String url,
    required APIType type,
    Map<String, dynamic>? body,
  }) async {
    try {
      log("URL ==> $url");
      log("TYPE ==> $type");
      HttpClient httpClient = HttpClient();
      if (type == APIType.tPost) {
        assert(body != null);
        log("BODY ==> $body");

        HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
        request.headers
            .add('Authorization', 'Client-ID ${Constants.accessKey}');
        request.add(utf8.encode(json.encode(body)));
        HttpClientResponse response = await request.close();
        if (response.statusCode == 200) {
          String json = await response.transform(utf8.decoder).join();
          log("RESPONSE ==> ${jsonDecode(json)}");

          return jsonDecode(json);
        } else {
          debugPrint("Http error: ${response.statusCode}");
          return [];
        }
      } else if (type == APIType.tGet) {
        HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
        request.headers
            .add('Authorization', 'Client-ID ${Constants.accessKey}');

        HttpClientResponse response = await request.close();
        if (response.statusCode == 200) {
          String json = await response.transform(utf8.decoder).join();
          log("RESPONSE ==> ${jsonDecode(json)}");

          return jsonDecode(json);
        } else {
          debugPrint("Http error: ${response.statusCode}");
          return [];
        }
      }
    } catch (e) {
      debugPrint("ERROR ===> $e");
      return null;
    }
  }
}
