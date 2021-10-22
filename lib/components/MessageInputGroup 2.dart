import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:strongbolt/api/communication.dart';

// ignore: must_be_immutable
class MessageInputGroup extends StatelessWidget {
  // ignore: unused_element
  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  final VoidCallback onNewMessage;
  TextEditingController messageController =
      TextEditingController(text: "Message to send...");
  String roomId;
  String roomAlias; // Chatting with.

  MessageInputGroup(
      {@required this.onNewMessage,
      @required this.roomAlias,
      @required this.roomId});

  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SvgPicture.string(
              _shapeSVG_3b16a48b55c24796b63673805c5116bc,
              allowDrawingOutsideViewBox: true,
            ),
            TextField(
              controller: messageController,
              cursorColor: Colors.white,
              maxLines: 1,
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white)),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Transform.translate(
              offset: Offset(0.0, 0.0),
              child: GestureDetector(
                onTap: () async {
                  // Send message to room.
                  // ignore: unused_local_variable
                  final messageResponse =
                      await sendMessage(roomId, messageController.text);

                  // Clear controller.
                  messageController.text = "";
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
