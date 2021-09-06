import 'package:blog_app_flutter/screens/auth/Register.dart';
import 'package:blog_app_flutter/store/actions/authActions.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:localstorage/localstorage.dart';
import '/store/reducer.dart';

import '../../main.dart';

class Login extends StatelessWidget {


  static const routeName = '/Login';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginMain(),
    );
  }
}

class LoginMain extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<LoginMain> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: MaterialApp(
          home: Scaffold(
                  body: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bgmain.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 100),
                              padding: EdgeInsets.only(
                                  left: 52, right: 52, bottom: 10),
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/Login.png"),
                                      fit: BoxFit.fitHeight)),
                              child: SizedBox(
                                height: 100.0,
                                child: null,
                              )),
                          StoreConnector<AppState, String>(
                              converter: (store) => store.state.errorMsg,
                              onWillChange: (prev, next) {},
                              builder: (_, errMsg) {
                                return Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "$errMsg",
                                    style: TextStyle(color: Color(0xffff4500)),
                                  ),
                                );
                              }),
                          
                          Container(
                              margin: const EdgeInsets.only(top: 2),
                              padding:  EdgeInsets.only(left: width/8, right: width/8),
                              child: Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: TextField(
                                      onChanged: (email) {
                                        setState(() {
                                          _email = email;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Color(0xffC4C4C4),
                                                width: 2)),
                                        hintText: 'Myname@gmail.com',
                                        hintStyle: TextStyle(fontSize: 15.0),
                                      ),
                                      textCapitalization: TextCapitalization.none,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: TextField(
                                      obscureText:true,
                                      onChanged: (password) {
                                        setState(() {
                                          _password = password;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Color(0xffC4C4C4),
                                                  width: 2)),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                            fontSize: 15.0,
                                          )),
                                      textCapitalization: TextCapitalization.none,
                                    )),
                                Container(
                                   decoration: new BoxDecoration (
      borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
      color: Colors.black),
                                  margin: EdgeInsets.all(40),
                                   height: 50,
                                  width: MediaQuery.of(context).size.width * 0.50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.red, // foreground
                                      backgroundColor: Color(0xff474EF4),
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                    ),
                                    onPressed: () {
                                      store.dispatch(login(
                                          email: _email,
                                          password: _password,
                                          storage: storage,
                                          store: store,
                                          context: context));
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                            
                                  width: width/2,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.red, // foreground
                                      backgroundColor: Color(0xffffffff),
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 15.0, 0.0, 15.0),
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Register()));
                                    },
                                    child: FittedBox(
                                       fit: BoxFit.contain, 
                                      child: Text(

                                        'Click here to register',
                                       //maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                )
                              ]))
                        ],
                      )))
              )
             
              ),
    );
  }
}

