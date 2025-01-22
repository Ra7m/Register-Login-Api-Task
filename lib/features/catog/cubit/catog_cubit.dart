import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regapi_1/features/catog/cubit/catog_state.dart';
import 'package:regapi_1/features/catog/data/data-lap.dart';

class lapCubit extends Cubit<lapState> {
  lapCubit() : super(lapInitial());
  final LapHomeData lapHomeData = LapHomeData();

  getLap() async {
    emit(lapLoadingState());
    var lapHomeData = await LapHomeData.getLap();
    emit(lapSucessState(lapHomeModel: lapHomeData));
  }
}
