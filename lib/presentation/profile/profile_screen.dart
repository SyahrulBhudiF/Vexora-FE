import 'package:flutter/material.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:vexora_fe/widget/app_bar/appbar_title.dart';
import 'package:vexora_fe/widget/app_bar/custom_app_bar.dart';
import 'package:vexora_fe/widget/custom_elevated_button.dart';
import 'package:vexora_fe/widget/custom_text_form_field.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
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
        body: Form(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
                              padding: EdgeInsets.all(4.0),
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
                SizedBox(height: 30.0),
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
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 55.0,
      leadingWidth: 48.0,
      leading: CustomImageView(
        color: Colors.black,
        imagePath: ImageConstant.arrowLeft,
        margin: EdgeInsets.only(left: 24.0, top: 20.0),
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
    return Padding(
      padding: EdgeInsets.only(right: 4.0),
      child: CustomTextFormField(
        controller: nameInputController,
        fillColor: Colors.white,
        hintText: "Enter your name",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.0),
      child: CustomTextFormField(
        controller: emailInputController,
        fillColor: Colors.white,
        hintText: "Enter your email",
        textInputType: TextInputType.emailAddress,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),
      ),
    );
  }

  Widget _buildUsernameInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.0),
      child: CustomTextFormField(
        controller: usernameInputController,
        fillColor: Colors.white,
        hintText: "Enter your username",
        textInputAction: TextInputAction.done,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.0),
          _buildNameInput(context),
          SizedBox(height: 18.0),
          Text(
            "Email",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.0),
          _buildEmailInput(context),
          SizedBox(height: 18.0),
          Text(
            "Username",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 8.0),
          _buildUsernameInput(context),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Save",
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}
