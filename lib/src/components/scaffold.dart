import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../infrastructures/app_controller/app_controller.dart';
import '../infrastructures/utils/constants.dart';
import 'image_builder.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.pageTitle,
    required this.body,
    this.bottomNavigationBar,
    this.onBackTap,
    this.onRefresh,
    this.showEndDrawer,
    this.resizeToAvoidBottomInset,
  });

  final String pageTitle;
  final bool? showEndDrawer;
  final bool? resizeToAvoidBottomInset;

  final Function()? onBackTap;
  final Future<void> Function()? onRefresh;

  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) => Scaffold(
    endDrawer: showEndDrawer ?? false ? _endDrawerWidget() : null,
    appBar: _appBar(),
    body: _body(),
    bottomNavigationBar: bottomNavigationBar,
    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
  );

  Widget _endDrawerWidget() => Drawer(
    backgroundColor: Constants.primaryColor,
    child: Column(
      children: [_header(), Expanded(child: _menuItems()), _logout()],
    ),
  );

  Widget _logout() => Padding(
    padding: const EdgeInsets.only(bottom: Constants.largeSpace),
    child: Column(
      children: [
        const Divider(),
        Constants.mediumVerticalSpacer,
        InkWell(
          // onTap: AppController().logout,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logout_outlined, color: Colors.white),
              Constants.mediumHorizontalSpacer,
              Text(
                "LocaleKeys.social_sport_app_shared_log_out.tr",
                style: Constants.boldTextStyle,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _menuItems() => Column(children: []);

  Widget _header() => Padding(
    padding: const EdgeInsets.only(top: Constants.giantSpace),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => _avatar()),
        Constants.mediumVerticalSpacer,
        Obx(() => _name()),
        Constants.largeVerticalSpacer,
        const Divider(),
      ],
    ),
  );

  Widget _name() =>
      Text(AppController().getUserFullName(), style: Constants.boldTextStyle);

  Widget _avatar() => CustomImageBuilder(
    image: AppController().userModel.value?.avatar ?? 'profile.jpg',
    folder: 'profile',
    width: 100,
    height: 100,
    isAvatar: true,
  );

  AppBar _appBar() => AppBar(
    backgroundColor: Constants.primaryColor,
    automaticallyImplyLeading: false,
    leading:
        onBackTap != null
            ? IconButton(
              onPressed: onBackTap!,
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            )
            : null,
    actions: [if (showEndDrawer ?? false) _endDrawerBuilder()],
    title: Text(pageTitle, style: Constants.boldTextStyle),
    centerTitle: true,
  );

  Widget _endDrawerBuilder() => Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () => Scaffold.of(context).openEndDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  );

  Widget _body() =>
      onRefresh == null
          ? _mainBody()
          : RefreshIndicator(
            color: Colors.red,
            edgeOffset: 10,
            displacement: 50,
            onRefresh: onRefresh!,
            child: _mainBody(),
          );

  Widget _mainBody() => DecoratedBox(
    decoration: const BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage(Constants.backgroundImage),
      //   fit: BoxFit.cover,
      // ),
    ),
    child: LayoutBuilder(
      builder:
          (context, constraints) => Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: math.min(600, constraints.maxWidth),
              ),
              child: body,
            ),
          ),
    ),
  );
}
