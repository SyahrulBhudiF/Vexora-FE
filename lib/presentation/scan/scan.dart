import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vexora_fe/core/utils/size_utils.dart';
import 'package:vexora_fe/presentation/scan_one/scan_one.dart';
import 'package:vexora_fe/widget/app_bar/appbar_leading_image.dart';
import '../../core/app_export.dart';
import '../../widget/app_bar/appbar_subtitle_one.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/custom_icon_button.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late CameraController _controller;
  int _currentCameraIndex = 0;
  bool _isCameraInitialized = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    List<CameraDescription> cameras = await availableCameras();
    _controller = CameraController(
      cameras[_currentCameraIndex],
      ResolutionPreset.ultraHigh,
    );
    await _controller.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> _captureImage() async {
    if (!_controller.value.isInitialized) {
      print('Error: select a camera first.');
      return; // Jika kamera belum siap, keluar dari fungsi
    }
    try {
      await _controller.takePicture().then((XFile file) {
        if (mounted) {
          // Mengarahkan ke ScanOneScreen dan mengirimkan imagePath
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanOneScreen(imagePath: file.path),
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _flipCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    if (cameras.length > 1) {
      setState(() {
        _currentCameraIndex = (_currentCameraIndex + 1) % cameras.length;
      });
      _controller = CameraController(
        cameras[_currentCameraIndex],
        ResolutionPreset.ultraHigh,
      );
      await _controller.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } else {
      print('No secondary camera found');
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanOneScreen(imagePath: image.path),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: Stack(
          children: [
            _isCameraInitialized
                ? Positioned.fill(
                    child: CameraPreview(_controller),
                  )
                : Center(child: CircularProgressIndicator()),
            // Bottom Bar
            Positioned(
              bottom: 80,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: appTheme.black900.withOpacity(0.45),
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 30.h)),
                    GestureDetector(
                      onTap: _pickImageFromGallery,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgGalleryScan,
                        height: 50.h,
                        width: 20.h,
                      ),
                    ),
                    Spacer(),
                    CustomIconButton(
                      height: 70.h,
                      width: 70.h,
                      padding: EdgeInsets.all(10.h),
                      decoration: IconButtonStyleHelper.outlineOnPrimary,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgScanCam,
                      ),
                      onTap: () => _captureImage(),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: _flipCamera,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgFlip,
                        height: 50.h,
                        width: 20.h,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 40.h)),
                  ],
                ),
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
        text: "Take Your Picture",
      ),
      height: 55.h,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgarrowLeft,
        margin: EdgeInsets.only(left: 24.h, top: 20.h),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
