import 'package:flutter/material.dart';

import 'circulardropdownmenu.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;



import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';


List<List<dynamic>> data = [];
loadAsset() async {
  final myData = await rootBundle.loadString("assets/teacheremails.csv");
  List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

  data = csvTable;
  print(data);
}

// SingleChildScrollView(
//               child: Table(
//                 border: TableBorder.all(width: 1.0),
//                 children: data.map((item) {
//                   return TableRow(
//                       children: item.map((row) {
//                     return Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           row.toString(),
//                         ),
//                       ),
//                     );
//                   }).toList());
//                 }).toList(),
//               ),
//             ),
//https://stackoverflow.com/questions/64191203/how-to-show-or-load-data-from-csv-file-into-list-in-flutter

// Main function that Flutter runs first
void main() {
  print("Hi");
  // loadAsset();

  runApp(const MainApp());

  print('Hello');
  loadAsset();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Title of the App
      title: 'What is the name of your app?',

      // Theme of the App
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Home widget of the App
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: TeacherDropDownMenu(),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/

class TeacherDropDownMenu extends StatefulWidget {
  TeacherDropDownMenu({super.key});

  @override
  _TeacherDropDownMenuState createState() => _TeacherDropDownMenuState();
}

class _TeacherDropDownMenuState extends State<TeacherDropDownMenu> {
  int _teacherIndex = -1;
  //Store a list of all the teacher names + emails
  // var list = [
  //   {'id': "1", 'name': "Bianchi", "email": "JBianchi@energytechhs.org"},
  //   {'id': "2", 'name': "Azriel", "email": "aalfitri@etech-nyc.org"},
  //   {'id': "3", 'name': "Justin", "email": "jhuang@etech-nyc.org"},
  // ];
  List<List<dynamic>> list = [];
  loadAsset() async {
    final myData = await rootBundle.loadString("assets/teacheremails.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    list = csvTable;
  }

  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                //Constructing a CDDM
                CircularDropDownMenu(
                  //Define field #2
                  dropDownMenuItem: [
                    //Loop through all the items in the list
                    for (var teacher in list)

                      //Generate a DDMI for each item
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(teacher[1].toString()),
                        ),
                        value: teacher[0].toString(),
                      ),

                    // DropdownMenuItem(
                    //   child: GestureDetector(
                    //     onTap: () {},
                    //     child: Text('Collage9'),
                    //   ),
                    //   value: 'Collage',
                    // ),

                    // DropdownMenuItem(
                    //   child: GestureDetector(
                    //     onTap: () {},
                    //     child: Text('Graduated'),
                    //   ),
                    //   value: 'Graduated',
                    // ),
                  ],

                  //defining CDDM field #1
                  onChanged: (value) {
                    setState(() {
                      _teacherIndex = value;
                    });
                  },

                  //defining CDDM field #3
                  hintText: "test",
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: sendEmail(email: list[_teacherIndex][2], name: list[_teacherIndex][1], subject: 'subject', message: 'message');
                    tooltip: 'Send!',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );

    Future sendEmail({
      required String name,
      required String email,
      required String subject,
      required String message,
    }) async {

      email = list[_teacherIndex][2];
      final serviceId = 'service_4xyn2c1';
      final templateId = 'template_h67x7ym';
      final userId = 'oUIoW42xemMxh_sfI';

      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id' :userId,
          'template_params': {
          list[_teacherIndex][1]: name,
          list[_teacherIndex][2]: email,
            'user_subject': subject,
            'user_message': message,

          },
        }

        )
      print(response.body);

    }

    Widget buildTextField({
      required String title,
      required TextEditingController controller,
      int maxLines = 1,
    })

  }// ends build function.


/*
Widget build(BuildContext context) {

var list = [{'id':"123123","date":"20/08/2016"},{'id':"123124","date":"26/08/2016"},{'id':"123125","date":"26/08/2016"}];

  return Scaffold(

  body: Center(
    child: Column(

      children: <Widget>[

        Text('Recent Claims'),

        Table(

          border: TableBorder.all(color: Colors.black),

          columnWidths: {
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(100.0)
          },

          children:[

            for(var item in list )

              TableRow(
                children: [
                  Text(item['id']),
                  Text(item['date']),
                ]
              )
          ]

        ),
      }

//       */

