import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './exp.dart';
import 'package:http/http.dart' as http;

String container;
String pull;
String os;
String image;
String remove;
String list;
var webdata;
search() {}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  web(container, pull, list, image, remove) async {
    var url =
        'http://192.168.43.218/cgi-bin/net.py?q=$os&x=$image&z=$remove&y=$list&w=$pull&v=$container';
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });

    print(webdata);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => search,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: search),
            Icon(
              Icons.sort,
              color: Colors.white,
            ),
          ],
          title: Text(
            'Docker',
            style: TextStyle(
              fontSize: 32,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      cursorColor: Colors.blue.shade300,
                      onChanged: (value) {
                        //if (value == 'ubuntu' || value == 'centos') {
                        os = value;
                        // os = 'docker run -it  $os';
                        // }
                      },
                      autocorrect: false,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        hintText: 'Enter OS Name',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        prefixIcon: Icon(Icons.web),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      cursorColor: Colors.orange.shade300,
                      onChanged: (value) {
                        image = value;
                        //  image = 'docker run -dit --name $image $os';
                      },
                      autocorrect: false,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        hintText: 'Enter Image Name',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        prefixIcon: Icon(Icons.image),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      cursorColor: Colors.orange.shade300,
                      onChanged: (value) {
                        remove = value;
                        //remove = 'docker rm -f $remove';
                      },
                      autocorrect: false,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        hintText: 'Image to be removed',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        prefixIcon: Icon(Icons.remove_from_queue),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      cursorColor: Colors.orange.shade300,
                      onChanged: (value) {
                        list = value;
                        if (list == 'list' || list == 'List') {
                          list = 'docker ps -a';
                        }
                      },
                      autocorrect: false,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        hintText: 'List Of Images-type List',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.list,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      cursorColor: Colors.orange.shade300,
                      onChanged: (value) {
                        pull = value;
                        // pull = 'docker pull $pull';
                      },
                      autocorrect: false,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        hintText: 'Install New OS Flavour',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.create_new_folder,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      cursorColor: Colors.orange.shade300,
                      onChanged: (value) {
                        container = value;
                        // container = 'docker attach $container ';
                      },
                      autocorrect: false,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        hintText: 'Enter into Container- Name',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.add_box,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Colors.orange.shade300,
                    onPressed: () {
                      web(container, pull, list, image, remove);
                      //print(image);
                    },
                    child: Text('Click Here'),
                  ),
                  FlatButton(
                    color: Colors.orange.shade300,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new Exp()),
                      );
                    },
                    child: Text('Expert Go Here'),
                  ),
                  FlatButton(
                    color: Colors.blue.shade300,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go Back'),
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    child: Text(
                      'Output',
                      style: GoogleFonts.lato(color: Colors.blue.shade400),
                    ),
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
                        webdata ?? "Wait I am about to Land...",
                        style: TextStyle(color: Colors.blue.shade400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
