import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class BaseResponse {
  static var client = http.Client();
  String baseUrl = "https://test.api.254fundi.com";

  Future makeApiCall(String method, String url,
      {Map<String, dynamic>? body, dynamic fromModel, String? token}) async {
    Uri finalUrl = Uri.parse(baseUrl + url);
    switch (method) {
      case "GET":
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        };
        var request = http.Request("GET", finalUrl);
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print('success' + token.toString());
          String jsonString = await response.stream.bytesToString();
          return fromModel(jsonString);
        } else {
          print('unsuccess' + token.toString());
          String? jsonString = response.reasonPhrase;
          Get.defaultDialog(
              title: 'Error', content: Text(response.reasonPhrase!));
          //showDialogFail("Error", jsonString);
          return null;
        }
      case "POST":
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        };
        var request = http.Request('POST', finalUrl);
        request.body = json.encode(body);
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          String jsonString = await response.stream.bytesToString();
          return fromModel(jsonString);
        } else {
          String? jsonString = response.reasonPhrase;
          Get.defaultDialog(title: 'Error', content: Text(jsonString!));
          //showDialogFail("Error", jsonString);
          return null;
        }

      case "DELETE":
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        };
        var request = http.Request('DELETE', finalUrl);
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          //showDialogSuccess("Success", "Deleted");
          Get.defaultDialog(
              title: 'Success', content: const Text('deleted succesfully'));
          break;
        } else {
          //showDialogFail("Error", response.reasonPhrase);
          Get.defaultDialog(
              title: "Error", content: Text(response.reasonPhrase!));
          break;
        }
      default:
        if (kDebugMode) {
          print("I'm not sending a GET request, $url");
        }
        break;
    }
  }
}
