import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mini_project/model/quran_model/quran_detail_data_model.dart';
import 'package:flutter_mini_project/service/lokal_service/quran_service.dart';

part 'quran_detail_event.dart';
part 'quran_detail_state.dart';

class QuranDetailBloc extends Bloc<QuranDetailEvent, QuranDetailState> {
  QuranDetailBloc() : super(QuranDetailLoading()) {
    on<GetQuranDetailEvent>((event, emit) async{
      try {
        emit(QuranDetailLoading());
        final data =
          await QuranService().getQuranDetail(idDetail: event.idQuran);
          emit(QuranDetailLoaded(dataDetailModel: data));
      } catch (e) {
        emit(
          const QuranDetailError(
            messageError: 'Gagal Memuat Surah')
            );
      }
    });
  }
}
