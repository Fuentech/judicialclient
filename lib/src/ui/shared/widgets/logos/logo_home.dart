import 'package:simple_shadow/simple_shadow.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoHome extends StatelessWidget {
  final Alignment alignment;

  const LogoHome({Key? key, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final String assetName = 'assets/Logo.svg';
    return Container(
      width: 400,
      height: 232,
      child: Align(
        child: SimpleShadow(
          child: SvgPicture.asset(
            assetName,
            color: Colors.white,
            semanticsLabel: 'Judicial app logo',
          ),
          opacity: 0.5,
          color: Colors.black,
          offset: Offset(-4, 4),
        ),
        alignment: this.alignment,
      ),
    );
  }
}
