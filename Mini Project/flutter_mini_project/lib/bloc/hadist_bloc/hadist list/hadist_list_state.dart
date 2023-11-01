part of 'hadist_list_bloc.dart';

sealed class HadistListState extends Equatable {
  const HadistListState();
  
  @override
  List<Object> get props => [];
}

final class HadistListLoading extends HadistListState {
    
  @override
  List<Object> get props => [];
}

final class HadistListLoaded extends HadistListState {
  final HadistDataModel hadist;
  const HadistListLoaded({required this.hadist});

  @override
  List<Object> get props => [hadist];
}

final class HadistListEmpty extends HadistListState {
  @override
  List<Object> get props => [];
}

final class HadistListError extends HadistListState{
  final String messageError;
  const HadistListError({required this.messageError});

  @override
  List<Object> get props => [];
}

