import 'package:flora/utils/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool password;
  const CustomTextField(
      {Key key,
      @required this.controller,
      @required this.hintText,
      @required this.icon,
      this.password})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  //Password Visibility flag
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      height: 50.0,
      child: TextField(
        obscureText: widget.password && !_isPasswordVisible,
        style: TextStyle(color: AppColor.lightAccent),
        cursorColor: AppColor.lightAccent,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: AppColor.lightAccent.withOpacity(0.5)),

          //Prefix Icon
          prefixIcon: Icon(
            widget.icon,
            color: AppColor.lightAccent,
          ),

          suffixIcon: widget.password
              ? GestureDetector(
                  child: Icon(
                    !_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColor.lightAccent,
                  ),
                  onTap: togglePassword,
                )
              : null,

          //Border Style
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: AppColor.lightAccent),
          ),

          //Enabled border Style
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: AppColor.lightAccent),
          ),

          //Focused Border Style
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: AppColor.lightAccent),
          ),
        ),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}
