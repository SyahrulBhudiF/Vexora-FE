import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/auth/auth_bloc.dart';
import 'package:vexora_fe/blocs/auth/auth_state.dart';
import 'package:vexora_fe/blocs/history/history_bloc.dart';
import 'package:vexora_fe/data/models/History/history_model.dart';
import '../../blocs/history/history_state.dart';
import '../../core/app_export.dart';
import 'widget/listhappy_one_item_widget.dart';
import 'widget/listplaylistgal_item_widget.dart';
import 'widget/listsad_one_item_widget.dart';

class HomepageInitial extends StatefulWidget {
  const HomepageInitial({super.key});

  @override
  HomepageInitialState createState() => HomepageInitialState();
}

class HomepageInitialState extends State<HomepageInitial> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              color: theme.colorScheme.primary,
              height: 898.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 180.h, left: 30.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, ",
                            style: CustomTextStyles.titleLargeMedium,
                          ),
                          Text(
                            state.user.username.toString(),
                            style: CustomTextStyles.titleLargeBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary,
                        borderRadius: BorderRadiusStyle.customBorderTL40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h),
                        _buildTopMoodSection(context),
                        SizedBox(height: 20.h),
                        _buildYourPlaylistSection(context),
                      ],
                    ),
                  ),
                  _buildWelcomeSection(context),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  // section widget
  Widget _buildTopMoodSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Top Mood",
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 5.h),
          // Menggunakan BlocBuilder untuk mengambil data mood
          Container(
            margin: EdgeInsets.symmetric(horizontal: 42.h),
            width: double.maxFinite,
            child: BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, state) {
                if (state is HistorySuccess) {
                  // Menghitung dan mengelompokkan mood terbanyak
                  final moodCounts = _countMood(state.history);
                  final topMood = moodCounts.isNotEmpty
                      ? _getTopMood(moodCounts)
                      : 'Good'; // Default mood is 'Good'

                  // Menampilkan hanya mood dengan jumlah terbanyak
                  return ListsadOneItemWidget(
                    moodCounts: moodCounts,
                    topMood: topMood,
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "History Mood",
                  style: theme.textTheme.titleMedium,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.history);
                  },
                  child: Text(
                    "See all",
                    style: CustomTextStyles.bodySmallPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistorySuccess) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16.h);
                  },
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final history = state.history[index];
                    return ListhappyOneItemWidget(
                      history: history,
                    );
                  },
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }

// Fungsi untuk menghitung mood terbanyak dari history
  Map<String, int> _countMood(List<History> history) {
    final moodCounts = <String, int>{
      'Good': 0,
      'Angry': 0,
      'Sad': 0,
      'Neutral': 0,
    };

    for (var item in history) {
      switch (item.mood) {
        case 'Good':
          moodCounts['Good'] = moodCounts['Good']! + 1;
          break;
        case 'Angry':
          moodCounts['Angry'] = moodCounts['Angry']! + 1;
          break;
        case 'Sad':
          moodCounts['Sad'] = moodCounts['Sad']! + 1;
          break;
        case 'Neutral':
          moodCounts['Neutral'] = moodCounts['Neutral']! + 1;
          break;
      }
    }

    return moodCounts;
  }

// Fungsi untuk mendapatkan mood terbanyak
  String _getTopMood(Map<String, int> moodCounts) {
    return moodCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  // section widget
  Widget _buildYourPlaylistSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.maxFinite,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Random Music",
                      style: theme.textTheme.titleMedium,
                    ),
                  ])),
          SizedBox(
            height: 8.h,
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 20.h,
                children: List.generate(1, (index) {
                  return ListplaylistgalItemWidget();
                }),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  // section widget
  Widget _buildWelcomeSection(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 38.h, left: 26.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 180.h,
              child: CustomImageView(
                imagePath: ImageConstant.imgLogoVexora,
                height: 40.h,
                width: 40.h,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.h),
            child: Align(
              alignment: Alignment.topRight,
              child: CustomImageView(
                imagePath: ImageConstant.imgHomePage,
                height: 180.h,
                width: 180.h,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
