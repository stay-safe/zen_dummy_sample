//import 'package:firebase_database/firebase_database.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
//  FirebaseDatabase database = FirebaseDatabase();
//  DatabaseReference _locationsRef =
//      FirebaseDatabase.instance.reference().child("Locations");
//  StreamSubscription<Event> _onValueSubscription;
//  StreamSubscription<Event> _onChildAddedSubscription;
//  StreamSubscription<Event> _onChildChangedSubscription;
//
//  int _counter1 = 0;
//  int _counter2 = 0;
//  int _counter3 = 0;

  @override
  void initState() {
    super.initState();

//    _onValueSubscription = _locationsRef.onValue.listen(event1);
//    _onChildAddedSubscription = _locationsRef.onChildAdded.listen(event2);
//    _onChildChangedSubscription = _locationsRef.onChildChanged.listen(event3);
  }

  @override
  void dispose() {
//    _onValueSubscription.cancel();
//    _onChildChangedSubscription.cancel();
//    _onChildAddedSubscription.cancel();
    super.dispose();
  }

//  event1(Event event) {
//    print("Event1 triggered");
//    print(event.snapshot.value);
//    _incrementCounter1();
//  }
//
//  event2(Event event) {
//    print("Event2 triggered");
//    print(event.snapshot.value);
//    _incrementCounter2();
//  }
//
//  event3(Event event) {
//    print("Event3 triggered");
//    print(event.snapshot.value);
//    _incrementCounter3();
//  }
//
//  void _incrementCounter1() {
//    setState(() {
//      _counter1++;
//    });
//  }
//
//  void _incrementCounter2() {
//    setState(() {
//      _counter2++;
//    });
//  }
//
//  void _incrementCounter3() {
//    setState(() {
//      _counter3++;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider<BlocLiteBloc>(
        create: (BuildContext context) {
          return BlocLiteBloc()..add(LiteEvent());
        },
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(151, 223, 20, 22)),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: BlocBuilder<BlocLiteBloc, BlocLiteState>(
                builder: (context, state) {
              if (state is LoadedBlocLiteState) {
                int _counter1 = state.counter1;
                int _counter2 = state.counter2;
                int _counter3 = state.counter3;
                return Row(
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
                );
              } else {
                return Text("Hello World");
              }
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final blocLiteBloc = BlocProvider.of<BlocLiteBloc>(context);
          blocLiteBloc.add(LiteEvent());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
//      Row(
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
