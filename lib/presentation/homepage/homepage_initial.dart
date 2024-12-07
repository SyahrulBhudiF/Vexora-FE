import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexora_fe/blocs/auth/auth_bloc.dart';
import 'package:vexora_fe/blocs/auth/auth_state.dart';
import 'package:vexora_fe/blocs/history/history_bloc.dart';
import 'package:vexora_fe/blocs/random_recommendations/randomRec_bloc.dart';
import 'package:vexora_fe/blocs/topmood/topmood_bloc.dart';
import 'package:vexora_fe/blocs/topmood/topmood_state.dart';
import '../../blocs/history/history_event.dart';
import '../../blocs/history/history_state.dart';
import '../../blocs/random_recommendations/randomRec_event.dart';
import '../../blocs/topmood/topmood_event.dart';
import '../../core/app_export.dart';
import 'widget/listhappy_one_item_widget.dart';
import 'widget/listplaylistgal_item_widget.dart';
import 'widget/listsad_one_item_widget.dart';

class HomepageInitial extends StatefulWidget {
  const HomepageInitial({super.key});

  @override
  HomepageInitialState createState() => HomepageInitialState();
}

class HomepageInitialState extends State<HomepageInitial>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData(); // Load data when the widget is first created
  }

  Future<void> _loadData() async {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      final userId = authState.user.uuid;
      if (userId != null) {
        context.read<HistoryBloc>().add(HistoryGetEvent());
        context.read<MostMoodBloc>().add(GetMostMoodEvent(userId));
        context.read<PlaylistBloc>().add(LoadPlaylistsEvent());
      } else {
        print('Error: userId is null');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure the mixin's functionality is retained
    return RefreshIndicator(
      onRefresh: _loadData,
      child: SingleChildScrollView(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Container(
                color: theme.colorScheme.primary,
                height: 870.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 260, left: 30.h),
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
                      height: 550.h,
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 42.h),
            width: double.maxFinite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<MostMoodBloc, MostMoodState>(
                builder: (context, state) {
                  if (state is MostMoodLoading) {
                    return CircularProgressIndicator();
                  } else if (state is MostMoodSuccess) {
                    return ListsadOneItemWidget(
                        topMood: state.mood); // Use mood from state
                  } else if (state is MostMoodFailure) {
                    return Text(
                      'Failed to load top mood: ${state.message}', // Show the error message
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return ListsadOneItemWidget(
                        topMood: 'Loading'); // Placeholder
                  }
                },
              ),
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
                )
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistorySuccess) {
                if (state.history.isEmpty) {
                  return Center(
                    child: Text(
                      'Belum ada mood silahkan scan wajah dulu',
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                  );
                }
                final history = state.history.first;
                return ListhappyOneItemWidget(
                  history: history,
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
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
          // SizedBox(
          //   height: 20.h,
          // )
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
            padding: EdgeInsets.only(top: 110.h),
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
