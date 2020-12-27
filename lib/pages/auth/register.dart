import 'package:flora/pages/auth/register.dart';
import 'package:flora/utils/color.dart';
import 'package:flora/widgets/custom_flat_button.dart';
import 'package:flora/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  TapGestureRecognizer _tapGesture;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _tapGesture = TapGestureRecognizer();
  }

  //TextField Controllers
  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.accent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: AppColor.accent.withOpacity(0.0),
        // title: Text(
        //   'Register',
        //   style: TextStyle(color: AppColor.lightAccent.withOpacity(0.5)),
        // ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 300.0,
          // height: 500.0,
          child: Column(
            children: [
              //Spacer
              SizedBox(
                height: 10.0,
              ),

              //Logo Image Area
              Container(
                width: 100.0,
                height: 100.0,
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

              //
              Text(
                'Flora',
                style: TextStyle(
                    fontFamily: 'AlexBrush',
                    color: AppColor.lightAccent,
                    fontSize: 48.0),
              ),

              //Spacer
              SizedBox(
                height: 50.0,
              ),

              Expanded(
                child: ListView(
                  children: [
                    //UserName TextField
                    CustomTextField(
                      hintText: 'Full Name',
                      icon: Icons.person,
                      controller: _nameController,
                      password: false,
                    ),

                    //Spacer
                    SizedBox(
                      height: 15.0,
                    ),

                    //UserName TextField
                    CustomTextField(
                      hintText: 'Email',
                      icon: Icons.email,
                      controller: _emailController,
                      password: false,
                    ),

                    //Spacer
                    SizedBox(
                      height: 15.0,
                    ),

                    //UserName TextField
                    CustomTextField(
                      hintText: 'Password',
                      icon: Icons.lock,
                      controller: _passController,
                      password: true,
                    ),

                    //Spacer
                    SizedBox(
                      height: 30.0,
                    ),

                    //Login User Button
                    CustomFlatButton(
                      title: 'Register',
                      outline: AppColor.lightAccent,
                      action: register,
                      fill: AppColor.lightAccent,
                    ),

                    //Spacer
                    SizedBox(
                      height: 30.0,
                    ),

                    //Signup Link
                    RichText(
                      textAlign: TextAlign.center,
                      key: Key('Login'),
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already a User? ',
                            style: TextStyle(color: AppColor.lightAccent),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.lightAccent,
                            ),
                            recognizer: _tapGesture..onTap = _handleOnTap,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleOnTap() {
    Navigator.popUntil(context, ModalRoute.withName('/Login'));
  }

  void register() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context);
    });
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            alignment: Alignment.center,
            child: SpinKitCircle(
              controller: _controller,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                      // color: index.isEven ? Colors.red : Colors.green,
                      color: AppColor.lightAccent),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
