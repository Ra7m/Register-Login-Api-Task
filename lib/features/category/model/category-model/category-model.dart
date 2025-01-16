// ignore_for_file: file_names

import 'package:regapi_1/features/category/model/category-model/rating-model.dart';



class CategoryModel {
  final int id;
  final String title;
  final String category;
  final String description;
  final String image;
  final RatingModel rating;
  final num price;

  CategoryModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
      price: json['price'],
    );
  }
}

