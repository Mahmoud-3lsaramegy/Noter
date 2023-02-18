import 'package:flutter/material.dart';

class IconDis extends StatelessWidget {
  //const IconDis({super.key});
  IconDis(this.image, this.width, this.height, {super.key});
  String image;
  double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.5),
      width: width,
      height: height,
      child: Center(
        child: Image.asset(image,
        filterQuality: FilterQuality.high,
        fit: BoxFit.contain,
        ),
      ),
    );
  }
}
// Button Class
class Button3lsaramegy_text extends StatelessWidget {
  Color color_button;
  double width, height, round;
  Widget titel;
  var Button;
  Button3lsaramegy_text(
    this.color_button,
    this.width,
    this.height,
    this.titel,
    this.Button(),
    this.round,
  );
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Button();
      },
      child: titel,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(round),
        )),
        backgroundColor: MaterialStateProperty.all(color_button),
        fixedSize: MaterialStateProperty.all(Size(width, height)),
      ),
    );
  }
}
