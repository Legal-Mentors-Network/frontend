import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmn/common/components/button/app_button.dart';
import 'package:lmn/common/components/upload_photo/upload_photo_bottom_sheet.dart';
import 'package:lmn/common/controllers/application_controller.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/router/routes.dart';

class ProfileUploadPhoto extends StatefulWidget {
  const ProfileUploadPhoto({super.key});

  @override
  State<ProfileUploadPhoto> createState() => _ProfileUploadPhotoState();
}

class _ProfileUploadPhotoState extends State<ProfileUploadPhoto> {
  Map<int, File> images = {};

  void showOptions(int index) {
    final colorScheme = Theme.of(context).colorScheme;

    Future<void> uploadImage(ImageSource imageSource) async {
      debugPrint("uploadImage");
      await ApplicationController.selectImage(imageSource).then((image) {
        if (image == null) return;

        setState(() {
          images[index] = image;
        });

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      });
    }

    showModalBottomSheet(
      backgroundColor: colorScheme.primaryContainer,
      shape: const BeveledRectangleBorder(),
      context: context,
      builder: (context) => UploadPhotoBottomSheet(callback: uploadImage),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget backButton = IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () => context.pop(),
    );

    return Scaffold(
      appBar: AppBar(
        leading: backButton,
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: xl, vertical: md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              const SizedBox(height: sm),

              Text(
                'Add Photos',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: xl),

              const Text(
                'Upload photos from gallery or use camera',
              ),

              const SizedBox(height: md),

              Text(
                '• Select a block below to replace it with an image',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              Text(
                '• You can select up to 4 images',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: xl),

              Flexible(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: md,
                    crossAxisSpacing: md,
                  ),
                  itemBuilder: (context, index) {
                    final File? currentImage = images[index];

                    if (currentImage == null) {
                      return GestureDetector(
                        onTap: () => showOptions(index),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(md),
                            ),
                          ),
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: () => showOptions(index),
                      child: SizedBox.expand(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(md)),
                          child: Image.file(
                            currentImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              FullWidthButton(
                callback: () {
                  // save photo/s to local table
                  // upload photo/s to cloud storage
                  // upload all profile information to api
                  // set onboarding flag to false in pocketbase
                  // remove last profile screen string from local database
                  // start matching user in the background
                  context.go(Routes.home.path);
                },
                text: 'Finish',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
