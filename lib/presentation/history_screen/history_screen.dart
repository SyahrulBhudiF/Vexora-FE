import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widget/app_bar/appbar_leading_image.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/custom_buttom_app_bar.dart';
import '../../widget/custom_drop_down.dart';
import '../../widget/custom_floating_button.dart';
import 'widget/historylist_item_widget.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
   GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "History",
                style: CustomTextStyles.titleMediumSemiBold,
              ),
              SizedBox(height: 32.h),
              CustomDropDown(
                width: 122.h,
                hintText: "April",
                alignment: Alignment.centerLeft,
                items: dropdownItemList,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 6.h, 4.h, 6.h),
                  child: CustomImageView(
                    imagePath: ImageConstant
                        .calendarIcon,
                    height: 20.h,
                    color: Colors.white,
                    width: 20.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraint: BoxConstraints(
                  maxHeight: 36.h,
                ),
                contentPadding: EdgeInsets.fromLTRB(16.h, 6.h, 12.h, 6.h),
              ),
              SizedBox(height: 16.h),
              _buildHistoryList(context),
            ],
          ),
        ),
        // bottomNavigationBar: SizedBox(
        //   width: double.maxFinite,
        //   child: _buildBottomNavigation(context),
        // ),
        floatingActionButton: CustomFloatingButton(
          height: 74,
          width: 74,
          backgroundColor: theme.colorScheme.primary,
          child: CustomImageView(
            imagePath: ImageConstant.camera,
            height: 37.0.h,
            width: 37.0.h,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 55.h,
      leadingWidth: 48.h,
      leading: CustomImageView(
        color: Colors.black,
        imagePath: ImageConstant.arrowLeft,
        margin: EdgeInsets.only(left: 24.h, top: 20.h),
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16.h,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return HistorylistItemWidget();
        },
      ),
    );
  }

  // Widget _buildBottomNavigation(BuildContext context) {
  //   return SizedBox(
  //     width: double.maxFinite,
  //     child: CustomBottomAppBar(
  //       onChanged: (BottomBarEnum type) {
  //         Navigator.pushNamed(
  //           navigatorKey.currentContext!,
  //           getCurrentRoute(type),
  //         );
  //       },
  //     ),
  //   );
  // }

  // /// Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.homepage;
  //     case BottomBarEnum.More:
  //       return "/";
  //     default:
  //       return "/";
  //   }
  // }
}
