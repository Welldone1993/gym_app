import 'package:flutter/material.dart';

import '../infrastructures/utils/constants.dart';
import 'loading.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.action,
    this.isDisable = false,
    this.isHalfSize,
  });

  final String label;
  final void Function() action;
  final bool? isDisable;
  final bool? isHalfSize;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Constants.smallPadding,
        child: SizedBox(
          width: double.infinity,
          height: isHalfSize ?? false ? 35 : 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.grey,
              backgroundColor: Constants.buttonColor,
              textStyle: TextStyle(
                fontSize: isHalfSize ?? false ? 15 : 20,
                fontWeight: FontWeight.bold,
              ),
              elevation: Constants.giantSpace,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Constants.giantSpace),
              ),
            ),
            onPressed: isDisable! ? null : action,
            child: isDisable!
                ? const CustomLoading()
                : Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      );
}
