import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/car_detail/car_detail_view_model.dart';
import 'package:ob_tj_day_one/car_list/car_list_view_model.dart';

class CarListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _state = watch(carlistProvider);
    context.read(carlistProvider.notifier).loadData();
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
              children: [Image.asset("assets/image/user.png", height: 24, width: 24,)],
            )
          )
        ],
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _state.length,
        itemBuilder: (BuildContext contex, int index) {
          return Container(
            height: 160,
            width: 305,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(
                bottom: 47, left: 35, right: 35, top: index == 0 ? 47 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(_state[index].color),
            ),
            child: InkWell(
              onTap: () => {
                context.read(carDetailProvider.notifier).getNewCarDetail(_state[index]),
                Navigator.pushNamed(context, '/carDetail')
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _state[index].name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    _state[index].price,
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
                            child: Image.asset(_state[index].asset),
                          )),
                    ],
                  ),
                  GestureDetector(
                    // onTap: () => {},
                    onTap: () =>
                        context.read(carlistProvider.notifier).favorited(index),
                    child: Icon(
                      // Icons.star_outline_rounded,
                      _state[index].favorited
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      size: 33,
                      // color: Colors.white,
                      color:
                      _state[index].favorited ? Colors.yellow : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
