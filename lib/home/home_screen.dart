import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/core/provider/theme_provider.dart';
import 'package:ob_tj_day_one/home/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beepy', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Column(
          children: [
            SizedBox(height: 30,),
            Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/image/car_home.png"),
                ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text("Find Your Vehicle",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Container(
                      width: 264,
                      alignment: Alignment.center,
                      child: Text(
                        "Find the perfect vehicle for every occasion!",
                        maxLines: 2,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Consumer(builder: (context, watch, child) {
                      final _switchValue = watch(homeScreenProvider);
                      return Switch(
                        activeTrackColor: Color(0XFFEB5757),
                        activeColor: Colors.white,
                        value: _switchValue,
                        onChanged: (_switchValue) =>
                        {
                          context.read(homeScreenProvider.notifier).handleSwitch(),
                          if (_switchValue) {
                            context.read(themeProvider.notifier).setDark()
                          } else {
                            context.read(themeProvider.notifier).setLight()
                          }
                        },
                      );
                    }),
                    Consumer(builder: (context, watch, child) {
                      final _swithcValue = watch(homeScreenProvider);
                      return (
                          InkWell(
                              onTap: () => { Navigator.pushNamed(context, '/carList') },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _swithcValue ? Color(0XFF1814E4) : Color(0XFFFA7F35),
                                ),
                                height: 57,
                                width: 305,
                                padding:
                                EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: Text("Continue",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ))
                      );
                    }),

                  ],
            )),
          ],
        ),
    );
  }
}
