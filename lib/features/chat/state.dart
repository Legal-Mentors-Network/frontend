import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmn/models/attachment.dart';

final messageControllerProvider = Provider((ref) => TextEditingController());

class AttachmentNotifier extends Notifier<Attachment?> {
  @override
  Attachment? build() {
    return null;
  }

  void selectFile(XFile attachment) {
    state = Attachment.fromXFile(attachment);
  }
}

final attachmentProvider = NotifierProvider<AttachmentNotifier, Attachment?>(
  AttachmentNotifier.new,
);
