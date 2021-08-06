import 'package:flutter/material.dart';
import 'package:provider_learn/Consumer.dart';
import 'package:provider_learn/CountModel.dart';
import 'package:provider_learn/ModelProviderWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: CountWidget(),
    );
  }
}

class CountWidget extends StatefulWidget {
  @override
  _CountState createState() {
    return _CountState();
  }
}

class _CountState extends State<CountWidget> {
  @override
  Widget build(BuildContext context) {
    print("CountWidget build");
    return MaterialApp(
      title: 'Count App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Count"),
        ),
        body: Center(
          child: ModelProviderWidget<CountModel>(
            data: CountModel(count: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<CountModel>(builder: (context, value) {
                  print("rebuild text");
                  return Text("count: ${value?.count}");
                }),
                Builder(
                  builder: (context) {
                    print("RaiseButton build");
                    return RaisedButton(
                      onPressed: () => ModelProviderWidget.of<CountModel>(
                              context,
                              islisten: false)
                          ?.increment(),
                      child: Text("Increment"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
