part of 'quran_detail_bloc.dart';

sealed class QuranDetailState extends Equatable {
  const QuranDetailState();
  
}

final class QuranDetailLoading extends QuranDetailState {
   @override
  List<Object> get props => [];
}

final class QuranDetailLoaded extends QuranDetailState {
  final QuranDetailDataModel dataDetailModel;
  const QuranDetailLoaded({required this.dataDetailModel});
  @override
  List<Object> get props => [];
}

final class QuranDetailEmpty extends QuranDetailState {
   @override
  List<Object> get props => [];
}

final class QuranDetailError extends QuranDetailState {
  final String messageError;
  const QuranDetailError({required this.messageError});
  @override
  List<Object> get props => [];
}