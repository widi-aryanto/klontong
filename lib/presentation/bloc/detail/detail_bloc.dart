import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:klontong/data/model/data_model.dart';
import 'package:klontong/domain/usecase/detail.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailUsecase usecase;

  DetailBloc({
    required this.usecase,
  }) : super(DetailInitial()) {
    on<DetailData>((event, emit) async {
      emit(
        DetailLoading(),
      );
      final data = event.id;
      final result = await usecase.getData(data);
      result.fold((failure) => emit(DetailError(failure.message)), (success) {
          if (success.status == "success") {
            emit(DetailLoaded(success.data, success.message));
          } else {
            emit(DetailNoData(success.status));
          }
        },
      );
    });
  }
}