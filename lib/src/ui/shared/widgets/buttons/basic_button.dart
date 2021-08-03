import 'package:flutter/material.dart';
import 'package:judicialclient/src/ui/shared/colors/judicial_colors.dart';

class BasicButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;

  const BasicButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      required this.backgroundColor,
      required this.textColor})
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
      height: 48,
      width: 272,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          style: _elevatedButtonStyle(),
          onPressed: widget.onPressed,
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
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: TextStyle(fontSize: 14, color: widget.textColor),
          ),
        ],
      ),
    );
  }
}
