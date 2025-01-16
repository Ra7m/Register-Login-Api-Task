import 'package:flutter/material.dart';
import 'package:regapi_1/features/category/view/screen/category-screen.dart';


class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.endPoint,
      required this.icon,
      required this.text});
  final String endPoint;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              endPoint: endPoint,
              title: text,
            ),
          ),
        );
      },
      child: Card(
          elevation: 2,
          child: ListTile(
            leading: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            trailing: Text(
              icon,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          )),
    ));
  }
}