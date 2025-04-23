import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_sample/l10n/app_localizations.dart';

void main() async {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: AppLocalizations.of(context)?.title ?? "Flutter Demo",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FlutterNativeSplash.remove();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemExtent: 80.0,
        itemBuilder: (BuildContext context, index) {
          return _ListItemWidget(index: index);
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

@immutable
class _ListItemWidget extends StatefulWidget {
  _ListItemWidget({required this.index});

  int index;

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<_ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("images/androidIcon.png", width: 40.0, height: 40.0),
             Padding(padding: EdgeInsets.only(left: 5.0)),
              Column(
                children: [
                  Text(
                    "data${widget.index}",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                  Text(
                    "data${widget.index}",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),


            ],
          ),
          Row(children: [
            SizedBox(width: 10.0,height: 10.0,child: Icon(Icons.share,color: Colors.grey),)
            ,
          ],)
        ],
      ),
    );
  }
}
