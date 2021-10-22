import 'package:http/http.dart';
import "dart:convert";

// ignore: todo
// TODO: ask server for supported login types
// GET /_matrix/client/r0/login
// Gets the homeserver's supported login types to authenticate users. Clients should pick one of these and supply it as the type when logging in.
Future<Map> login(String username, String password) async {
  var url = 'https://matrix.org/_matrix/client/r0/login';
  var response = await post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        "type": "m.login.password",
        "password": password,
        "identifier": {"type": "m.id.user", "user": username},
        "initial_device_display_name": "Strongbolt application"
      }));

  print("Response from API (login): ${response.statusCode}");
  return jsonDecode(response.body);
}

// Status code 200: The account has been registered.
Future<Map> register(String username, String password) async {
  var url = 'https://matrix.org/_matrix/client/r0/register';
  var response1 = await post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({}));

  Map data1 = jsonDecode(response1.body);
  String session = data1["session"];
  // print("Response1 from API (status, register): ${response1.statusCode}");
  // print("Response1 from API (data, register): ${data1}");

  var response2 = await post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        "username": username,
        "password": password,
        "initial_device_display_name": "riot.im/app (Safari, macOS)",
        "auth": {"session": session, "type": "m.login.dummy"},
        "inhibit_login": true
      }));

  Map data2 = jsonDecode(response2.body);
  print("Response2 from API (status, register): ${response2.statusCode}");
  print("Response2 from API (data, register): $data2");

  Map loginData = await login(username, password);
  print("Login response from API: $loginData");

  return jsonDecode(response2.body);
}
