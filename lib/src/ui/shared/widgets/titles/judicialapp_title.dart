import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class JudicialappTitle extends StatefulWidget {
  final Alignment alignment;

  const JudicialappTitle({Key? key, required this.alignment}) : super(key: key);

  @override
  _JudicialappTitleState createState() => _JudicialappTitleState();
}

class _JudicialappTitleState extends State<JudicialappTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      child: Align(
        child: SimpleShadow(
          child: Text(
            'Judicial App',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'WinterInline',
                fontSize: 36,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
            ),
          ),
          opacity: 0.25,
          color: Colors.black,
          offset: Offset(4, 4),
        ),
        alignment: widget.alignment,
      ),
    );
  }
}
