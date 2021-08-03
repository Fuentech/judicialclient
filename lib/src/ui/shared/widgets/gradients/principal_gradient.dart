import 'package:flutter/material.dart';
import 'package:judicialclient/src/ui/shared/colors/judicial_colors.dart';

class PrincipalGradient extends StatefulWidget {
  final Widget containerChild;

  const PrincipalGradient({Key? key, required this.containerChild})
      : super(key: key);

  @override
  _PrincipalGradientState createState() => _PrincipalGradientState();
}

class _PrincipalGradientState extends State<PrincipalGradient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0677, 1],
          colors: [
            judicialColors.judicialYellow(),
            judicialColors.judicialBrown()
          ],
        ),
      ),
      child: widget.containerChild,
    );
  }
}
