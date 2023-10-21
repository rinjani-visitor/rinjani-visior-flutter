import 'dart:io';
import 'dart:typed_data';

/// Get image extension name from image file.
String getImageExtensionName(File imageFile) {
  final path = imageFile.path;
  final extensionName = path.split('.').last;
  return extensionName;
}

Future<Uint8List> getImageToBytes(File imageFile) async {
  final bytes = await imageFile.readAsBytes();
  return Uint8List.fromList(bytes);
}

/// Get image file from image bytes.
///
/// `fileExtension` is optional, default value is `jpg`.
Future<File> getImageToFile(Uint8List bytes,
    {String fileExtension = "jpg"}) async {
  final tempDir = await Directory.systemTemp.createTemp();
  final imageFile = File('${tempDir.path}/image.$fileExtension');
  await imageFile.writeAsBytes(bytes);
  return imageFile;
}
