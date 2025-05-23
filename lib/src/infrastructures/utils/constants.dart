import 'package:flutter/material.dart';

class Constants {
  static const Color primaryColor = Color(0xff335477);
  static const Color secondaryColor = Color(0xff234463);
  static const Color buttonColor = Color(0xffF95E01);
  static const Color unfollowButtonColor = Color(0xffd3240f);
  static const Color faceBookColor = Color(0xff0078F6);
  static const Color labelColor = Color(0xff05428A);
  static const Color dialogBackgroundColor = Color(0xffe8eef8);

  static const String backgroundImage = 'lib/assets/Background_App_01.jpg';
  static const String logInBackgroundImage = 'lib/assets/log_in_background.png';
  static const String googleLogo = 'lib/assets/google_logo.png';
  static const String profileBadge = 'lib/assets/profile_badge.png';
  static const String profileBackground = 'lib/assets/profile_background.png';

  static const double tinySpace = 2;
  static const double smallSpace = 4;
  static const double mediumSpace = 8;
  static const double largeSpace = 16;
  static const double xLargeSpace = 20;
  static const double xxLargeSpace = 24;
  static const double giantSpace = 32;

  static const SizedBox tinyVerticalSpacer = SizedBox(height: tinySpace);
  static const SizedBox smallVerticalSpacer = SizedBox(height: smallSpace);
  static const SizedBox mediumVerticalSpacer = SizedBox(height: mediumSpace);
  static const SizedBox largeVerticalSpacer = SizedBox(height: largeSpace);
  static const SizedBox giantVerticalSpacer = SizedBox(height: giantSpace);

  static const SizedBox tinyHorizontalSpacer = SizedBox(width: tinySpace);
  static const SizedBox smallHorizontalSpacer = SizedBox(width: smallSpace);
  static const SizedBox mediumHorizontalSpacer = SizedBox(width: mediumSpace);
  static const SizedBox largeHorizontalSpacer = SizedBox(width: largeSpace);
  static const SizedBox giantHorizontalSpacer = SizedBox(width: giantSpace);

  static const EdgeInsetsDirectional tinyPadding =
      EdgeInsetsDirectional.all(tinySpace);
  static const EdgeInsetsDirectional smallPadding =
      EdgeInsetsDirectional.all(smallSpace);
  static const EdgeInsetsDirectional mediumPadding =
      EdgeInsetsDirectional.all(mediumSpace);
  static const EdgeInsetsDirectional largePadding =
      EdgeInsetsDirectional.all(largeSpace);
  static const EdgeInsetsDirectional giantPadding =
      EdgeInsetsDirectional.all(giantSpace);

  static const boldTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const semiBoldTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const smallThinTextStyle = TextStyle(
    fontWeight: FontWeight.w100,
    color: Colors.white,
    fontSize: 12,
  );
  static const mediumThinTextStyle = TextStyle(
    fontWeight: FontWeight.w100,
    color: Colors.white,
  );
  static const readMoreTextStyle = TextStyle(
    fontWeight: FontWeight.w100,
    color: buttonColor,
    fontSize: 12,
  );

  static const dialogBoldTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const dialogSemiBoldTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static const dialogMediumThinTextStyle = TextStyle(
    fontWeight: FontWeight.w100,
  );
  static const dialogSmallThinTextStyle = TextStyle(
    fontWeight: FontWeight.w100,
    fontSize: 12,
  );
  static const dialogExtraSmallThinTextStyle = TextStyle(
    // fontWeight: FontWeight.bold,
    fontSize: 10,
  );

  static const timeAgoTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontSize: 10,
  );
}
