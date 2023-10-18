import 'package:dio/dio.dart';

class DiceBearApi {
  Future<String> getDiceBear({
    required String avatarStyle,
  }) async {
    try {
      final response = await Dio().get(
      'https://api.dicebear.com/7.x/pixel-art/svg?seed=$avatarStyle'
      );
      return response.data as String;
    } catch (e) {
      throw Exception(e);
    }
  }
}