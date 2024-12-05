import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vexora_fe/data/models/dto/Responses/scanFace_response.dart';
import '../../../core/app_export.dart';
import '../../../widget/custom_icon_button.dart'; // Adjust this import path accordingly

class Listplaylisthistory extends StatelessWidget {
  final Track data;
  const Listplaylisthistory({super.key, required this.data});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CustomImageView(
                  imagePath: data.thumbnail,
                  height: 68.h,
                  width: 74.h,
                  radius: BorderRadius.circular(8.h),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: CustomTextStyles.titleMediumSemiBold
                              .copyWith(color: theme.colorScheme.onPrimary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data.artist,
                          style: CustomTextStyles.titleMediumSemiBold
                              .copyWith(color: theme.colorScheme.onPrimary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomIconButton(
            height: 60.h,
            width: 60.h,
            padding: EdgeInsets.all(12.h),
            decoration: IconButtonStyleHelper.none,
            child: CustomImageView(
              imagePath: ImageConstant.octionPlaylist,
            ),
            onTap: () {
              _launchURL(data.path); // Use the actual Spotify URL from the data
            },
          ),
        ],
      ),
    );
  }
}
