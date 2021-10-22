import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414.0,
      height: 896.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.88, -0.97), //-0.88, -0.97
          end: Alignment(0.94, 0.97),
          colors: [
            const Color(0xff3d4151),
            const Color(0xff1c202c),
            const Color(0xff141824)
          ],
          stops: [0.0, 0.384, 1.0],
        ),
      ),
    );
  }
}
