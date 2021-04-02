import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './UI/home.dart';
import './UI/exp.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_sign_in/google_sign_in.dart';

//import './UI/front.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => OneApp(),
        "/cont": (context) => Myapp(),
        "/exp": (context) => Exp()
      },
    ),
  );
}

class OneApp extends StatelessWidget {
  //final googleSignIn = GoogleSignIn();

  // GoogleSignIn() async {
  //   GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
  //   if(googleSignInAccount!=null)
  //   {
  //     GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
  //    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
  //  accessToken: googleSignInAuthentication.accessToken,
  //   idToken: googleSignInAuthentication.idToken,
  // );
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String pswd = '';
    var authc = FirebaseAuth.instance;
    return Scaffold(
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
                        onChanged: (value) {
                          email = value;
                        },
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
                        onChanged: (value) {
                          pswd = value;
                        },
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
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(98, 68),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        try {
                          var user = await authc.createUserWithEmailAndPassword(
                              email: email, password: pswd);
                          // ignore: unnecessary_statements
                          //user.additionalUserInfo.isNewUser;
                          if (user != null) {
                            Navigator.pushNamed(context, "/cont");
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.blue.shade400),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
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
                        GestureDetector(
                          //onTap: ,
                          child: Container(
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
