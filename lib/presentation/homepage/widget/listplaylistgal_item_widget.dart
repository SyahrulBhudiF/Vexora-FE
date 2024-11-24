import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:vexora_fe/blocs/random_recommendations/randomRec_bloc.dart';
import '../../../blocs/random_recommendations/random_state.dart';
import '../../../core/app_export.dart';

class ListplaylistgalItemWidget extends StatelessWidget {
  const ListplaylistgalItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        if (state is PlaylistLoaded && state.playlists.isNotEmpty) {
          return SizedBox(
            height: 180.h, // Set height untuk widget horizontal
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll horizontal
              child: Row(
                children: state.playlists.map((playlist) {
                  return Container(
                    width: 120.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 10.h),
                      child: GestureDetector(
                        // onTap: () async {
                        //   print(playlist.path);
                        //   await launch(playlist.path);
                        // }, // Buka Spotify
                        child: Column(
                          children: [
                            CustomImageView(
                              imagePath: playlist.thumbnail,
                              height: 120.h,
                              width: 120.h,
                              radius: BorderRadius.circular(4.h),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "${playlist.playlistName}\n", // Nama playlist
                              style: CustomTextStyles.labelLargeBlack900,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "${playlist.artist}\n", // Nama artis
                              style: CustomTextStyles.labelLargeBlack900,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        } else if (state is PlaylistLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlaylistFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No Playlists Found'));
        }
      },
    );
  }
}
