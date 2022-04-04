import 'package:flutter/cupertino.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({Key? key, required this.name}) : super(key: key);

  String name= "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(name)),
      height: 200,
    );
  }
}
