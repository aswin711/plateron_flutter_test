import 'package:flutter/material.dart';

class WhiteBox extends StatelessWidget {
  const WhiteBox({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 1.0,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}