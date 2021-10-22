import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:strongbolt/pages/MessagePage.dart';

class RoomGroup extends StatelessWidget {
  final String roomId; // Unique ID of the room.
  final String roomAlias; // UserID chatting with.
  final String prevBatch;
  RoomGroup(
      {@required this.roomAlias,
      @required this.roomId,
      @required this.prevBatch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: <Widget>[
          // Adobe XD layer: 'RoomNameLabel' (shape)
          SvgPicture.string(
            _shapeSVG_66b3662db903461fbc1b827c7663227a,
            allowDrawingOutsideViewBox: true,
          ),
          Transform.translate(
            offset: Offset(79.0, 26.0),
            child:
                // Adobe XD layer: 'ContentLabel' (text)
                SizedBox(
              width: 216.0,
              height: 33.0,
              child: SingleChildScrollView(
                  child: Text(
                roomAlias,
                style: TextStyle(
                  fontSize: 10,
                  color: const Color(0xffe8e8e8),
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
                textAlign: TextAlign.left,
              )),
            ),
          ),
          Transform.translate(
            offset: Offset(305.0, 27.0),
            child:
                // Adobe XD layer: 'TimeLabel' (text)
                GestureDetector(
              onTap: () {
                Chat chat = Chat(roomAlias: roomAlias, roomId: roomId);
                MessagePage messagePage = MessagePage(chat: chat);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => messagePage));
              },
              child: Text(
                '18:00 AM',
                style: TextStyle(
                  fontSize: 10,
                  color: const Color(0xffb2b2b2),
                  fontWeight: FontWeight.w700,
                  height: 1.8,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 11.0),
            child:
                // Adobe XD layer: 'ProfilePicture' (shape)
                Container(
              width: 56.0,
              height: 51.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(28.0, 25.5)),
                image: DecorationImage(
                  image: const AssetImage('assets/images/avatar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(79.0, 15.0),
            child:
                // Adobe XD layer: 'ContentLabel' (text)
                SizedBox(
              width: 216.0,
              height: 14.0,
              child: SingleChildScrollView(
                  child: Text(
                roomAlias,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xffe8e8e8),
                  letterSpacing: 0.14,
                  fontWeight: FontWeight.w700,
                  height: 0.8571428571428571,
                ),
                textAlign: TextAlign.left,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

const String _shapeSVG_66b3662db903461fbc1b827c7663227a =
    '<svg viewBox="0.0 0.0 365.6 73.0" ><path  d="M 22.95041084289551 0 L 342.6490478515625 0 C 355.32421875 0 365.5994873046875 8.954304695129395 365.5994873046875 20 L 365.5994873046875 53 C 365.5994873046875 64.04569244384766 355.32421875 73 342.6490478515625 73 L 22.95041084289551 73 C 10.27524852752686 73 0 64.04569244384766 0 53 L 0 20 C 0 8.954304695129395 10.27524852752686 0 22.95041084289551 0 Z" fill="#6a6a6a" fill-opacity="0.45" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
