// import 'dart:io';
// import 'package:dio/dio.dart';

// Future<void> uploadImage(String filePath) async {
//   Dio dio = Dio();
//   String url = 'https://upload.imagekit.io/api/v1/files/upload';
  
//   // Формируем FormData для отправки файла и данных
//   FormData formData = FormData.fromMap({
//     'file': await MultipartFile.fromFile(filePath, filename: 'my_image.jpg'),
//     'publicKey': 'your_public_key', // Замените на ваш публичный ключ
//     'signature': 'generated_signature', // Подпись, сгенерированная на сервере
//     'expire': 'timestamp', // Время истечения подписи
//   });

//   try {
//     // Отправляем POST запрос
//     Response response = await dio.post(url, data: formData);
//     if (response.statusCode == 200) {
//       print('Upload successful: ${response.data}');
//     } else {
//       print('Failed to upload image: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error uploading image: $e');
//   }
// }