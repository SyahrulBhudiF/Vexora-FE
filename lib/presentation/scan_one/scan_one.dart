import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vexora_fe/core/utils/size_utils.dart';
import '../../core/app_export.dart';
import '../../widget/app_bar/appbar_subtitle_one.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/custom_icon_button.dart';

class ScanOneScreen extends StatelessWidget {
  final String imagePath;

  const ScanOneScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: Stack(
          children: [
            // Menambahkan gambar sebagai background atau bagian bawah konten
            Positioned.fill(
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover, // Atur gambar agar menutupi seluruh layar
              ),
            ),
            // Konten lainnya tetap di atas gambar
            Container(
              margin: EdgeInsets.only(top: 56.h),
              padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 80.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  _buildIconButtonRow(context),
                ],
              ),
            ),
          ],
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

  Widget _buildIconButtonRow(BuildContext context) {
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
          CustomIconButton(
            height: 68.h,
            width: 68.h,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.none,
            child: CustomImageView(
              imagePath: ImageConstant.imgCheckScan,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.result);
              },
            ),
          ),
        ],
      ),
    );
  }
}
