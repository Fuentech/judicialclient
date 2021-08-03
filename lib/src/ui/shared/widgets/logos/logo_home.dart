import 'package:simple_shadow/simple_shadow.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoHome extends StatelessWidget {
  final Alignment alignment;
  final double width;
  final double height;

  const LogoHome(
      {Key? key,
      required this.alignment,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final String assetName = 'assets/Logo.svg';
    return Container(
      width: this.width,
      height: this.height,
      child: Align(
        child: SimpleShadow(
          child: SvgPicture.asset(
            assetName,
            color: Colors.white,
            semanticsLabel: 'Judicial app logo',
          ),
          opacity: 0.25,
          color: Colors.black,
          offset: Offset(4, 4),
        ),
        alignment: this.alignment,
      ),
    );
  }
}
