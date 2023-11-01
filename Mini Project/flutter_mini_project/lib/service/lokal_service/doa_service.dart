import 'package:dio/dio.dart';
import 'package:flutter_mini_project/model/doa_model/doa_data_model.dart';

class DoaService {
  Future<DoaDataModel> getDoaList() async {
    try {
      final response = await Dio().get(
        'https://doa-doa-api-ahmadramadhan.fly.dev/api/'
        );

        return DoaDataModel.fromJson(response.data);

    } catch (e) {

      throw '$e';
    }
  }

    Future<DoaDataModel> getDoaDetail({required String idDetail}) async {
    try {
      final response = await Dio().get(
        'https://doa-doa-api-ahmadramadhan.fly.dev/api/$idDetail'
        );
        

        return DoaDataModel.fromJson(response.data);

    } catch (e) {
      throw '$e';
    }
  }

}