import 'package:flutter/material.dart';
import 'dart:math' as math show Random;
class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();

  @override
  Path getClip(Size size) {
    var path = Path();

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    path.addOval(rect);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/*
0xFFFFFFFF
A R G B = 32 bits
  A = Alpha (0 - 255) - 8 bits
  R = Red (0 - 255) - 8 bits
  G = Green (0 - 255) - 8 bits
  B = Blue (0 - 255) - 8 bits
*/

Color getRandomColor() => Color(
      0xFF000000 +
          math.Random().nextInt(
            0x00FFFFFF,
          ),
    );

class Example6 extends StatefulWidget {
  const Example6({Key? key}) : super(key: key);

  @override
  State<Example6> createState() => _Example6State();
}

class _Example6State extends State<Example6> {
  var _color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: getRandomColor(),
              end: _color,
            ),
            onEnd: () {
              setState(() {
                _color = getRandomColor();
              });
            },
            duration: const Duration(seconds: 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: Colors.red,
            ),
            builder: (context, Color? color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcATop,
                ),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
