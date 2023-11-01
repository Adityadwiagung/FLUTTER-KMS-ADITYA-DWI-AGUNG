import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mini_project/model/doa_model/doa_data_model.dart';
import 'package:flutter_mini_project/service/lokal_service/doa_service.dart';

part 'doa_list_event.dart';
part 'doa_list_state.dart';

class DoaListBloc extends Bloc<DoaListEvent, DoaListState> {
  DoaListBloc() : super(DoaListLoading()) {
    on<GetDoaListEvent>((event, emit) async {
      emit(DoaListLoading());
      try {
        final doaList = await DoaService().getDoaList();
        if (doaList.data.isNotEmpty) {
          emit(DoaListLoaded(doaModel: doaList));
        } else {
          emit(DoaListEmpty());
        }
      } catch (e) {
        emit(const DoaListError(messageError: 'Gagal memuat Doa'));
      }
    });

    on<GetDoaDetailEvent>((event, emit) async {
      emit(DoaDetailLoading());
      try {
        final doaDetail = await DoaService().getDoaDetail(idDetail: event.idDoa);
        if (doaDetail.data.isNotEmpty) {
          emit(DoaDetailLoaded(doaModel: doaDetail));
        } else {
          emit(DoaDetailEmpty());
        }
      } catch (e) {
        emit(const DoaDetailError(messageError: 'Gagal memuat detail doa'));
      }
    });
  }
}
