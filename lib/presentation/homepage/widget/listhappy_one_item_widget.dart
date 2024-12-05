import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/music/music_bloc.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/widget/custom_elevated_button.dart';

import '../../../blocs/music/music_event.dart';
import '../../../blocs/music/music_state.dart';
import '../../../data/models/History/history_model.dart';

class ListhappyOneItemWidget extends StatelessWidget {
  final History? history;
  const ListhappyOneItemWidget({Key? key, this.history}) : super(key: key);

  String _getMoodIcon(String mood) {
    switch (mood.toLowerCase()) {
      case 'happy':
        return ImageConstant.happyIcon;
      case 'sad':
        return ImageConstant.sadKuning;
      case 'angry':
        return ImageConstant.angryKuning;
      case 'neutral':
        return ImageConstant.calmKuning;
      default:
        return ImageConstant.happyIcon; // Default icon
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: context.read<MusicBloc>(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 14.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadiusStyle.roundedBorder12,
          boxShadow: [
            BoxShadow(
              color: Color(0X7FBABABA).withOpacity(0.25),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: history == null
            ? Center(
                child: Text(
                  'Belum ada mood silahkan scan wajah dulu',
                  style:
                      theme.textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: _getMoodIcon(history!.mood),
                          height: 60.h,
                          width: 60.h,
                        ),
                        SizedBox(width: 10.h),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.h, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Text(
                                  history!.mood,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgClock,
                                    height: 14.h,
                                    width: 14.h,
                                  ),
                                  SizedBox(width: 2.h),
                                  Flexible(
                                    child: Text(
                                      history!.createdAt.toString(),
                                      style: theme.textTheme.labelMedium,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<MusicBloc, MusicState>(
                    listener: (context, state) {
                      if (state is MusicLoaded) {
                        Navigator.pushNamed(context, AppRoutes.playlistHistory);
                      }
                    },
                    builder: (context, state) {
                      if (state is MusicLoading) {
                        return CustomElevatedButton(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(2.h),
                          ),
                          isDisabled: true,
                          height: 30.h,
                          width: 140.h,
                          text: 'Your Playlist',
                          leftIcon: Container(
                            margin: EdgeInsets.only(right: 10.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgHeadps,
                              height: 10.h,
                              width: 10.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          buttonTextStyle: theme.textTheme.labelMedium,
                          onPressed: () {},
                        );
                      }
                      return CustomElevatedButton(
                        height: 30.h,
                        width: 140.h,
                        text: 'Your Playlist',
                        leftIcon: Container(
                          margin: EdgeInsets.only(right: 10.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgHeadps,
                            height: 10.h,
                            width: 10.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        buttonTextStyle: theme.textTheme.labelMedium,
                        onPressed: () {
                          if (history != null) {
                            context
                                .read<MusicBloc>()
                                .add(LoadMusicEvent(musicId: history!.uuid));
                          } else {
                            // Handle the case where history is null
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No history available')),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
