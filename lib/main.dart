import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/ScanFace/scanFace_bloc.dart';
import 'package:vexora_fe/blocs/UserProfile/userProfile_event.dart';
import 'package:vexora_fe/blocs/auth/auth_bloc.dart';
import 'package:vexora_fe/blocs/history/history_bloc.dart';
import 'package:vexora_fe/blocs/history/history_event.dart';
import 'package:vexora_fe/blocs/music/music_bloc.dart';
import 'package:vexora_fe/blocs/reset_password/resetpass_bloc.dart';
import 'package:vexora_fe/controller/auth_controller.dart';
import 'package:vexora_fe/controller/change_password_controller.dart';
import 'package:vexora_fe/controller/history_controller.dart';
import 'package:vexora_fe/controller/resetpass_controller.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'blocs/UserProfile/userProfile_bloc.dart';
import 'blocs/random_recommendations/randomRec_bloc.dart';
import 'blocs/random_recommendations/randomRec_event.dart';
import 'blocs/topmood/topmood_bloc.dart';
// import 'blocs/topmood/topmood_event.dart';
import 'controller/randomRecommendations_controller.dart';
import 'blocs/password/password_bloc.dart';
import 'controller/scanFace_controller.dart';
import 'controller/userProfile_controller.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                authController: AuthController(),
              ),
            ),
            BlocProvider(
              create: (context) => UserProfileBloc(
                userProfileController: UserProfileController(),
              )..add(FetchUserProfile()),
            ),
            BlocProvider(
              create: (context) => PlaylistBloc(
                playlistController: PlaylistController(),
              )..add(LoadPlaylistsEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  PasswordBloc(passwordController: ChangePasswordController()),
            ),
            BlocProvider(
              create: (context) => ResetPasswordBloc(
                  resetpasswordController: ResetPasswordController()),
            ),
            BlocProvider(
              create: (context) =>
                  HistoryBloc(historyController: HistoryController())
                    ..add(HistoryGetEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  ScanFaceBloc(scanFaceController: ScanFaceController()),
            ),
            BlocProvider(
              create: (context) =>
                  MusicBloc(historyController: HistoryController()),
            ),
            BlocProvider(
              create: (context) => MostMoodBloc(
                historyController: HistoryController(),
              ),
            ),
          ],
          child: MaterialApp(
            theme: theme,
            title: 'Vexora',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            routes: AppRoutes.routes,
          ),
        );
      },
    );
  }
}
