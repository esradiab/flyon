import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstructionWebView extends StatefulWidget {
  var url;

  InstructionWebView( url) {
    this.url = url;
  }

  @override
  State<StatefulWidget> createState() => _InstructionWebView(url);
}

class _InstructionWebView extends State<InstructionWebView> {
  bool isLoading = true;
  var url;

  _InstructionWebView(url) {
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //set hight..
        toolbarHeight: 50,
        //app bar background color..
        backgroundColor: Color(0xff78c6a3),
        //app bar title..
        title: Text(
          "instruction abut corona virus",
          //text style..
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: this.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
