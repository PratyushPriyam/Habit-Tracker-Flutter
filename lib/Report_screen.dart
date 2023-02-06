import 'package:flutter/material.dart';

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
          image: DecorationImage(image: AssetImage("asset/Bug.png"))),
      child: Scaffold(
        backgroundColor: Color.fromARGB(93, 158, 158, 158),
        body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 95),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Type the issue you are facing",
                  hintStyle: TextStyle(color: Colors.black ),
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
              MaterialButton(
                elevation: 20,
                color: Colors.amberAccent,
                child: Text("Post"),
                
                onPressed: () {
                  setState(() {
                    user_post = _textController.text;
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
