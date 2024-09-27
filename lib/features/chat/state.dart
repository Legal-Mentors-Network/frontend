import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageControllerProvider = Provider((ref) => TextEditingController());

class AttachmentNotifier extends Notifier<File?> {
  @override
  File? build() {
    return null;
  }

  void selectFile(File attachment) {
    state = attachment;
  }
}

final attachmentProvider = NotifierProvider<AttachmentNotifier, File?>(
  AttachmentNotifier.new,
);
