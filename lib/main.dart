import 'package:flutter/material.dart';
import './UI/home.dart';
import 'package:google_fonts/google_fonts.dart';

//import './UI/front.dart';
void main() {
  runApp(First());
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new OneApp());
  }
}

class OneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(
          'Welcome to Docker World',
          style: GoogleFonts.indieFlower(
            fontSize: 32,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 500,
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    image: AssetImage('assets/docker.png'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(bottom: 40),
                      child: Text(
                        'Login|SignUp',
                        style: GoogleFonts.lato(
                          fontSize: 44,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      padding: EdgeInsets.all(30.0),
                      child: TextField(
                        autocorrect: false,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'username',
                          border: OutlineInputBorder(
                            // borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      padding: EdgeInsets.all(30.0),
                      child: TextField(
                        obscureText: true,
                        cursorColor: Colors.orange.shade300,
                        autocorrect: false,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.remove_red_eye),
                          hintText: 'password',
                          border: OutlineInputBorder(
                            // borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 22),
                      child: Text(
                        'Forgot Password',
                        style: GoogleFonts.lato(),
                      ),
                    ),
                    FlatButton(
                        height: 68,
                        minWidth: 98,
                        textColor: Colors.blue.shade400,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Myapp()),
                          );
                        },
                        child: Text('Submit')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/gith.png'),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/googl.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // constraints:BoxConstraints.expand() ,
                alignment: Alignment.center,
              ),
            ],
          ),
        ],
      ),
      // backgroundColor: Colors.blue,
    );
  }
}
