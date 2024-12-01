import 'package:flutter/material.dart';
import 'package:vexora_fe/presentation/history_screen/widget/history_list_month.dart';
import '../../core/app_export.dart';

import '../../widget/app_bar/custom_app_bar.dart';
import '../homepage/widget/listhappy_one_item_widget.dart';
import 'widget/historylist_item_widget.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final List<String> dropdownItemList = ["January", "February", "March", "April"];

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
              Align(
                alignment: Alignment.centerLeft,
                child: CustomDropDownWithMonthPicker(
                  width: 150.h,
                  hintText: "April",
                  alignment: Alignment.centerLeft,
                  items: dropdownItemList,
                  prefix: Container(
                    margin: EdgeInsets.fromLTRB(10.h, 6.h, 10.h, 6.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.calendarIcon,
                      height: 20.h,
                      color: theme.colorScheme.onPrimary,
                      width: 20.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  prefixConstraint: BoxConstraints(
                    maxHeight: 36.h,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(0.h, 0.h, 0.h, 0.h),
                ),
              ),
              SizedBox(height: 16.h),
              _buildHistoryList(context),
            ],
          ),
        ),
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
        onTap: () {
          Navigator.pop(context);
        },
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
          return ListhappyOneItemWidget();
        },
      ),
    );
  }
}
