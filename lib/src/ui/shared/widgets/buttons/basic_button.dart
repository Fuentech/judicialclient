import 'package:flutter/material.dart';
import 'package:judicialclient/src/ui/shared/colors/judicial_colors.dart';

class BasicButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;
  final Color backgroundColor;

  const BasicButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      required this.backgroundColor})
      : super(key: key);

  @override
  _BasicButtonState createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          style: _elevatedButtonStyle(),
          onPressed: widget.onPressed(),
          child: (widget.isLoading) ? _loading() : _contentButton(),
        ),
      ),
    );
  }

  ButtonStyle _elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: (widget.backgroundColor == null)
          ? judicialColors.judicialYellow()
          : widget.backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 14),
      textStyle: TextStyle(color: Colors.black),
      onSurface: judicialColors.judicialYellow(),
    );
  }

  Widget _loading() {
    return Container(
      height: 25.0,
      width: 25.0,
      margin: EdgeInsets.only(right: 10.0),
      child: CircularProgressIndicator(
        strokeWidth: 5.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Widget _contentButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Container()),
          Text(widget.text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
