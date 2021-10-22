import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderChatGroup extends StatelessWidget {
  final String roomAlias;
  HeaderChatGroup({this.roomAlias});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(260.55, 1.81),
          child:
              // Adobe XD layer: 'UserProfile' (group)
              Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(0.0, 0.0),
                child: Container(
                  width: 31.0,
                  height: 31.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(15.5, 15.5)),
                    color: const Color(0xff3c435d),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(8.76, 8.61),
                child:
                    // Adobe XD layer: 'profile' (shape)
                    SvgPicture.string(
                  _shapeSVG_58d16f21910a4c5fb449a0e246207ed1,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(100.8, 24.5),
          child:
              // Adobe XD layer: 'UserStatusLabel' (text)
              Text(
            'Online now',
            style: TextStyle(
              fontSize: 12,
              color: const Color(0xff9f9f9f),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(78.8, 1.5),
          child:
              // Adobe XD layer: 'UsernameLabel' (text)
              Text(
            roomAlias,
            style: TextStyle(
              fontSize: 16,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(0.0, 0.0),
          child: SvgPicture.string(
            _shapeSVG_75695fee174b421991fa0d4531a7b8e2,
            allowDrawingOutsideViewBox: true,
          ),
        ),
      ],
    );
  }
}

const String _shapeSVG_58d16f21910a4c5fb449a0e246207ed1 =
    '<svg viewBox="8.8 8.6 13.4 13.4" ><path transform="translate(8.76, 8.61)" d="M 0 13.4146842956543 L 0.1008753925561905 12.71358394622803 C 0.4911233186721802 10.01402378082275 3.331251859664917 7.978033065795898 6.707109451293945 7.978033065795898 C 10.08343124389648 7.978033065795898 12.92309761047363 10.01402378082275 13.31380844116211 12.71358394622803 L 13.4146842956543 13.4146842956543 L 0 13.4146842956543 Z M 1.510456919670105 12.18647384643555 L 11.9042272567749 12.18647384643555 C 11.24611377716064 10.44588851928711 9.153424263000488 9.20616626739502 6.707109451293945 9.20616626739502 C 4.261259078979492 9.20616626739502 2.169034242630005 10.44588851928711 1.510456919670105 12.18647384643555 Z M 2.945034503936768 3.724770307540894 C 2.945034503936768 1.670666694641113 4.632750511169434 0 6.707109451293945 0 C 8.78193473815918 0 10.46922302246094 1.670666694641113 10.46922302246094 3.724770307540894 C 10.46922302246094 5.779334545135498 8.78193473815918 7.450077533721924 6.707109451293945 7.450077533721924 C 4.632750511169434 7.450077533721924 2.945034503936768 5.779334545135498 2.945034503936768 3.724770307540894 Z M 4.185340404510498 3.724770307540894 C 4.185340404510498 5.10202693939209 5.316323280334473 6.221867561340332 6.707109451293945 6.221867561340332 C 8.097469329833984 6.221867561340332 9.228878021240234 5.10202693939209 9.228878021240234 3.724770307540894 C 9.228878021240234 2.348511934280396 8.097469329833984 1.227749824523926 6.707109451293945 1.227749824523926 C 5.316323280334473 1.227749824523926 4.185340404510498 2.348511934280396 4.185340404510498 3.724770307540894 Z" fill="#d0dbe6" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _shapeSVG_75695fee174b421991fa0d4531a7b8e2 =
    '<svg viewBox="0.0 0.0 16.5 28.9" ><path transform="translate(-11.25, -6.19)" d="M 16.2326831817627 20.6440258026123 L 27.1707763671875 9.714539527893066 C 27.9797306060791 8.905586242675781 27.9797306060791 7.597488880157471 27.1707763671875 6.797141551971436 C 26.36182022094727 5.988187313079834 25.05372619628906 5.996793270111084 24.24477195739746 6.797141551971436 L 11.85228252410889 19.1810245513916 C 11.06914615631104 19.96415901184082 11.05193519592285 21.22062110900879 11.79204082489014 22.02957344055176 L 24.23616600036621 34.49951553344727 C 24.64064407348633 34.90399169921875 25.17420959472656 35.10192489624023 25.69916915893555 35.10192489624023 C 26.2241268157959 35.10192489624023 26.75769424438477 34.90399169921875 27.16217041015625 34.49951553344727 C 27.97112655639648 33.69055938720703 27.97112655639648 32.38246536254883 27.16217041015625 31.58211708068848 L 16.2326831817627 20.6440258026123 Z" fill="#d0dbe6" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
