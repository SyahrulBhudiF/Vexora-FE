import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/UserProfile/userProfile_bloc.dart';
import 'package:vexora_fe/blocs/UserProfile/userProfile_state.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vexora_fe/data/models/dto/Request/userProfileUpdate_dto.dart';
import 'dart:io';
import 'package:vexora_fe/widget/app_bar/appbar_title.dart';
import 'package:vexora_fe/widget/app_bar/custom_app_bar.dart';
import 'package:vexora_fe/widget/custom_elevated_button.dart';
import 'package:vexora_fe/widget/custom_text_form_field.dart';

import '../../blocs/UserProfile/userProfile_event.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameInputController = TextEditingController();
  TextEditingController usernameInputController = TextEditingController();
  File? _profileImage; // Menyimpan gambar profil yang dipilih

  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Form(
            child: Container(
              width: double.maxFinite,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      height: 84.0,
                      width: 84.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42.0),
                        border: Border.all(
                          color: theme.colorScheme.primary,
                          width: 1.0,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          _profileImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Image.file(
                                    _profileImage!,
                                    fit: BoxFit.cover,
                                    height: 80.0,
                                    width: 80.0,
                                  ),
                                )
                              : CustomImageView(
                                  imagePath: ImageConstant.playlist,
                                  height: 80.0,
                                  width: 80.0,
                                  radius: BorderRadius.circular(40.0),
                                ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap:
                                  _pickImage, // Menambahkan aksi untuk memilih gambar
                              child: Container(
                                height: 30.0,
                                width: 30.0,
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    shape: BoxShape.circle),
                                child: CustomImageView(
                                  imagePath: ImageConstant.addPhoto,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  _buildProfileForm(context),
                  SizedBox(
                    height: 68.h,
                  ),
                  _buildSaveButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 55.0,
      leadingWidth: 48.0,
      leading: CustomImageView(
        color: Colors.black,
        imagePath: ImageConstant.arrowLeft,
        margin: const EdgeInsets.only(left: 24.0, top: 20.0),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Edit Profile",
      ),
    );
  }

  Widget _buildNameInput(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoaded) {
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CustomTextFormField(
              controller: state.user.name != null
                  ? TextEditingController(text: state.user.name!)
                  : TextEditingController(),
              fillColor: Colors.white,
              hintText: 'Enter your name',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoaded) {
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CustomTextFormField(
              controller: state.user.email != null
                  ? TextEditingController(text: state.user.email!)
                  : TextEditingController(),
              fillColor: Colors.white,
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              enabled: false, // Menonaktifkan input form
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildUsernameInput(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoaded) {
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CustomTextFormField(
              controller: state.user.username != null
                  ? TextEditingController(text: state.user.username!)
                  : TextEditingController(),
              fillColor: Colors.white,
              hintText: "Enter your username",
              textInputAction: TextInputAction.done,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildProfileForm(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 6.0),
          _buildNameInput(context),
          const SizedBox(height: 18.0),
          Text(
            "Email",
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 6.0),
          _buildEmailInput(context),
          const SizedBox(height: 18.0),
          Text(
            "Username",
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8.0),
          _buildUsernameInput(context),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return BlocConsumer<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile updated successfully')),
          );
        } else if (state is UserProfileUpdateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed to update profile: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
        if (state is UserProfileLoading || state is UserProfileUpdating) {
          return const Center(child: CircularProgressIndicator());
        }

        return CustomElevatedButton(
          text: "Save",
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          buttonStyle: CustomButtonStyles.fillPrimary,
          onPressed: () {
            // Validasi gambar profil, pastikan gambar sudah dipilih
            if (_profileImage == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please select a profile picture')),
              );
              return;
            }

            // Buat DTO untuk memperbarui profil
            final userProfileUpdateDto = UserUpdateRequestDto(
              name: nameInputController.text,
              username: usernameInputController.text,
              profilePicture: _profileImage!,
            );

            // Kirim event untuk memperbarui profil
            context.read<UserProfileBloc>().add(
                  UpdateUserProfile(userProfileUpdateDto: userProfileUpdateDto),
                );
            // Kirim event untuk memperbarui foto profil
            context.read<UserProfileBloc>().add(
                  UpdateUserProfilePicture(profilePicture: _profileImage!),
                );
          },
        );
      },
    );
  }
}
