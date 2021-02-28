import 'package:flutter/material.dart';
import 'package:movie_app/ui/colors.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  const CustomTitle({
    Key key,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
          ),
          Text(
            "SEE ALL",
            style: TextStyle(
                color: textColor, fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
