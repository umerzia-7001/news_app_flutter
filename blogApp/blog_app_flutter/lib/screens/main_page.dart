import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../responsiveness/responsive_layout.dart';
import 'home_screen.dart';
import 'profile.dart';
import '../widgets/app_drawer.dart';


class MainPage extends StatefulWidget {

  final void Function() onInit;
  MainPage({Key? key,required this.onInit});
  static const routeName = '/myHome';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


    @override
  void initState() {
   widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: ResponsiveLayout(
        iphone: HomeScreen(),
        macbook: Row(
          children: [
            Expanded(
              flex: _size.width > 1200 ? 9 : 11,
              child: HomeScreen(),
            ),
            Expanded(
              flex: _size.width > 1200 ? 3 : 5,
              child: DrawerMenu(),
            ),
          ],
        ),
      ),
    );
  }
}