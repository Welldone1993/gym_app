import 'package:flutter/material.dart';

import '../infrastructures/utils/constants.dart';
import 'loading.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.label,
    required this.action,
    this.isDisable = false,
    this.backgroundColor,
  });

  final String label;
  final void Function() action;
  final bool? isDisable;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Padding(
    padding: Constants.smallPadding,
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          backgroundColor: backgroundColor ?? Colors.transparent,
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          elevation: Constants.giantSpace,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.giantSpace),
            side: BorderSide(width: 2, color: Constants.borderColor),
          ),
        ),
        onPressed: isDisable! ? null : action,
        child:
            isDisable!
                ? const CustomLoading()
                : Text(label, style: const TextStyle(color: Colors.white)),
      ),
    ),
  );
}
