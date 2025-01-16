// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:bloc/bloc.dart';
import 'package:regapi_1/features/category/cubit/category-state.dart';
import 'package:regapi_1/features/category/model/data/category-data.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryData) : super(CategoryInitial());

  final CategoryData categoryData;
  getDataCubit({required String endPoint}) async {
    emit(CategoryLoading());
    var success = await categoryData.getData(endPoint: endPoint);
    emit(CategorySuccess(model: success));
  }
}