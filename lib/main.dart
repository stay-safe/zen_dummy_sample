import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zen_dummy/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseDatabase database = FirebaseDatabase();
  DatabaseReference _locationsRef = FirebaseDatabase.instance.reference().child("Locations");
  StreamSubscription<Event> _onValueSubscription;
  StreamSubscription<Event> _onChildAddedSubscription;
  StreamSubscription<Event> _onChildChangedSubscription;

  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;

  @override
  void initState() {
    super.initState();

    _onValueSubscription = _locationsRef.onValue.listen(event1);
    _onChildAddedSubscription = _locationsRef.onChildAdded.listen(event2);
    _onChildChangedSubscription = _locationsRef.onChildChanged.listen(event3);

  }

  @override
  void dispose() {
    _onValueSubscription.cancel();
    _onChildChangedSubscription.cancel();
    _onChildAddedSubscription.cancel();
    super.dispose();
  }

  event1(Event event){
    print("Event1 triggered");
    print(event.snapshot.value);
    _incrementCounter1();
  }

  event2(Event event){
    print("Event2 triggered");
    print(event.snapshot.value);
    _incrementCounter2();
  }

  event3(Event event){
    print("Event3 triggered");
    print(event.snapshot.value);
    _incrementCounter3();
  }

  void _incrementCounter1() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter1++;
    });
  }

  void _incrementCounter2() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter2++;
    });
  }
  void _incrementCounter3() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter3++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: BlocProvider<BlocLiteBloc>(
        create: (BuildContext context){
          return BlocLiteBloc();
        },
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(151, 223, 20, 22)),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Counter1:',
                    ),
                    Text(
                      '$_counter1',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
              ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Counter2:',
                    ),
                    Text(
                      '$_counter2',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Counter3:',
                    ),
                    Text(
                      '$_counter3',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
//      floatingActionButton: Row(
//        children: <Widget>[
//          FloatingActionButton(
//            onPressed: _incrementCounter1,
//            tooltip: 'Increment',
//            child: Icon(Icons.add),
//          ),
//          FloatingActionButton(
//            onPressed: _incrementCounter2,
//            tooltip: 'Increment',
//            child: Icon(Icons.add),
//          ),
//          FloatingActionButton(
//            onPressed: _incrementCounter3,
//            tooltip: 'Increment',
//            child: Icon(Icons.add),
//          ),
//        ],
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
