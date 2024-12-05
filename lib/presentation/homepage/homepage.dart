// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:vexora_fe/presentation/scan/scan.dart';
// import 'package:vexora_fe/routes/app_routes.dart';
// import '../../core/app_export.dart';
// import '../../widget/custom_buttom_app_bar.dart';
// import '../../widget/custom_floating_button.dart';
// import 'homepage_initial.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         extendBodyBehindAppBar: true,
//         body: Container(
//           width: double.maxFinite,
//           height: SizeUtils.height,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment(0.5, 0),
//               end: Alignment(0.5, 0.89),
//               colors: [theme.colorScheme.primary, appTheme.purple100],
//             ),
//           ),
//           child: Navigator(
//             key: navigatorKey,
//             initialRoute: AppRoutes.homepageInitial,
//             onGenerateRoute: (routeSetting) => PageRouteBuilder(
//               pageBuilder: (ctx, ani, ani1) =>
//                   getCurrentPage(routeSetting.name!),
//               transitionDuration: Duration(seconds: 0),
//             ),
//           ),
//         ),
//         bottomNavigationBar: SizedBox(
//           width: double.maxFinite,
//           child: _buildBottomNavigation(context),
//         ),
//         floatingActionButton: CustomFloatingButton(
//           onTap: () {
//             Navigator.pushNamed(navigatorKey.currentContext!,
//                 AppRoutes.scan); // This should now work
//           },
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       ),
//     );
//   }

//   // Section Widget
//   // Widget _buildBottomNavigation(BuildContext context) {
//   //   return SizedBox(
//   //       width: double.maxFinite,
//   //       child: CustomBottomAppBar(onChanged: (BottomBarEnum type) {
//   //         Navigator.pushNamed(
//   //             navigatorKey.currentContext!, getCurrentRoute(type));
//   //       }));
//   // }

//   // String getCurrentRoute(BottomBarEnum type) {
//   //   switch (type) {
//   //     case BottomBarEnum.Home:
//   //       return AppRoutes.homepageInitial;
//   //     case BottomBarEnum.More:
//   //       return "/";
//   //     default:
//   //       return "/";
//   //   }
//   // }

//   // // Handling page based on route
//   // Widget getCurrentPage(String currentRoute) {
//   //   switch (currentRoute) {
//   //     case AppRoutes.homepageInitial:
//   //       return HomepageInitial();
//   //     case AppRoutes.scan:
//   //       return ScanScreen();
//   //     default:
//   //       return DefaultWidget();
//   //   }
//   // }
// }
