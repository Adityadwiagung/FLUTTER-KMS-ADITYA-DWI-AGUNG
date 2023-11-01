part of 'doa_list_bloc.dart';

sealed class DoaListState extends Equatable {
  const DoaListState();
  
  @override
  List<Object> get props => [];
}

final class DoaListLoading extends DoaListState {
  @override
  List<Object> get props => [];
}

final class DoaListLoaded extends DoaListState {
  final DoaDataModel doaModel;
  const DoaListLoaded({required this.doaModel});
  @override
  List<Object> get props => [];
}

final class DoaListEmpty extends DoaListState {
  @override
  List<Object> get props => [];
}

final class DoaListError extends DoaListState {
  final String messageError;
  const DoaListError({required this.messageError});
  @override
  List<Object> get props => [];
}




final class DoaDetailLoading extends DoaListState {
  @override
  List<Object> get props => [];
}

final class DoaDetailLoaded extends DoaListState {
  final DoaDataModel doaModel;
  const DoaDetailLoaded({required this.doaModel});
  @override
  List<Object> get props => [];
}

final class DoaDetailEmpty extends DoaListState {
  @override
  List<Object> get props => [];
}

final class DoaDetailError extends DoaListState {
  final String messageError;
  const DoaDetailError({required this.messageError});
  @override
  List<Object> get props => [];
}
