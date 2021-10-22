import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart';
import 'package:strongbolt/pages/DashboardPage.dart';

Future<String> createRoom(String roomName) async {
  var url = "https://matrix.org/_matrix/client/r0/createRoom?access_token=" +
      MyProfile.accessToken;
  var response = await post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({"room_alias_name": roomName}));

  Map data = jsonDecode(response.body);
  print("Statuscode: ${response.statusCode}");
  print("Response from API (createRoom): $data");

  return jsonDecode(response.body)["room_id"];
}

// Return all the rooms the user is invited to.
Future<Map> sync({String since = ""}) async {
  var url = "";
  Map responseData;

  if (MyProfile.syncObj.nextBatch == "") {
    url = "https://matrix.org/_matrix/client/r0/sync?access_token=" +
        MyProfile.accessToken;
  } else {
    url = "https://matrix.org/_matrix/client/r0/sync?since=" +
        since +
        "&timeout=30000&access_token=" +
        MyProfile.accessToken;
  }
  var response = await get(url);

  if (response.statusCode == 200) {
    responseData = jsonDecode(response.body);
    MyProfile.syncObj.nextBatch = responseData["next_batch"];
    print("""
Response from API (sync, ${response.statusCode}): $responseData.""");
  } else {
    print('Response from API (sync): ${response.statusCode}.');
  }

  return responseData;
}

Future<Map> getActiveRooms() async {
  Map status = await sync();
  Map activeRooms = status["rooms"]["join"];
  print("Active rooms count: ${activeRooms.length.toString()}");
  return activeRooms;
}

enum dir { b, f }
Future<Map> getMessagesByRoomId(String roomId, String from,
    {int limit = 10, dir direction = dir.b}) async {
  // A token that can be supplied to the from parameter of the rooms/{roomId}/messages endpoint.
  // ignore: unused_local_variable
  var _url = "/_matrix/client/r0/rooms/" +
      roomId +
      "/messages?from=" +
      from +
      "&dir=" +
      direction.toString() +
      "&limit=" +
      limit.toString();
  // [rooms][join][timeline][prev_batch] // String.

  Map status = await sync();
  Map activeRooms = status["rooms"]["join"];
  print("Active rooms count: ${activeRooms.length.toString()}");
  return activeRooms;
}

Future<bool> inviteUser(String userId, String roomId) async {
  var url = "https://matrix.org/_matrix/client/r0/rooms/" +
      roomId +
      "/invite?access_token=" +
      MyProfile.accessToken;
  var response = await post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({"user_id": userId}));

  Map data = jsonDecode(response.body);
  print("Statuscode: ${response.statusCode}");
  print("Response from API (inviteUser): $data");

  return response.statusCode == 200 ? true : false;
}

Future<Map> sendMessage(String roomId, String message) async {
  var url = "https://matrix.org/_matrix/client/r0/rooms/" +
      roomId +
      "/send/m.room.message?access_token=" +
      MyProfile.accessToken;
  var response = await post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({"msgtype": "m.text", "body": message}));

  print("sendMessage parameters: $roomId:$message");
  print(
      "Response from API (sendMessage, ${response.statusCode}) ${jsonDecode(response.body)}");
  return jsonDecode(response.body);
}
