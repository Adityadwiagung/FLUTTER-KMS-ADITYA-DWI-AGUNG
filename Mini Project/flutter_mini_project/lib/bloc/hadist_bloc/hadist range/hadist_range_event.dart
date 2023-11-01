part of 'hadist_range_bloc.dart';

sealed class HadistRangeEvent extends Equatable {
  const HadistRangeEvent();

}

class GetHaditsRangeEvent extends HadistRangeEvent {
  final String person;
  final int firstRange;
  final int lastRange;

  const GetHaditsRangeEvent({
    required this.person,
    required this.firstRange,
    required this.lastRange
  });
  @override
  List<Object> get props => [firstRange, lastRange];
}