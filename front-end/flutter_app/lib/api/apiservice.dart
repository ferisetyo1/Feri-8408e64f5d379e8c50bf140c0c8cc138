import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/models/index.dart';
import 'package:http/http.dart';

class ApiService {
  final String baseUrl = "http://192.168.0.108:80/apiservice/c_user";
  Client client = Client();

  Future<Customrespon> resgister(Map<String,dynamic> map) async {
    final response = await client.post(
      "$baseUrl/register",
      headers: {"content-type": "application/json"},
      body: (jsonEncode(map)),
    );
    if (response.statusCode == 201) {
      final Map parsed = json.decode(response.body);
      return Customrespon.fromJson(parsed);
    } else {
      return null;
    }
  }

  Future<Customrespon> login(Map<String,dynamic> map) async {
    final response = await client.post(
      "$baseUrl/login",
      headers: {"content-type": "application/json"},
      body: (jsonEncode(map)),
    );
    if (response.statusCode == 201) {
      final Map parsed = json.decode(response.body);
      return Customrespon.fromJson(parsed);
    } else {
      return null;
    }
  }
  Future<Customrespon> myinfo(Map<String,dynamic> map) async {
    final response = await client.post(
      "$baseUrl/myinfo",
      headers: {"content-type": "application/json"},
      body: (jsonEncode(map)),
    );
    log(response.body);
    if (response.statusCode == 201) {
      final Map parsed = json.decode(response.body);
      return Customrespon.fromJson(parsed);
    } else {
      return null;
    }
  }

}
