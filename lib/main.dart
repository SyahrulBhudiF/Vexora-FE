import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/auth/auth_bloc.dart';
import 'package:vexora_fe/controller/auth_controller.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'blocs/UserProfile/userProfile_bloc.dart';
import 'blocs/random_recommendations/randomRec_bloc.dart';
import 'blocs/random_recommendations/randomRec_event.dart';
import 'controller/randomRecommendations_controller.dart';
import 'controller/userProfile_controller.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
              ),
            ),
            BlocProvider(
              create: (context) => PlaylistBloc(
                playlistController: PlaylistController(),
              )..add(LoadPlaylistsEvent()),
            ),
          ],
          child: MaterialApp(
            theme: theme,
            title: 'Vexora',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.login,
            routes: AppRoutes.routes,
          ),
        );
      },
    );
  }
}
