/// Flutter code sample for showModalBottomSheet

// This example demonstrates how to use `showModalBottomSheet` to display a
// bottom sheet that obscures the content behind it when a user taps a button.
// It also demonstrates how to close the bottom sheet using the [Navigator]
// when a user taps on a button inside the bottom sheet.

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return Container(
                height: 600.0,
                //height: MediaQuery.of(context).size.height * 0.75, //MediaQuery.of(context).size.height,
                child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0))),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('X'),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: WebView(
                            initialUrl: 'https://google.com',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
