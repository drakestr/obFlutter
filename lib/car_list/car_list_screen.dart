import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/car_list/car_list_view_model.dart';
import 'package:ob_tj_day_one/car_list/card_list_car.dart';
import 'package:ob_tj_day_one/core/models/async_state.dart';

class CarListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _state = watch(carlistProvider);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text('Cars', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Container(
              height: 39,
              width: 39,
              margin: EdgeInsets.only(right: 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff2A3640),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image/user.png",
                    height: 24,
                    width: 24,
                  )
                ],
              ))
        ],
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: (_state is Success)
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: _state.data.length,
              itemBuilder: (BuildContext contex, int index) {
                return CarListItem(car: _state.data[index], index: index);
              },
            )
          : CircularProgressIndicator(),
    );
  }
}
