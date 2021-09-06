import 'package:blog_app_flutter/main.dart';
import 'package:blog_app_flutter/screens/auth/login.dart';
import 'package:blog_app_flutter/store/actions/authActions.dart';
import 'package:blog_app_flutter/store/reducer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:localstorage/localstorage.dart';


class Register extends StatelessWidget {

  final routeName = '\register';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RegisterMain(),
    );
  }
}

class RegisterMain extends StatefulWidget {
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<RegisterMain> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  String _email = "";
  String _password = "";
  String _cpassword = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: MaterialApp(
          home:  Scaffold(
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
                                      image: AssetImage("assets/images/Register.png"),
                                      fit: BoxFit.fitHeight)),
                              child: SizedBox(
                                height: 100.0,
                                child: null,
                              )),
                          //* Error Msgs *//
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
                           
                              margin: const EdgeInsets.only(top: 5),
                                padding:  EdgeInsets.only(left: width/8, right: width/8),
                              child: Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Color(0xffC4C4C4),
                                                width: 2)),
                                        hintText: 'Email Address',
                                        hintStyle: TextStyle(fontSize: 15.0),
                                      ),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      onChanged: (email) {
                                        if (email.length > 0) {
                                          setState(() {
                                            _email = email;
                                          });
                                        }
                                      },
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: TextField(
                                       obscureText:true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Color(0xffC4C4C4),
                                                width: 2)),
                                        hintText: 'Password',
                                        hintStyle: TextStyle(fontSize: 15.0),
                                      ),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      onChanged: (password) {
                                        if (password.length > 0) {
                                          setState(() {
                                            _password = password;
                                          });
                                        }
                                      },
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Color(0xffC4C4C4),
                                                  width: 2)),
                                          hintText: 'Confirm Password',
                                          hintStyle: TextStyle(
                                            fontSize: 15.0,
                                          )),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      onChanged: (cpassword) {
                                        if (cpassword.length > 0) {
                                          setState(() {
                                            _cpassword = cpassword;
                                          });
                                        }
                                      },
                                    )),
                                Container(
                                 
                                      decoration: new BoxDecoration (
      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
      color: Colors.black),
                                  margin: EdgeInsets.all(25),
                                   height: 50,
                                  width: MediaQuery.of(context).size.width * 0.50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.red, // foreground
                                      backgroundColor: Color(0xff474EF4),
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 15.0, 0.0, 15.0),
                                    ),
                                    onPressed: () {
                                      store.dispatch(
                                        register(
                                            storage: storage,
                                            store: store,
                                            name: 'umer',
                                            email: _email,
                                            password: _password,
                                            cpassword: _cpassword,
                                            context: context),
                                      );
                                    },
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                 
                                  width: MediaQuery.of(context).size.width * 0.60,
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
                                              builder: (context) => Login()));
                                    },
                                    child: Text(
                                      'Click here to Login',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ]))
                       ],
                      )
                     )
                      ))
                   
    
                      ),
    );
  }
}
