// import 'profile.dart';
import 'package:blog_app_flutter/controllers/news_controlelr.dart';
import 'package:blog_app_flutter/models/category.dart';
import 'package:blog_app_flutter/models/post.dart';
import 'package:blog_app_flutter/store/actions/blogActions.dart';
import 'package:blog_app_flutter/store/reducer.dart';
import 'package:blog_app_flutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../widgets/posts_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final GlobalKey _scaffoldKey = new GlobalKey();

  //final  NewsController newsController = Get.put(NewsController()); 
 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/header.jpeg"),
                            fit: BoxFit.cover)),
                    child: Text("Header"),
                  ),
                  ListTile(
                    title: Text("Home"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
            // DrawerMenu(),
            body: Column(
              children: <Widget>[
                 StoreConnector<AppState, AppState>(
                    converter: (store) => store.state,
                    builder: (_, state) {
                      return HomeScreenHeader(
                              posts: state.news,
                              );
                    },),
                // Obx(()
                //   =>
                //    HomeScreenHeader(
                //               posts: newsController.jsonMap.results.value,
                //               ),
                // ),
                                
                //     },),

                // Consumer<CategoryNotifier>(
                //   builder: (ctx, snapshot, _) {
                //     switch (snapshot.status) {
                //         return CategoriesList(
                //           categories: [],
                //         );
                //       case Status.loading:
                //         break;
                //       case Status.done:
                //         return CategoriesList(categories: snapshot.categories);
                //         break;
                //       default:
                //         return CategoriesList(
                //           categories: [],
                //         );
                //     }
                //   },
                // ),
                // StoreConnector<AppState, VoidCallback>(
                //   onInit: (store) {
                //    // store.dispatch((x) => getCat( "some@email.com"));
                //     store.dispatch(getCategory);

                //     //  store.dispatch((x) => getEditorAct( "snnsn"));
                //   },                   
                //   converter: (store) {
                //     return () => store.dispatch(getCategory);
                //   },
                //   builder: (_, callback) {
                //     return CategoriesList(categories: state.category);
                //   },
                // ),

                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: double.infinity,
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
                StoreConnector<AppState, AppState>(
                    converter: (store) => store.state,
                    builder: (_, state) {
                      return Expanded(
                        child: PostsList(
                          posts:
                              //   Post(
                              //       id: "1234q",
                              //       title: "Afghanistan exit",
                              //       media: "bloomberg",
                              //       content:
                              //           "last US troop leaves Afghanistan ending 20 years of war on terror.",
                              //       type: "news",
                              //       authorId: "b123",
                              //       categoryName: "world affairs",
                              //       authorName: "james",
                              //       date: "2021"),
                              //       Post(
                              //       id: "1234q",
                              //       title: "Afghanistan exit",
                              //       media: "bloomberg",
                              //       content:
                              //           "last US troop leaves Afghanistan ending 20 years of war on terror.",
                              //       type: "news",
                              //       authorId: "b123",
                              //       categoryName: "world affairs",
                              //       authorName: "james",
                              //       date: "2021")
                              // ],
                              state.post,
                        ),
                      );
                    })
              ],
            ));
      },
    );
  }
}
