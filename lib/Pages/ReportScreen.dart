import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class BugReport extends StatefulWidget {
  const BugReport({super.key});

  @override
  State<BugReport> createState() => _BugReportState();
}

class _BugReportState extends State<BugReport> {
  final _textController = TextEditingController();
  String user_post = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/reportBugImage.png"))),
      child: Scaffold(
        backgroundColor: Color.fromARGB(93, 250, 247, 247),
        body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 95),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Type the issue you are facing",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                elevation: 20,
                color: Colors.amberAccent,
                child: Text("Post"),
                onPressed: () {
                  setState(() {
                    user_post = _textController.text;
                    const snackBar = SnackBar(
                      content: Text('Posting Successful.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    ;
                    _textController.clear();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
