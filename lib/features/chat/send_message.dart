import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmn/common/components/upload_photo/upload_photo_bottom_sheet.dart';
import 'package:lmn/common/controllers/application_controller.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/chat/state.dart';
import 'package:lmn/state/message.dart';

class SendMessage extends ConsumerWidget {
  const SendMessage({
    super.key,
    required this.conversationId,
  });

  final String conversationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendMessage = ref.read(messageProvider(conversationId).notifier).sendMessage;
    final messageController = ref.read(messageControllerProvider);

    final textColor = context.colors.onPrimaryContainer.withOpacity(0.7);

    void submitMessage() {
      final file = ref.read(attachmentProvider);
      if (messageController.text.isEmpty && file == null) {
        return;
      }

      sendMessage(
        message: messageController.text,
        conversationId: conversationId,
        file: file,
      );

      messageController.clear();
      ref.read(attachmentProvider.notifier).clear();
    }

    void showOptions() {
      Future<void> uploadImage(ImageSource imageSource) async {
        final image = await ApplicationController.selectImage(imageSource);
        if (image == null) return;

        ref.read(attachmentProvider.notifier).selectFile(image);
        if (context.mounted) Navigator.pop(context);
      }

      showModalBottomSheet(
        backgroundColor: context.colors.primaryContainer,
        shape: const BeveledRectangleBorder(),
        context: context,
        builder: (context) => UploadPhotoBottomSheet(callback: uploadImage),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: sm, vertical: sm),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add, size: mx),
            color: textColor,
            onPressed: showOptions,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: md),
              child: TextField(
                controller: messageController,
                cursorColor: textColor,
                autocorrect: false,
                onEditingComplete: submitMessage,
                style: TextStyle(color: context.colors.onPrimaryContainer),
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  hintText: "Type a message",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: textColor),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: textColor,
            onPressed: submitMessage,
          ),
        ],
      ),
    );
  }
}
