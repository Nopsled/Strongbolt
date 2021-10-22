import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:random_string/random_string.dart';
import 'package:strongbolt/api/communication.dart';
import 'package:strongbolt/components/RoomGroup.dart';
import 'package:strongbolt/pages/DashboardPage.dart';

// ignore: must_be_immutable
class HeaderDashboardGroup2 extends StatelessWidget {
  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  TextEditingController controller =
      TextEditingController(text: "@erik999:matrix.org");

  final VoidCallback onNewRoom;
  HeaderDashboardGroup2({@required this.onNewRoom});

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: <Widget>[
            SvgPicture.string(
              _shapeSVG_3b16a48b55c24796b63673805c5116bc,
              allowDrawingOutsideViewBox: true,
            ),
            TextField(
              controller: controller,
              cursorColor: Colors.white,
              maxLines: 1,
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Username (@username:matrix.org)...",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white)),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Transform.translate(
              offset: Offset(323.0, 16.0),
              child: GestureDetector(
                onTap: () async {
                  // Create new room with user from controller.
                  String userId = controller.text;
                  String roomAlias = randomString(12);
                  String roomId = await createRoom(roomAlias);

                  // Check if room already exist, if not, create it.
                  if (roomId != null) {
                    // Invite user to room.
                    final invitedSuccess = await inviteUser(userId, roomId);

                    // Check if response is 200.
                    if (invitedSuccess) {
                      RoomGroup newRoom =
                          // ignore: missing_required_param
                          new RoomGroup(roomId: roomId, roomAlias: roomAlias);
                      MyProfile.roomList.add(newRoom);
                      // Update ÚI of dashboard.
                      onNewRoom();
                      _showToast(context, "Chat started with user.");
                    } else {
                      _showToast(context,
                          "Could not start chat with user due to unknown error.");
                    }
                  }
                },
                child: SvgPicture.string(
                  _shapeSVG_1aa67d5c43b94569b647b6b6f830164c,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _shapeSVG_3b16a48b55c24796b63673805c5116bc =
    '<svg viewBox="0.0 0.0 365.6 56.0" ><path  d="M 26.79786682128906 0 L 338.8016052246094 0 C 353.6016540527344 0 365.5994873046875 12.53602600097656 365.5994873046875 28 C 365.5994873046875 43.46397399902344 353.6016540527344 56 338.8016052246094 56 L 26.79786682128906 56 C 11.99781227111816 56 0 43.46397399902344 0 28 C 0 12.53602600097656 11.99781227111816 0 26.79786682128906 0 Z" fill="#474a4d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _shapeSVG_1aa67d5c43b94569b647b6b6f830164c =
    '<svg viewBox="323.0 16.0 28.6 24.5" ><path transform="translate(321.0, 13.0)" d="M 2.013611078262329 27.5 L 30.58333587646484 15.25000190734863 L 2.013611078262329 3.000000476837158 L 2 12.52777862548828 L 22.41666984558105 15.25000190734863 L 2 17.97222328186035 L 2.013611078262329 27.5 Z" fill="#e8e8e8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
