import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/music/music_bloc.dart';
import 'package:vexora_fe/presentation/playlistHistory/list_history_lagu.dart';
import '../../blocs/music/music_state.dart';
import '../../core/app_export.dart';

class PlaylistHistory extends StatelessWidget {
  const PlaylistHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        leading: IconButton(
          icon: CustomImageView(
            imagePath: ImageConstant.arrowLeft,
            height: 24.h,
            width: 24.h,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.homepageInitial);
          },
        ),
        centerTitle: true,
        title: Text(
          "Playlist",
          style: CustomTextStyles.titleMediumSemiBold.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: BlocProvider.value(
        value: context.read<MusicBloc>(),
        child: Center(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 36.h,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
              color: appTheme.gray30003.withOpacity(0.29),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.h),
                topLeft: Radius.circular(50.h),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 4.h,
                  width: 46.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(2.h),
                  ),
                ),
                SizedBox(height: 34.h),
                Expanded(
                  child: BlocBuilder<MusicBloc, MusicState>(
                    builder: (context, state) {
                      if (state is MusicLoaded) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.music.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 34.h);
                          },
                          itemBuilder: (context, index) {
                            final element = state.music[index];
                            return Listplaylisthistory(data: element);
                          },
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
