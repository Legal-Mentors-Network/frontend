import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoNotifier extends Notifier<Map<int, XFile>> {
  @override
  Map<int, XFile> build() {
    return {};
  }

  void addImage(int id, XFile image) {
    state = {...state, id: image};
  }
}

final imagesProvider = NotifierProvider<UploadPhotoNotifier, Map<int, XFile>>(
  UploadPhotoNotifier.new,
);
