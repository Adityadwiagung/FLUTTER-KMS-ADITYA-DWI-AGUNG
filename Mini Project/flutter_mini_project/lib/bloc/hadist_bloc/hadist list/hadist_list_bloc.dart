import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mini_project/model/hadist_model/hadist_data_model.dart';
import 'package:flutter_mini_project/service/lokal_service/hadist_service.dart';

part 'hadist_list_event.dart';
part 'hadist_list_state.dart';

class HadistListBloc extends Bloc<HadistListEvent, HadistListState> {
  HadistListBloc() : super(HadistListLoading()) {
    on<GetHadistEvent>(
      (event, emit) async {
        try {
          emit(HadistListLoading());
        final hadist = await HadistService().getHadistList();
        
        if (hadist.data.isNotEmpty) {
          emit(HadistListLoaded(hadist: hadist));
        } else {
          emit(HadistListEmpty());
        }
        } catch (e) {
          emit(
            const HadistListError(
              messageError: "Gagal memuat hadist")
          );
        }
    });
  }
}
