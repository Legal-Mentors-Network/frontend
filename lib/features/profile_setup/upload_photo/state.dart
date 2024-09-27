import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadPhotoNotifier extends Notifier<Map<int, File>> {
  @override
  Map<int, File> build() {
    return {};
  }

  void addImage(int id, File image) {
    state = {...state, id: image};
  }
}

final imagesProvider = NotifierProvider<UploadPhotoNotifier, Map<int, File>>(
  UploadPhotoNotifier.new,
);
