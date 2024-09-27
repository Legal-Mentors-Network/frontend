import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';

class UploadPhotoBottomSheet extends StatelessWidget {
  const UploadPhotoBottomSheet({
    super.key,
    required this.callback,
  });

  final void Function(ImageSource imageSource) callback;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;

    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: rl),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //
            Text(
              'Select image source',
              style: TextStyle(color: colorScheme.onSecondary),
            ),

            //
            Row(
              children: [
                IconButton(
                  onPressed: () => callback(ImageSource.camera),
                  icon: Icon(
                    Icons.photo_camera,
                    color: colorScheme.onSecondary,
                  ),
                ),
                IconButton(
                  onPressed: () => callback(ImageSource.gallery),
                  icon: Icon(
                    Icons.image,
                    color: colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
