// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vexora_fe/data/models/History/history_model.dart';
// import '../../../blocs/history/history_bloc.dart';
// import '../../../blocs/history/history_state.dart';
// import '../../../core/app_export.dart';
// import '../../../widget/custom_elevated_button.dart';

// class HistorylistItemWidget extends StatelessWidget {
//   const HistorylistItemWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HistoryBloc, HistoryState>(
//       listener: (context, state) {
//         if (state is HistoryFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Error: ${state.message}"),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is HistoryLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is HistoryFailure) {
//           return Center(
//             child: Text(
//               "Failed to load history: ${state.message}",
//               style: theme.textTheme.bodyLarge?.copyWith(color: Colors.red),
//             ),
//           );
//         } else if (state is HistorySuccess) {
//           final history = state.history;
//           return _buildHistoryItem(context, history);
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }

//   Widget _buildHistoryItem(BuildContext context, History history) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 14.h),
//       decoration: BoxDecoration(
//         color: theme.colorScheme.onPrimary,
//         borderRadius: BorderRadiusStyle.roundedBorder12,
//         boxShadow: [
//           BoxShadow(
//             color: appTheme.gray4007f.withOpacity(0.25),
//             spreadRadius: 2.h,
//             blurRadius: 2.h,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 14.h),
//               child: Row(
//                 children: [
//                   CustomImageView(
//                     imagePath: history.path, 
//                     width: 60.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 18.h),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 30.h,
//                             vertical: 2.h,
//                           ),
//                           decoration: BoxDecoration(
//                             color: theme.colorScheme.primary,
//                             borderRadius: BorderRadiusStyle.roundedBorder8,
//                           ),
//                           child: Text(
//                             history.mood,
//                             textAlign: TextAlign.left,
//                             style: theme.textTheme.labelLarge,
//                           ),
//                         ),
//                         SizedBox(height: 6.h),
//                         Row(
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.time,
//                               height: 14.h,
//                               width: 14.h,
//                             ),
//                             SizedBox(width: 2.h),
//                             Text(
//                               _formatDate(history.createdAt),
//                               style: theme.textTheme.labelMedium,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           CustomElevatedButton(
//             height: 40.h,
//             width: 114.h,
//             text: history.playlistName, 
//             leftIcon: Container(
//               margin: EdgeInsets.only(right: 2.h),
//               child: CustomImageView(
//                 imagePath: ImageConstant.headphoneIcon,
//                 height: 20.h,
//                 width: 20.h,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             buttonTextStyle: CustomTextStyles.labelLargePrimary,
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper untuk memformat tanggal
//   String _formatDate(DateTime dateTime) {
//     return "${dateTime.hour}:${dateTime.minute} ${dateTime.day} ${_monthToString(dateTime.month)} ${dateTime.year}";
//   }

//   // Helper untuk konversi bulan menjadi nama
//   String _monthToString(int month) {
//     const months = [
//       "January",
//       "February",
//       "March",
//       "April",
//       "May",
//       "June",
//       "July",
//       "August",
//       "September",
//       "October",
//       "November",
//       "December"
//     ];
//     return months[month - 1];
//   }
// }
