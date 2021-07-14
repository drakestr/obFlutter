import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/car_detail/car_detail_view_model.dart';
import 'package:ob_tj_day_one/core/models/async_state.dart';

class CarDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;

    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => context.read(carDetailProvider.notifier).getNewCarDetail(index));

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => {
            Navigator.pushReplacementNamed(context, "/carList"),
          },
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
            ),
          )
        ],
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final _state = watch(carDetailProvider);

          return (_state is Success)
              ? Column(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          // margin: EdgeInsets.only(bottom: 37),
                          // height: 288,
                          // width: 375,
                          child: Image.asset(_state.data.asset),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                        flex: 6,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 30, top: 30, right: 30, bottom: 10),
                            decoration: BoxDecoration(
                                color: Color(_state.data.color),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _state.data.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 39,
                                        color: Colors.white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => context
                                          .read(carDetailProvider.notifier)
                                          .handleFavorite(index),
                                      child: Icon(
                                        _state.data.favorited
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        size: 33,
                                        color: _state.data.favorited
                                            ? Colors.yellow
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  _state.data.price,
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  width: 315,
                                  child: Text(
                                    "Wanna ride the coolest sport car in the world?",
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                    onTap: () => {
                                          Navigator.pushNamed(
                                              context, '/carDetail')
                                        },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      height: 57,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      child: Text("Book Now",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    )),
                              ],
                            )))
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
