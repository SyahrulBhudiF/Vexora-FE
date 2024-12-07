import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc for BlocBuilder
import 'package:vexora_fe/blocs/history/history_bloc.dart';
import 'package:vexora_fe/presentation/history_screen/widget/history_list_month.dart';
import '../../blocs/history/history_event.dart';
import '../../blocs/history/history_state.dart';
import '../../core/app_export.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../homepage/widget/listhappy_one_item_widget.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final List<String> dropdownItemList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  final GlobalKey<CustomDropDownWithDatePickerState> _datePickerKey =
      GlobalKey<CustomDropDownWithDatePickerState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        appBar: _buildAppBar(context),
        body: RefreshIndicator(
          onRefresh: () async {
            // Trigger a refresh event to fetch the latest history data
            context.read<HistoryBloc>().add(HistoryGetEvent());
            // Reset the selected date
            _datePickerKey.currentState?.resetDate();
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 32.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomDropDownWithDatePicker(
                    key: _datePickerKey,
                    width: 215.h,
                    hintText: "Select Date",
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
                    onDateSelected: (date) {
                      context
                          .read<HistoryBloc>()
                          .add(HistoryFilterByDateEvent(date));
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: _buildHistoryList(context),
                ),
              ],
            ),
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
      title: Center(
        child: Text(
          "History",
          style: CustomTextStyles.titleMediumSemiBold,
        ),
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HistorySuccess) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
            itemCount: state.history.length,
            itemBuilder: (context, index) {
              final history = state.history[index];
              return ListhappyOneItemWidget(history: history);
            },
          );
        } else if (state is HistoryFailure) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
