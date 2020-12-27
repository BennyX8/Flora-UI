import 'package:flora/pages/auth/login_screen.dart';
import 'package:flora/pages/auth/register.dart';
import 'package:flora/utils/color.dart';
import 'package:flora/widgets/custom_flat_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var titleText = Text(
      'Flora',
      style: TextStyle(
          color: AppColor.lightAccent,
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'AlexBrush'),
    );
    return Scaffold(
      backgroundColor: AppColor.accent,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: AppColor.accent.withOpacity(0.0),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.center,
          width: 300.0,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //Logo Image Area
              Container(
                width: 120.0,
                height: 120.0,
                alignment: Alignment.center,
                child: Icon(
                  Icons.ac_unit,
                  size: 80.0,
                  color: AppColor.lightAccent,
                ),
              ),

              //Spacer
              SizedBox(
                height: 10.0,
              ),

              //App's Title text
              titleText,

              //Spacer
              Spacer(),

              //Login Button
              CustomFlatButton(
                title: 'Get Started',
                outline: AppColor.lightAccent,
                action: onClickedLogin,
                suffix: Icons.arrow_forward_ios,
              ),

              //Spacer
              SizedBox(
                height: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClickedLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return LoginScreen();
        },
        settings: RouteSettings(name: '/Login'),
      ),
    );
  }

  void onClickedRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return RegisterScreen();
        },
        settings: RouteSettings(name: '/Register'),
      ),
    );
  }
}
