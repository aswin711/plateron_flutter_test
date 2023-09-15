import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final double ? height;
  final double ? width;
  const AppButton({super.key, required this.title, this.onPressed, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Theme.of(context).colorScheme.primary,
      elevation: 1.0,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width ?? 100,
          height: height ?? 30,
          alignment: Alignment.center,
          child: Text(title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ) ,),
        ),
      ),
    );
  }
}
