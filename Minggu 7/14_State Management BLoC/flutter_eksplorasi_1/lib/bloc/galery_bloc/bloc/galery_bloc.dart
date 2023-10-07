import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eksplorasi_1/constant/assets.dart';

part 'galery_event.dart';
part 'galery_state.dart';

class GaleryBloc extends Bloc<GaleryEvent, GaleryState> {
  GaleryBloc() : super(GaleryInitial()) {
    on<LoadImages>((event, emit) {
      final images = [
        Assets.assetsImagesGambar1,
        Assets.assetsImagesGambar2,
        Assets.assetsImagesGambar3,
        Assets.assetsImagesGambar4,
        Assets.assetsImagesGambar5,
        Assets.assetsImagesGambar6,
        Assets.assetsImagesGambar7,
        Assets.assetsImagesGambar8,
      ];

      emit(GaleryLoaded(images));
    });
  }
}
