import 'package:flutter/material.dart';
import 'package:magang_3/page3.dart';

class Page2 extends StatelessWidget {
  String? name = '';
  String? username = '';
  Page2({super.key, this.name, this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            Center(
              child: Text(
                'Second Screen',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        elevation: 1,
        shadowColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 13),
          Container(
            margin: EdgeInsets.only(left: 20, right: 18),
            child: Text('Welcome'),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 18),
            child: Text(name ?? '', style: TextStyle(fontSize: 18)),
          ),

          Expanded(
            child: Center(
              child: Text(username ?? '', style: TextStyle(fontSize: 20)),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color(0xFF2B637B),
              ),

              width: 310,
              height: 41,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Page3();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Choose a User',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
