import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CarDetailState();
}

class CarDetailState extends State {
  bool _isLiked = false;

  void handleFavorite() {
    setState(() {
      if (_isLiked) {
        _isLiked = false;
      } else {
        _isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => {Navigator.pushNamed(context, '/')},
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text('Cars',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          Container(
            height: 39,
            width: 39,
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff2A3640),
            ),
            child: Image.asset("assets/image/user.png"),
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 45, bottom: 37),
              height: 288,
              width: 375,
              child: Image.asset("assets/image/carDetail.png"),
            ),
            Container(
                height: 385,
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 30),
                decoration: BoxDecoration(
                    color: Color(0xff60B5F4),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sport Car",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 39,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: handleFavorite,
                          child: Icon(
                            _isLiked
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            size: 33,
                            color: _isLiked ? Colors.yellow : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$55/day",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 38,
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
                      height: 14,
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
                      height: 38,
                    ),
                    InkWell(
                        onTap: () =>
                            {Navigator.pushNamed(context, '/carDetail')},
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: 57,
                          width: MediaQuery.of(context).size.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Text("Book Now",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
