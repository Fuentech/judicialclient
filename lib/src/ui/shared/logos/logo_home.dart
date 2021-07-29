import 'package:flutter/material.dart';

class LogoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 180,
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Center(child: Image(image: AssetImage("assets/logo_judicial.png"))),
            SizedBox(height: 15),
            Text(
              "Judicial App",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
