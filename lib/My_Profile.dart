import 'package:flutter/material.dart';
import 'package:habit_tracking_app/About_Us.dart';
import 'package:habit_tracking_app/Heat_map.dart';
import 'package:habit_tracking_app/Home_Screen.dart';
import 'package:habit_tracking_app/Text_animation.dart';
import 'package:habit_tracking_app/percent_indicator.dart';


class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(image: AssetImage("asset/Menu.png")),
                    border: Border.all(
                        color: Color.fromARGB(255, 70, 64, 2), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: DrawerHeader(
                    child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 25),
                ))),
            SizedBox(height: 17),
            ListTile(
              title: InkWell(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 3.5)),
                    ),
                    child: Center(
                        child: Text(
                      "Home",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MYHome_Screen()),
                    );
                  }),
            ),
            SizedBox(height: 5),
            ListTile(
              title: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 3.5)),
                ),
                child: Center(
                    child: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 20),
                )),
              ),
              onTap: () {
                final snackBar = SnackBar(
                  content: const Text('+ 91 885336124'),
                  backgroundColor: (Colors.black),
                  duration: Duration(seconds: 7),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 3.5)),
                ),
                child: Center(
                    child: Text(
                  "Email",
                  style: TextStyle(fontSize: 20),
                )),
              ),
              onTap: () {
                final snackBar = SnackBar(
                  content: const Text('Companyemail1991@gmail.com'),
                  backgroundColor: (Colors.black),
                  duration: Duration(seconds: 7),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: InkWell(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 4)),
                  ),
                  child: Center(
                      child: Text(
                    "About Us",
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About_Us()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Container(
          child: Center(
              child: Text(
            "My Profile",
          )),
        ),
        actions: [
          InkWell(
            onTap: () => {print("Button Tapped")},
            child: Container(
              padding: EdgeInsets.only(right: 5),
              child: Row(
                children: [
                  Icon(Icons.report_gmailerrorred_outlined),
                  SizedBox(
                    width: 1,
                  ),
                  Container(
                    child: Text("Report"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 195,
                decoration: BoxDecoration(
                    color: Color(0xFFffcb00),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 70.0,
                      minRadius: 70.0,
                      backgroundImage: AssetImage('asset/DummyImage.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        "Pratham Chikara",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
                // heat map implementation
                child: MyHeat_map()),
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 15,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFFffcb00), width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        children: [
                          Text("Progress",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        SizedBox(
                          height:20
                        ),


                            Container(
                              child:Percent_indicator(),
                            ),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFFffcb00), width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        children: [
                          Text("Age",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                                  SizedBox(
                                    height: 25,
                                  ),

                                Center(
                                  child:MyAge(),
                                )
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Color(0xFFffcb00),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Color(0xFFffcb00),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Color(0xFFffcb00),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Color(0xFFffcb00),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
