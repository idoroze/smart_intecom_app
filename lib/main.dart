import 'package:flutter/material.dart';
import 'package:testing/global.dart';
import 'package:testing/video.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'hello there'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RegExp regExp = new RegExp(r'(\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b)');
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'please enter the code form the intercom',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 300,
              child: TextField(
                controller: controller,
                decoration: new InputDecoration(labelText: "Enter your number"),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: Text("next"),
              onPressed: () {
                if (regExp.hasMatch(controller.text)) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    //http://ipv4:5000/video_feed
                  url="http://${controller.text.trim()}:5000";
                    return Videoview(
                        "http://${controller.text.trim()}:5000");
                  }));
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
