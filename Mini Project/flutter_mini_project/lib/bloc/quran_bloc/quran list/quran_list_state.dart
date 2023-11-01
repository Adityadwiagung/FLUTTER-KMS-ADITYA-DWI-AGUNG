part of 'quran_list_bloc.dart';

sealed class QuranListState extends Equatable {
  const QuranListState();

}

final class QuranListLoading extends QuranListState {
    
  @override
  List<Object> get props => [];
}

final class QuranListLoaded extends QuranListState {
  final QuranDataModel quran;
  const QuranListLoaded({required this.quran});

  @override
  List<Object> get props => [quran];
}

final class QuranListEmpty extends QuranListState {
  @override
  List<Object> get props => [];
}

final class QuranListError extends QuranListState{
  final String messageError;
  const QuranListError({required this.messageError});

  @override
  List<Object> get props => [];
}
