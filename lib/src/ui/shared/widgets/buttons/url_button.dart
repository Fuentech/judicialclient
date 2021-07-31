import 'package:flutter/material.dart';
import 'package:judicialclient/src/ui/shared/colors/judicial_colors.dart';

class UrlButton extends StatefulWidget {
  final String urlName;
  final Function onPressed;

  const UrlButton({Key? key, required this.urlName, required this.onPressed})
      : super(key: key);

  @override
  _UrlButtonState createState() => _UrlButtonState();
}

class _UrlButtonState extends State<UrlButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          widget.urlName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: judicialColors.judicialBrown()),
        ),
      ),
    );
  }
}
