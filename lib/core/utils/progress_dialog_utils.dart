// import 'package:flutter/material.dart';
// import './navigator_service.dart';

// class ProgressDialogUtils {
//   static bool isProgressVisible = false;

//   static void showProgressDialog(
//       {BuildContext? context, bool isCancelable = false}) async {
//     if (!isProgressVisible &&
//         NavigatorService.navigatorKey.currentState?.overlay?.context != null) {
//       showDialog(
//           barrierDismissible: isCancelable,
//           context: NavigatorService.navigatorKey.currentState!.overlay!.context,
//           builder: (BuildContext context) {
//             return const Center(
//               child: CircularProgressIndicator.adaptive(
//                 strokeWidth: 4,
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               ),
//             );
//           });
//       isProgressVisible = true;
//     }
//   }

//   static void hideProgressDialog() {
//     if (isProgressVisible) {
//       Navigator.of(
//           NavigatorService.navigatorKey.currentState!.overlay!.context);
//       isProgressVisible = false;
//     }
//   }
// }
