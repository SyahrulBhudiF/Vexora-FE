import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/ScanFace/scanFace_bloc.dart';
import '../../blocs/ScanFace/scanFace_state.dart';
import '../../core/app_export.dart';
import 'widgets/listbirdsofa_item_widget.dart';

class PlaylistRecommendation extends StatelessWidget {
  const PlaylistRecommendation({super.key});

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
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Playlist",
          style: CustomTextStyles.titleMediumSemiBold.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: theme.colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.homepageInitial);
            },
          ),
        ],
      ),
      body: Center(
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
              BlocBuilder<ScanFaceBloc, ScanFaceState>(
                builder: (context, state) {
                  if (state is ScanFaceSuccess) {
                    return Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.data.recommendedTracks.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 34.h);
                        },
                        itemBuilder: (context, index) {
                          final element = state.data.recommendedTracks[index];
                          return ListplaylistItemWidget(data: element);
                        },
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}