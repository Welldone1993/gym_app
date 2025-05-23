import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../infrastructures/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textController,
    required this.title,
    this.isRequired = false,
    this.isPassword = false,
    this.isNumber = false,
    this.readOnly = false,
    this.hint,
    this.suffixIcon,
    this.formKey,
    this.maxLines,
  });

  // TODO: assertion for handle is password and icon together

  final String title;
  final bool? isPassword;
  final TextEditingController textController;
  final bool? isRequired;
  final GlobalKey<FormState>? formKey;
  final String? hint;
  final bool? isNumber;
  final bool? readOnly;
  final IconData? suffixIcon;
  final int? maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Constants.mediumPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: Constants.largeSpace,
              ),
            ),
            Constants.mediumVerticalSpacer,
            Form(
              key: widget.formKey,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Colors.white,
                  ),
                  color: Constants.secondaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      Constants.mediumSpace,
                    ),
                  ),
                ),
                child: TextFormField(
                  readOnly: widget.readOnly!,
                  validator: widget.isRequired!
                      ? (value) {
                          if (value == null || value.isEmpty) {
                            return 'required';
                          }
                          return null;
                        }
                      : (value) => null,
                  maxLines: widget.maxLines ?? 1,
                  controller: widget.textController,
                  obscureText:
                      _getVisibility(_obscureText, widget.isPassword ?? false),
                  showCursor: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: widget.suffixIcon != null
                        ? Icon(
                            widget.suffixIcon!,
                            color: Colors.white70,
                          )
                        : widget.isPassword!
                            ? IconButton(
                                onPressed: () => setState(
                                    () => _obscureText = !_obscureText),
                                icon: _obscureText
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      ),
                              )
                            : null,
                    fillColor: Constants.primaryColor,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: widget.hint,
                    hintStyle: const TextStyle(
                      color: Colors.white30,
                      fontSize: 20,
                    ),
                  ),
                  inputFormatters: widget.isNumber!
                      ? <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ]
                      : null,
                  keyboardType: widget.isNumber! ? TextInputType.number : null,
                ),
              ),
            ),
          ],
        ),
      );

  bool _getVisibility(bool isHidden, bool isPassword) {
    if (!isPassword) {
      return false;
    } else {
      if (isHidden) {
        return false;
      } else {
        return true;
      }
    }
  }
}
