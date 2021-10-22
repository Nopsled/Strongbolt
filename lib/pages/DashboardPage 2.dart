import 'dart:async';
import 'package:flutter/material.dart';
import 'package:strongbolt/components/Background.dart';
import 'package:strongbolt/components/HeaderDashboardGroup2.dart';
import 'package:strongbolt/components/RoomGroup.dart';
import "package:strongbolt/api/communication.dart";

class Room {
  String roomId;
  String roomAlias;
  String roomContent;
  Room({this.roomId, this.roomAlias, this.roomContent});
}

class Sync {
  String nextBatch =
      ""; // Required. The batch token to supply in the since param of the next /sync request.
  Rooms rooms; // Updates to rooms.
  // Presence presence;
  // AccountData accountData;
  // ToDevice toDevice;
  // DeviceLists deviceLists;
  // OneTimeKeysCount deviceOneTimeKeysCount;

}

class JoinedRoom {
  // RoomSummary summary;
  // State state;
  static Timeline timeline;
  // Ephemeral ephemeral;
  // AccountData accountData;
  // UnreadNotifications unreadNotificationCounts;
}

class Rooms {
  static JoinedRoom joinedRooms;
  // InvitedRooms invitedRooms;
  // LeftRooms leftRooms;
}

class Timeline {
  // RoomEvent events;
  static bool
      limited; // True if the number of events returned was limited by the limit on the filter.
  static String
      prevBatch; // A token that can be supplied to the from parameter of the rooms/{roomId}/messages endpoint.
}

class MyProfile {
  static Sync syncObj = new Sync();
  static String userId = "";
  static String accessToken = "";
  static List<RoomGroup> roomList = [];
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void refresh() {
    setState(() {});
  }

  // Long polling the API each 30 seconds.
  Timer longPolling = new Timer(new Duration(seconds: 10), () async {
    // ignore: unused_local_variable
    Map responseData = await sync(since: MyProfile.syncObj.nextBatch);
    print("Timer ran!");
  });

  void init() async {
    // Get all active rooms for the user.
    // ignore: unused_local_variable
    Map responseData = await sync();
    //MyProfile.syncObj.rooms.joinedRooms.timeline.prevBatch =
    //    responseData["rooms"]["join"]["timeline"]["prev_batch"];

    print("Next batch: ${MyProfile.syncObj.nextBatch}");
    //print("Prev batch: ${responseData["rooms"]["join"][0]}");
    //print(
    //   "Prev batch: ${MyProfile.syncObj.rooms.joinedRooms.timeline.prevBatch}");

    // Append all the rooms to the UI.
    //responseData["rooms"]["join"].forEach((key, value) {
    //RoomGroup room = RoomGroup();
    //MyProfile.roomList.add(room);
    //});

    // Refresh the UI.
    refresh();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyProfile.userId),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Background(),
            Column(
              children: <Widget>[
                HeaderDashboardGroup2(onNewRoom: refresh),
                SizedBox(height: 32.0),
                ...MyProfile.roomList.toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
