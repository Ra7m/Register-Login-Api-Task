// ignore_for_file: non_constant_identifier_names

import 'package:regapi_1/features/catog/moddel/model.dart';

sealed class lapState {}

final class lapInitial extends lapState {}

final class lapLoadingState extends lapState {}

final class lapSucessState extends lapState {

  final List<LapHomeModel> lapHomeModel;
  lapSucessState({required this.lapHomeModel});
}



