import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mini_project/model/hadist_model/hadist_range_model.dart';
import 'package:flutter_mini_project/service/lokal_service/hadist_service.dart';

part 'hadist_range_event.dart';
part 'hadist_range_state.dart';

class HadistRangeBloc extends Bloc<HadistRangeEvent, HadistRangeState> {

  HadistRangeBloc() : super(HadistRangeLoading()) {
    on<GetHaditsRangeEvent>((event, emit) async{
      try {
        emit(HadistRangeLoading());
        final data =
          await HadistService().getHadistRange(person : event.person, firstRange : event.firstRange, lastRange: event.lastRange);
          emit(HadistRangeLoaded(hadistRangeModel: data));
      } catch (e) {
        emit(
          const HadistRangeError(
            messageError: 'Gagal Memuat Surah')
            );
      }
    });
  }
}

