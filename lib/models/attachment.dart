import 'package:image_picker/image_picker.dart';

class Attachment {
  final String name;
  final String path;

  Attachment({required this.name, required this.path});

  factory Attachment.fromXFile(XFile file) {
    return Attachment(name: file.name, path: file.path);
  }
}
