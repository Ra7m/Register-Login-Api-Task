
// ignore_for_file: file_names

import 'package:regapi_1/features/category/model/category-model/category-model.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
  final List<CategoryModel> model;
  CategorySuccess( {required this.model});
} 

final class CategoryError extends CategoryState {
  final String error;
  CategoryError({required this.error});
}