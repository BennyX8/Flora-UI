import 'package:flora/utils/color.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String title;
  final Color outline;
  final Color fill;
  final Function action;
  final IconData suffix;
  const CustomFlatButton({
    Key key,
    @required this.title,
    @required this.outline,
    this.fill,
    @required this.action,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: 250.0,
      height: 50.0,
      child: FlatButton(
        color: fill,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: fill == AppColor.accent || fill == null
                    ? AppColor.lightAccent
                    : AppColor.accent,
                fontSize: 18.0,
              ),
            ),
            suffix == null
                ? SizedBox(
                    width: 20.0,
                  )
                : Icon(
                    suffix,
                    color: AppColor.lightAccent,
                  ),
          ],
        ),
        // padding: EdgeInsets.symmetric(horizontal: 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
          side: BorderSide(color: outline),
        ),
        onPressed: action,
      ),
    );
  }
}
