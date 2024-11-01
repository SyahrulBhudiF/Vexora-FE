// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vexora_fe/routes/app_routes.dart';
import '../../core/app_export.dart';
import '../../widget/custom_buttom_app_bar.dart';
import '../../widget/custom_floating_button.dart';
import 'homepage_initial.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 0.89),
              colors: [theme.colorScheme.primary, appTheme.purple100],
            ),
          ),
          child: Navigator(
            key: navigatorKey,
            initialRoute: AppRoutes.homepageInitial,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) =>
                  getCurrentPage(routeSetting.name!),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ),
        floatingActionButton: CustomFloatingButton(
          height: 74,
          width: 74,
          backgroundColor: theme.colorScheme.primary,
          child: CustomImageView(
            imagePath: ImageConstant.imgNavHome,
            height: 37.0.h,
            width: 37.0.h,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  // Section Widget
  Widget _buildBottomNavigation(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: CustomBottomAppBar(onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(
              navigatorKey.currentContext!, getCurrentRoute(type));
        }));
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homepageInitial;
      case BottomBarEnum.More:
        return "/";
      default:
        return "/";
    }
  }

  // Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homepageInitial:
        return HomepageInitial();
      default:
        return DefaultWidget();
    }
  }
}
