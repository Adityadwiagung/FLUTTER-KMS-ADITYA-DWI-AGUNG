part of 'galery_bloc.dart';

abstract class GaleryState extends Equatable {
  const GaleryState();

  @override
  List<Object> get props => [];
}

class GaleryInitial extends GaleryState {}

class GaleryLoaded extends GaleryState {
  final List<String> images;

  const GaleryLoaded(this.images);

  @override
  List<Object> get props => [images];
}
