import 'package:flutter/material.dart';
import 'package:magang_3/Models/user_model/user_model.dart';
import 'package:magang_3/Providers/page3_provider.dart';
import 'package:magang_3/page2.dart';
import 'package:provider/provider.dart';

class Page3 extends StatelessWidget {
  String? name = '';
  Page3({super.key});

  @override
  Widget build(BuildContext context) {
    Widget contain({
      String? username,
      String? lastname,
      String? email,
      String? gambar,
    }) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Page2(username: username);
              },
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 13),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: 49,
                    height: 49,
                    child: ClipOval(
                      child: Image.network(
                        gambar ??
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.megavision.net.id%2Fblog%2Finternet%2Fapa-itu-404-not-found&psig=AOvVaw0cL_PhBKJW30NGdcTglAD2&ust=1753109423245000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKCP_NTXy44DFQAAAAAdAAAAABAE',
                        fit: BoxFit.cover,
                        width: 49,
                        height: 49,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Consumer<Page3Provider>(
                            builder: (context, page3Provider, child) {
                              return GestureDetector(
                                onTap: () {
                                  page3Provider.getUsers();
                                },
                                child: Text(username ?? ''),
                              );
                            },
                          ),
                          SizedBox(width: 5),
                          Text(lastname ?? ''),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(email ?? ''),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      );
    }

    return Consumer<Page3Provider>(
      builder: (context, page3Provider, child) {
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
                  child: GestureDetector(
                    onTap: () async {
                      await page3Provider.getUsers();
                    },
                    child: Text(
                      'Third Screen',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            elevation: 1,
            shadowColor: Colors.grey,
          ),

          body: SingleChildScrollView(
            child: Column(
              children: List.generate(
                page3Provider.userModel?.data?.length ?? 0,
                (index) {
                  return contain(
                    username: page3Provider.userModel?.data?[index].firstName,
                    lastname: page3Provider.userModel?.data?[index].lastName,
                    email: page3Provider.userModel?.data?[index].email,
                    gambar: page3Provider.userModel?.data?[index].avatar,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
