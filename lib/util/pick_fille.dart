import 'package:image_picker/image_picker.dart';

class PickFile {
  final ImagePicker picker = ImagePicker();

  // pick image
  Future<String?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.path;
    }
    return null;
  }

// pick video
  Future<String?> pickVideo() async {
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      return video.path;
    }
    return null;
  }
}
