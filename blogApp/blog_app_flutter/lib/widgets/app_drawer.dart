import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.teal,
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Umer Zia'),
                  accountEmail: Text('umerzia@gmail.com'),
                   currentAccountPicture: CircleAvatar(
                        backgroundImage: ExactAssetImage('assets/aleydon.jpg'),
                    ),

                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      child: Text('A'),
                      backgroundColor: Colors.white60,
                      ),
                      CircleAvatar(
                          child: Text('R'),
                      ),
                    ],

                
                  ),

               ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                  onLongPress: (){},
                  ),

                Divider(),

                ListTile(
                  title: Text('New Group'),
                  leading: Icon(Icons.group_add),
                  ),
              

                Divider(),

                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onLongPress: (){},
                  ),

                Divider(),

                ListTile(
                  title: Text('Support'),
                  leading: Icon(Icons.report_problem),
                  onLongPress: (){},
                  ),

                ListTile(
                  title: Text('Close'),
                  leading: Icon(Icons.close),
                  onTap: (){
                    Navigator.of(context).pop();}
                  ),
            ]
          ),
        ),
     );
   
    
  }
    
}
