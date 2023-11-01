import 'package:dio/dio.dart';
import 'package:flutter_mini_project/model/hadist_model/hadist_data_model.dart';
import 'package:flutter_mini_project/model/hadist_model/hadist_range_model.dart';

class HadistService {
  Future<HadistDataModel> getHadistList() async {
      try {
        final response = await Dio().get(
          'https://api.hadith.gading.dev/books'
          );

          return HadistDataModel.fromJson(response.data);

      } catch (e) {
        rethrow;
      }
    }

  Future<HadistRangeModel> getHadistRange({person, firstRange, lastRange,}) async {
    try {
      final response = await Dio().get(
        'https://api.hadith.gading.dev/books/$person?range=$firstRange-$lastRange'
        );

        return HadistRangeModel.fromJson(response.data);

    } catch (e) {
      throw '$e';
    }
  }
    
}