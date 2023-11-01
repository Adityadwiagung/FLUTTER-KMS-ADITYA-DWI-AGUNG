part of 'quran_detail_bloc.dart';

sealed class QuranDetailEvent extends Equatable {
  const QuranDetailEvent();
}

class GetQuranDetailEvent extends QuranDetailEvent{
  final String idQuran;
  
  const GetQuranDetailEvent({required this.idQuran});
  
  @override
  List<Object> get props => [idQuran];
}
