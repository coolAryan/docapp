import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String order;
var netdata;

class Exp extends StatefulWidget {
  @override
  _ExpState createState() => _ExpState();
}

class _ExpState extends State<Exp> {
  net(order) async {
    var url = 'http://192.168.43.218/cgi-bin/netwrk.py?r=$order';
    var response = await http.get(url);
    setState(() {
      netdata = response.body;
    });

    print(netdata);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    cursorColor: Colors.orange.shade300,
                    onChanged: (value) {
                      order = value;
                    },
                    autocorrect: false,
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                      hintText: 'Enter Cmd',
                      border: OutlineInputBorder(
                        // borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.mobile_friendly,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  color: Colors.orange.shade300,
                  onPressed: () {
                    net(order);
                    //print(image);
                  },
                  child: Text('Click Here'),
                ),
                Container(
                  height: 800,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue.shade400,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Card(
                    child: Text(
                      netdata ?? "Wait I am about to Land...",
                      style: TextStyle(color: Colors.blue.shade400),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
