import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_tj_day_one/car_list/car_list_view_model.dart';
import 'package:ob_tj_day_one/core/models/item_cars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarListItem extends StatelessWidget{
  final ItemCars car;
  final int index;
  final TextStyle? textStyle;

  const CarListItem({Key? key, required this.car, required this.index, this.textStyle}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 305,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
          bottom: 47,
          left: 35,
          right: 35,
          top: index == 0 ? 47 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(car.color),
      ),
      child: InkWell(
        onTap: () => {
          Navigator.pushReplacementNamed(context, '/carDetail',
              arguments: index)
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              car.name,
              style: textStyle ?? TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              car.price,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  // height: MediaQuery.of(context).size.height,
                ),
                Positioned(
                    top: -15,
                    right: -20,
                    child: Container(
                      height: 124,
                      width: 200,
                      child: Image.asset(car.asset),
                    )),
              ],
            ),
            GestureDetector(
              // onTap: () => {},
              onTap: () => context
                  .read(carlistProvider.notifier)
                  .favorited(index),
              child: Icon(
                // Icons.star_outline_rounded,
                car.favorited
                    ? Icons.star_rounded
                    : Icons.star_outline_rounded,
                size: 33,
                // color: Colors.white,
                color: car.favorited
                    ? Colors.yellow
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  } 
}