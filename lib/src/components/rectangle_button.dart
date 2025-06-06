import 'package:flutter/material.dart';
import 'package:gym_app/src/infrastructures/utils/constants.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({super.key, required this.onTap, required this.title});

  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) => Center(
    child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      onTap: onTap,
      child: Container(
        padding: Constants.mediumPadding,
        margin: Constants.mediumPadding,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Constants.primaryColor, width: 5),
        ),
        child: Center(child: Text(title)),
      ),
    ),
  );
}
