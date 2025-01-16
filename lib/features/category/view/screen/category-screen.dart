import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regapi_1/features/category/cubit/category-cubit.dart';
import 'package:regapi_1/features/category/cubit/category-state.dart';
import 'package:regapi_1/features/category/model/data/category-data.dart';
import 'package:regapi_1/features/category/view/screen/login.dart';
import 'package:regapi_1/features/category/view/widgets/custom-appbar.dart';
import 'package:regapi_1/features/category/view/widgets/sucess-widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.endPoint, required this.title});

  final String endPoint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(CategoryData())..getDataCubit(endPoint: endPoint),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 170, 152),
        drawer: const Drawer(
          child: LoginScreen(),
        ),
        appBar: customAppBar(title: title),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategorySuccess) {
              return ListView.builder(
                itemCount: state.model.length,
                itemBuilder: (context, index) {
                  return SuccessWidgetProduct(
                    categoryModel: state.model[index],
                  );
                },
              );
            } else if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryError) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}