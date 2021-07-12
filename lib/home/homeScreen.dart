import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Beepy', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 77, bottom: 33),
              height: 319,
              width: 427,
              child: Image.asset("assets/image/imghome.png"),
            ),
            Text("Find Your Vehicle",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
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
            SizedBox(height: 77),
            InkWell(
                onTap: () => { Navigator.pushNamed(context, '/carDetail') },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
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
                )),
            SizedBox(height: 58),
          ],
        ),
      ),
    );
  }
}
