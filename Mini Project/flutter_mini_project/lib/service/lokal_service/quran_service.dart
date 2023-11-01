import 'package:dio/dio.dart';
import 'package:flutter_mini_project/model/quran_model/quran_data_model.dart';
import 'package:flutter_mini_project/model/quran_model/quran_detail_data_model.dart';

class QuranService {
  Future<QuranDataModel> getQuranList() async {
    try {
      final response = await Dio().get(
        'https://quran-api.santrikoding.com/api/surah'
        );

        return QuranDataModel.fromJson(response.data);

    } catch (e) {
      throw '$e';
    }
  }
  
  Future<QuranDetailDataModel> getQuranDetail({required String idDetail}) async {
    try {
      final response = await Dio().get(
        'https://quran-api.santrikoding.com/api/surah/$idDetail'
        );

        return QuranDetailDataModel.fromJson(response.data);

    } catch (e) {
      throw '$e';
    }
  }
}