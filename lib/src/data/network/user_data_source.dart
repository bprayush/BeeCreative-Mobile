import 'dart:convert';

import 'package:BeeCreative/src/data/models/user/user_error.dart';
import 'package:BeeCreative/src/data/models/user/user_model.dart';
import 'package:BeeCreative/src/data/network/api_call.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'dart:async';

class UserDataSource {
  final http.Client client;

  UserDataSource(this.client);

  Future<User> requestLogin(
      {@required String token, String notificationToken}) async {
    final url = ApiURL.login;
    final encodedUrl = Uri.encodeFull(url);
    // print(notificationToken);
    final response = await client.post(encodedUrl, body: {
      'token': token,
    });
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Unauthenticated();
    } else {
      throw UserError(
        "Received response: ${json.decode(response.body)['error']} code: ${json.decode(response.body)['code']}",
      );
    }
  }

  Future<User> emailLogin({
    @required String email,
    @required String password,
  }) async {
    final url = ApiURL.emailLogin;
    final encodedUrl = Uri.encodeFull(url);
    final response = await client.post(
      encodedUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Unauthenticated();
    } else {
      throw UserError(
        "Received response: ${json.decode(response.body)['error']} code: ${json.decode(response.body)['code']}",
      );
    }
  }

  Future<String> requestLogout({@required String token}) async {
    final url = ApiURL.logout;
    final encodedUrl = Uri.encodeFull(url);
    final response = await client.post(
      encodedUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 401) {
      throw Unauthenticated();
    } else {
      throw UserError(response.body);
    }
  }
}
