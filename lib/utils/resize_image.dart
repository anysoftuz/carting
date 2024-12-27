import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

Future<File> resizeAndCompressImage(File imageFile, int targetSizeInBytes) async {
  try {
    // Fayldan rasmni yuklash
    final imageBytes = await imageFile.readAsBytes();
    final originalImage = img.decodeImage(imageBytes);

    if (originalImage == null) {
      throw Exception("Rasmni o'qib bo'lmadi.");
    }

    // Boshlang'ich o'lchamni belgilash
    int width = originalImage.width;
    int height = originalImage.height;

    // Siqish va o'lchamni o'zgartirish
    int quality = 90;
    Uint8List? compressedBytes;

    do {
      // Rasm o'lchamini o'zgartirish
      final resizedImage = img.copyResize(originalImage, width: width, height: height);

      // Rasmni siqish
      compressedBytes = Uint8List.fromList(
        img.encodeJpg(resizedImage, quality: quality),
      );

      // O'lchamlarni kamaytirish
      width = (width * 0.9).toInt();
      height = (height * 0.9).toInt();
      quality -= 10;
    } while (compressedBytes.length > targetSizeInBytes && quality > 0);

    // Siqilgan rasmni saqlash
    final resizedFile = File(imageFile.path.replaceFirst('.jpg', '_resized.jpg'));
    await resizedFile.writeAsBytes(compressedBytes);

    return resizedFile;
  } catch (e) {
    throw Exception("Rasmni o'lchash va siqishda xatolik yuz berdi: $e");
  }
}
