import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mini_project/model/quran_model/quran_data_model.dart';
import 'package:flutter_mini_project/service/lokal_service/quran_service.dart';

part 'quran_list_event.dart';
part 'quran_list_state.dart';

class QuranListBloc extends Bloc<QuranListEvent, QuranListState> {
  QuranListBloc() : super(QuranListLoading()) {
    on<GetQuranEvent>(
      (event, emit) async{
      try {
        emit(QuranListLoading());
        final quran = await QuranService().getQuranList();
        
        if (quran.results.isNotEmpty) {
          emit(QuranListLoaded(quran: quran));
        } else {
          emit(QuranListEmpty());
        }

      } catch (e) {
        emit(
          const QuranListError(
            messageError: 'Gagal memuat Al-Quran')
        );
      }
    });
  }
  
}
