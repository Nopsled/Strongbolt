import 'package:strongbolt/components/Background.dart';
import "package:strongbolt/api/user.dart";
import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:strongbolt/pages/DashboardPage.dart';
import 'package:strongbolt/pages/LockscreenPage.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController _usernameController =
      TextEditingController(text: "erik30");
  TextEditingController _passwordController =
      TextEditingController(text: "Sommartider2020!!");

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.97, 1.04),
            child:
                // Adobe XD layer: 'LoginPage' (group)
                BlendMask(
              blendMode: BlendMode.srcOver,
              opacity: 1,
              region: Offset(0.0, 0.0) & Size(414.0, 897.0),
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(-0.97, -1.04),
                    child: Background(),
                  ),
                  Transform.translate(
                    offset: Offset(47.0, 743.85),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.SlideLeft,
                          duration: 0.2,
                          ease: Curves.easeOut,
                          pageBuilder: () => LockscreenPage(),
                        ),
                      ],
                      child:
                          // Adobe XD layer: 'TouchItButton' (group)
                          ButtonTouchID(),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(47.0, 655.85),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          duration: 0.2,
                          ease: Curves.easeIn,
                        ),
                      ],
                      child: GestureDetector(
                        onTap: () async {
                          Map loginResponse = await login(
                              _usernameController.text,
                              _passwordController.text);
                          print("Login response: $loginResponse");

                          if (loginResponse["error"] != "Invalid password") {
                            MyProfile.userId = loginResponse["user_id"];
                            MyProfile.accessToken =
                                loginResponse["access_token"];

                            Navigator.pushReplacementNamed(
                                context, "/dashboard");
                          } else {
                            _scaffoldKey.currentState.showSnackBar(new SnackBar(
                              duration: Duration(seconds: 2),
                              content: new Row(
                                children: <Widget>[
                                  new Text(
                                      "Invalid username or password, try again.")
                                ],
                              ),
                            ));
                          }
                        },
                        child: Button(),
                      ),
                    ),
                  ),
                  TextFieldPassword(passwordController: _passwordController),
                  TextFieldInput(usernameController: _usernameController),
                  Logotype(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonTouchID extends StatelessWidget {
  const ButtonTouchID({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(0.0, 0.0),
          child: Container(
            width: 318.6,
            height: 73.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xff282c3a),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(58.0, 27.0),
          child:
              // Adobe XD layer: 'Menu' (text)
              SizedBox(
            width: 212.0,
            child: Text(
              'Sign in with Touch ID',
              style: TextStyle(
                fontSize: 19,
                color: const Color(0xffd0dbe6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(0.0, 0.0),
          child: Container(
            width: 318.6,
            height: 73.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xff282c3a),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(126.0, 27.0),
          child: SizedBox(
            width: 76.0,
            child: Text(
              'Sign in!',
              style: TextStyle(
                fontSize: 19,
                color: const Color(0xffd0dbe6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    Key key,
    @required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(47.0, 410.85),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _passwordController,
            cursorColor: Colors.white,
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Enter password...",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white)),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        width: 318.6,
        height: 73.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xff282c3a),
        ),
      ),
    );
  }
}

class Logotype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(78.03, 79.63),
      child:
          // Adobe XD layer: 'Title' (text)
          SizedBox(
        width: 256.0,
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 87,
            color: const Color(0xffffffff),
            letterSpacing: 2.1750000000000003,
            fontWeight: FontWeight.w700,
            height: 1.2873563218390804,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    Key key,
    @required TextEditingController usernameController,
  })  : _usernameController = usernameController,
        super(key: key);

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(47.0, 324.85),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _usernameController,
            cursorColor: Colors.white,
            maxLines: 1,
            obscureText: false,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Enter username...",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white)),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        width: 318.6,
        height: 73.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xff282c3a),
        ),
      ),
    );
  }
}
