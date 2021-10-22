import 'package:flutter/material.dart';

class MessageRecievedGroup extends StatelessWidget {
  final String message;
  final String time;
  MessageRecievedGroup({this.message, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(58.0, 0.0),
            child:
                // Adobe XD layer: 'Background' (shape)
                Container(
              width: 323.0,
              height: 97.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: const Color(0xff3d414d),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(74.0, 14.67),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 15,
                color: const Color(0xffffffff),
                height: 1.4666666666666666,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(74.0, 66.0),
            child:
                // Adobe XD layer: 'DateTimeLabel' (text)
                Text(
              time,
              style: TextStyle(
                fontSize: 13,
                color: const Color(0xffffffff),
                letterSpacing: 0.0010399999767541886,
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 57.0),
            child:
                // Adobe XD layer: 'Picture' (shape)
                Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                image: DecorationImage(
                  image: const AssetImage('assets/images/avatar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
