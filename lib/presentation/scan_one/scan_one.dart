import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:vexora_fe/blocs/ScanFace/scanFace_bloc.dart';
import 'package:vexora_fe/blocs/ScanFace/scanFace_state.dart';
import 'package:vexora_fe/blocs/UserProfile/userProfile_bloc.dart';
import '../../blocs/ScanFace/scanFace_event.dart';
import '../../blocs/UserProfile/userProfile_state.dart';
import '../../core/app_export.dart';
import '../../data/models/dto/Request/scanFace_dto.dart';
import '../../widget/app_bar/appbar_subtitle_one.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/custom_icon_button.dart';

class ScanOneScreen extends StatelessWidget {
  final String imagePath;

  const ScanOneScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: BlocConsumer<ScanFaceBloc, ScanFaceState>(
          listener: (context, state) {
            if (state is ScanFaceSuccess) {
              Navigator.pushNamed(context, AppRoutes.result);
            }
            if (state is ScanFaceFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is ScanFaceLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Stack(
              children: [
                // Menambahkan gambar sebagai background atau bagian bawah konten
                Positioned.fill(
                  child: Image.file(
                    File(imagePath),
                    fit:
                        BoxFit.cover, // Atur gambar agar menutupi seluruh layar
                  ),
                ),
                // Konten lainnya tetap di atas gambar
                Container(
                  margin: EdgeInsets.only(top: 56.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.h, vertical: 80.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      _buildIconButtonRow(context, imagePath),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Photo Result",
      ),
    );
  }

  Future<String> _convertToJpeg(String imagePath) async {
    final image = img.decodeImage(File(imagePath).readAsBytesSync());
    final jpegFilePath = p.withoutExtension(imagePath) + '.JPEG';
    final jpegImage = img.encodeJpg(image!);
    await File(jpegFilePath).writeAsBytes(jpegImage);
    return jpegFilePath;
  }

  Widget _buildIconButtonRow(BuildContext context, String imagePath) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
              height: 68.h,
              width: 68.h,
              padding: EdgeInsets.all(10.h),
              decoration: IconButtonStyleHelper.none,
              child: CustomImageView(
                imagePath: ImageConstant.imgCloseScan,
                onTap: () {
                  Navigator.pop(context);
                },
              )),
          BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              if (state is UserProfileLoaded) {
                return CustomIconButton(
                  height: 68.h,
                  width: 68.h,
                  padding: EdgeInsets.all(10.h),
                  decoration: IconButtonStyleHelper.none,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckScan,
                    onTap: () async {
                      final extension = p.extension(imagePath).toLowerCase();
                      print(extension);
                      if (extension == '.jpg' ||
                          extension == '.jpeg' ||
                          extension == '.png') {
                        final jpegFilePath = await _convertToJpeg(imagePath);
                        print('convert to jpeg');
                        print(jpegFilePath);
                        print('berhasil');
                        print(File(jpegFilePath).path);
                        context.read<ScanFaceBloc>().add(
                              ScanFaceRequestEvent(
                                request: ScanFaceDto(
                                  userId: state.user.uuid,
                                  faceScan: File(imagePath),
                                ),
                              ),
                            );
                      } else {
                        print('data tidak valid');
                        print(imagePath);
                      }
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          )
          // BlocListener<ScanFaceBloc, ScanFaceState>(
          //   listener: (context, state) {

          //   },
          // ),
        ],
      ),
    );
  }
}
