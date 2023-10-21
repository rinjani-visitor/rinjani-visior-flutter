import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

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

/// Reduces the byte size of an image represented as a Uint8List
///
/// Returns a Future that completes with the reduced byte size Uint8List.
///
Future<File> reduceImageByteSize(File imageFile,
    {required int targetSizeInKB}) async {
  final bitmap = await getImageToBytes(imageFile);

  int quality = 100;
  int byteSize = bitmap.lengthInBytes;
  do {
    Uint8List compressedImage =
        await FlutterImageCompress.compressWithList(bitmap, quality: quality);
    byteSize = compressedImage.lengthInBytes;
    quality -= 5;
  } while (byteSize > targetSizeInKB * 1024);
  final image = await getImageToFile(bitmap,
      fileExtension: imageFile.path.split('.').last);
  return image;
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
