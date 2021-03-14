import 'package:flutter/material.dart';
import 'package:flutter_app_bl/ItemService.dart';
import 'package:flutter_app_bl/bloc/counter_bloc.dart';
import 'package:flutter_app_bl/bloc/counter_event.dart';
import 'package:flutter_app_bl/bloc/counter_state.dart';
import 'package:flutter_app_bl/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:

        ShopPage()
        //MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
              BlocBuilder<CounterBloc, CounterState>(
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
                onPressed: () {},
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

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  ItemService _itemService;

  @override
  void initState() {
    _itemService = ItemService();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _itemService.fetchItems(),
          builder: (context, snapshot) {
            if(snapshot.hasData){

            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Item item = snapshot.data[index];
                  return ListTile(
                    title: Text(item.name),
                  );
                });
            }
            if(snapshot.hasError){

              return Container(child: Text("E R R O R"),);

            }                                             else{

              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
