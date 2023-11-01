part of 'doa_list_bloc.dart';

sealed class DoaListEvent extends Equatable {
  const DoaListEvent();
}

class GetDoaListEvent extends DoaListEvent{
  @override
  List<Object> get props => [];
}

class GetDoaDetailEvent extends DoaListEvent{
  final String idDoa;
  const GetDoaDetailEvent({required this.idDoa});
  
  @override
  List<Object> get props => [idDoa];
}
