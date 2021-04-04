import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'api.dart';

class Videoview extends StatefulWidget {
  Videoview(this.url, {Key key}) : super(key: key);
  final String url;
  @override
  _VideoviewState createState() => _VideoviewState();
}

class _VideoviewState extends State<Videoview> {
  Future<String> _stat;
  @override
  void initState() {
    _stat = ApiService().stat();
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Widget build(BuildContext context) {
    //   return Scaffold(
    //       body: Stack(children: [
    //     WebView(
    //       initialUrl: widget.url,
    //     ),
    //     Container(
    //       color: Colors.white.withOpacity(0),
    //       child: F<int>(stream: ,builder: ,),
    //     )
    //   ]));
    // }
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        WebView(
          initialUrl: widget.url,
        ),
        Center(
          child: FutureBuilder<String>(
            future: _stat, // async work
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text('Loading....');
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else
                    return Text('Result: ${snapshot.data}');
              }
            },
          ),
        ),
      ],
    )));
  }
}
