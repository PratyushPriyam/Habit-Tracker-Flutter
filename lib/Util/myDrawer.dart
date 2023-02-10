import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/Pages/AboutUs.dart';
import 'package:habit_tracker/Pages/HomePage.dart';
import 'package:lottie/lottie.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  signOut() async {
    await _firebaseAuth.signOut();
    print("Signed out");
  }

  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5000,
      backgroundColor: Color.fromARGB(211, 158, 158, 158),
      child: ListView(
        children: [
          Container(
            child: Lottie.asset("assets/Menu.json"),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(400)),
          ),
          SizedBox(height: 17),
          ListTile(
            title: InkWell(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }),
          ),
          SizedBox(height: 5),
          ListTile(
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
          ListTile(
            title: InkWell(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  "Log out",
                  style: TextStyle(fontSize: 20),
                )),
              ),
              onTap: signOut,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Container(
            child: Center(
                child: Text(
              'Terms of Service | Privacy Policy',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
