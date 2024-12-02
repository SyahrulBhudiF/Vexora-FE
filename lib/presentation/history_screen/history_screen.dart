import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vexora_fe/blocs/history/history_bloc.dart';
import 'package:vexora_fe/blocs/history/history_state.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/data/models/History/history_model.dart';
import 'package:vexora_fe/presentation/history_screen/widget/history_list_month.dart';
import 'package:vexora_fe/presentation/homepage/widget/listhappy_one_item_widget.dart';

import '../../widget/app_bar/custom_app_bar.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime? selectedMonth;

  void _onMonthSelected(DateTime month) {
    setState(() {
      selectedMonth = month;
    });
  }

  List<History> _filterHistoryByMonth(
      List<History> historyList, DateTime month) {
    return historyList.where((history) {
      return history.createdAt.month == month.month &&
          history.createdAt.year == month.year;
    }).toList();
  }

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
                  hintText: "Select Month",
                  alignment: Alignment.centerLeft,
                  items: [
                    "January",
                    "February",
                    "March",
                    "April",
                    "Maret",
                    "Mei",
                    "Juni",
                    "Juli",
                    "Agustus",
                    "September",
                    "Oktober",
                    "November",
                    "Desember"
                  ], // Dummy data
                  prefix: Container(
                    margin: EdgeInsets.fromLTRB(10.h, 6.h, 10.h, 6.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.calendarIcon,
                      height: 20.h,
                      color: Colors.black,
                      width: 20.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  prefixConstraint: BoxConstraints(
                    maxHeight: 36.h,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(0.h, 0.h, 0.h, 0.h),
                  onMonthSelected: _onMonthSelected,
                  // Pass the callback
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
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistorySuccess) {
          final filteredHistory = selectedMonth != null
              ? _filterHistoryByMonth(state.history, selectedMonth!)
              : state.history;

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
              itemCount: filteredHistory.length,
              itemBuilder: (context, index) {
                final history = filteredHistory[index];
                return ListhappyOneItemWidget(history: history);
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
