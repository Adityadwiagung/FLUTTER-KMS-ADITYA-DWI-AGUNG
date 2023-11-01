part of 'hadist_range_bloc.dart';

sealed class HadistRangeState extends Equatable {
  const HadistRangeState();
  
}

final class HadistRangeLoading extends HadistRangeState {
    @override
  List<Object> get props => [];
}

final class HadistRangeLoaded extends HadistRangeState {
  final HadistRangeModel hadistRangeModel;
  const HadistRangeLoaded({required this.hadistRangeModel});
  @override
  List<Object> get props => [hadistRangeModel];
}

final class HadistRangeEmpty extends HadistRangeState {
   @override
  List<Object> get props => [];
}

final class HadistRangeError extends HadistRangeState {
  final String messageError;
  const HadistRangeError({required this.messageError});
  @override
  List<Object> get props => [];
}
