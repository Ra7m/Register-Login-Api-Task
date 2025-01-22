import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regapi_1/features/cart/cubit/cart_cubit.dart';
import 'package:regapi_1/features/catog/cubit/catog_cubit.dart';
import 'package:regapi_1/features/catog/cubit/catog_state.dart';

class HomeLapScreen extends StatelessWidget {
  const HomeLapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => lapCubit()..getLap(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Laptop')),
        body: BlocBuilder<lapCubit, lapState>(
          builder: (context, state) {
            if (state is lapSucessState) {
              return Card(
                child: ListView.builder(
                    itemCount: state.lapHomeModel.length,
                    itemBuilder: (context, index) {
                      final lap = state.lapHomeModel[index];
                      return ListTile(
                        leading: Image.network(lap.image),
                        title: Row(children: [
                          Text(lap.name),
                          Spacer(),
                          IconButton(onPressed: (){
                            CartCubit.get(context).addCartCubit();
                          }, icon: Icon(Icons.add_shopping_cart_rounded)),
                        ]),
                        subtitle: Text(lap.description),
                      );
                    }),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
