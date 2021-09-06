import 'package:blog_app_flutter/screens/auth/Register.dart';
import 'package:blog_app_flutter/screens/auth/login.dart';
import 'package:blog_app_flutter/screens/main_page.dart';
import 'package:blog_app_flutter/screens/auth/onboarding.dart';
import 'package:blog_app_flutter/screens/home_screen.dart';
import 'package:blog_app_flutter/store/actions/blogActions.dart';
import 'package:blog_app_flutter/store/reducer.dart';
import 'package:blog_app_flutter/store/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'screens/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp(store: store,));
  });
}
final store = Store<AppState>(appReducer,
      initialState: AppState.initial(), middleware: [thunkMiddleware]);

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
         store: store,
         
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
            title: 'Flutter Blog App',
            theme: ThemeData(
              primaryColor: Colors.purple,
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Montserrat', 
              buttonTheme: ButtonThemeData(
                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                buttonColor: Colors.purpleAccent,
              ),
            ),
            initialRoute: Onboarding.routeName,
            routes: {
              MainPage.routeName: (BuildContext context) => MainPage(onInit: () {
                   
                   StoreProvider.of<AppState>(context)
                        .dispatch(getPosts);
                   StoreProvider.of<AppState>(context).dispatch(getNews);
                       
                  }),
              Onboarding.routeName: (context) => Login(),
              Login.routeName: (context)  => Login(),

            },

            home: SafeArea(
              child: Scaffold(),
            )
            )
            );
  }
}
