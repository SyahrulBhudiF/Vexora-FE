// import 'package:flutter/material.dart';
// import 'package:vexora_fe/core/utils/size_utils.dart';
// import '../../core/app_export.dart';
// import '../../widget/app_bar/appbar_subtitle_one.dart';
// import '../../widget/app_bar/custom_app_bar.dart';
// import '../../widget/custom_icon_button.dart';

// class ScanOneScreen extends StatelessWidget {
//   const ScanOneScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             extendBody: true,
//             extendBodyBehindAppBar: true,
//             appBar: _buildAppBar(context),
//             body: Container(
//               width: double.maxFinite,
//               height: SizeUtils.height,
//               decoration: BoxDecoration(
//                   color: theme.colorScheme.primary,
//                   image: DecorationImage(
//                       image: AssetImage(ImageConstant.imgScan),
//                       fit: BoxFit.fill)),
//               child: Container(
//                 margin: EdgeInsets.only(top: 56.h),
//                 padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 80.h),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Spacer(),
//                     _buildIconButtonRow(context),
//                   ],
//                 ),
//               ),
//             )));
//   }

//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       centerTitle: true,
//       title: AppbarSubtitleOne(
//         text: "Take Your Picture",
//       ),
//     );
//   }

//   Widget _buildIconButtonRow(BuildContext context) {
//     return SizedBox(
//       width: double.maxFinite,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CustomIconButton(
//               height: 68.h,
//               width: 68.h,
//               padding: EdgeInsets.all(10.h),
//               decoration: IconButtonStyleHelper.none,
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgClose24dp0000,
//               )),
//           CustomIconButton(
//               height: 68.h,
//               width: 68.h,
//               padding: EdgeInsets.all(10.h),
//               decoration: IconButtonStyleHelper.none,
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgCamera24dp0000,
//               ))
//         ],
//       ),
//     );
//   }
// }
