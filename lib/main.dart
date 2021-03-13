import 'package:flutter/material.dart';
import 'package:flutter_app_bl/counter_bloc.dart';
import 'package:flutter_app_bl/counter_event.dart';
import 'package:flutter_app_bl/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_) => CounterBloc(),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc,CounterState>(
                builder: (context, counterState) {
                  return Text(
                    counterState.counter.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: '1',
                onPressed: () {
                  context.read<CounterBloc>().add(CounterArtir());
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: '2',
                onPressed: () {

                  context.read<CounterBloc>().add(CounterAzalt());
                },
                tooltip: 'Increment',
                child: Icon(Icons.minimize_outlined),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
