// ignore_for_file: depend_on_referenced_packages, unnecessary_import, unused_import

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:regapi_1/features/cart/cubit/cart_state.dart';
import 'package:regapi_1/features/cart/data/cart-data.dart';


class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);
  Cartdata cartData = Cartdata();
  addCartCubit(dynamic id) async {
    emit(CartloadingInitial());
    Cartdata.addCart(id: id);
    emit(CartsucessInitial());
  }
}