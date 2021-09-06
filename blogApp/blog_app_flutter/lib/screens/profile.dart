import 'package:blog_app_flutter/store/actions/blogActions.dart';
import 'package:blog_app_flutter/store/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../main.dart';
import '../models/category.dart';
import '../models/editor.dart';
import '../models/post.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({Key? key, required this.userId}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
        body: StoreConnector<AppState, VoidCallback>(
          onInit: (store) {
             store.dispatch(getEditorAct( widget.userId));
           //store.dispatch((x) => getEdit);
            //store.dispatch(getEdit);
            
              // store.dispatch(getEditorAct);
          },
          converter: (store) {
            return () => 
            //store.dispatch((x) => getEdit);
            store.dispatch((_) => getEditorAct( widget.userId));
          },
          builder: (_, callback) {
            return ProfileContent(
              editor: store.state.editor,
              posts: store.state.post,
              categories: store.state.category,
            );
          },
        )

        // body: Consumer<EditorNotifier>(
        //   builder: (context, snapshot, _) {
        //     switch (snapshot.status) {
        //       case Status.loading:
        //         {
        //           return Center(
        //             child: CircularProgressIndicator(),
        //           );
        //         }
        //         break;
        //       case Status.done:
        //         {
        //           return ProfileContent(
        //             snapshot: snapshot.editorInfo,
        //             posts: snapshot.posts,
        //             categories: snapshot.categories,
        //           );
        //         }
        //         break;
        //       default:
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //     }
        //   },
        // ),
        );
  }
}

class ProfileContent extends StatelessWidget {
  final Editor editor;
  final List<Post> posts;
  final List<Category> categories;
  const ProfileContent({
    Key? key,
    required this.editor,
    required this.posts,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            height: 71,
            width: 71,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage("assets/images/user1.png"),
              ),
            ),
          ),
      
        SizedBox(height: 5.0),
         Text("${editor.fullname}", style: Theme.of(context).textTheme.title),
       
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileColumnInfo(
              title: "Trending",
              count: 2, //snapshot.trending_count,
              icon: Icons.trending_up,
            ),
            ProfileColumnInfo(
              title: "Bookmarked",
              count: 3, // snapshot.bookmarked_count,
              icon: Icons.bookmark_border,
            ),
            ProfileColumnInfo(
              title: "Favorite",
              count: 2, // snapshot.favorite_count,
              icon: Icons.favorite_border,
            ),
            ProfileColumnInfo(
              title: "Awards",
              count: 1, // snapshot.awards_count,
              icon: Icons.star_border,
            ),
          ],
        ),
        SizedBox(height: 15),
        CategoriesList(
          categories: categories,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          width: double.infinity,
          height: 1,
          color: Theme.of(context).dividerColor,
        ),
        // Expanded(
        //   child: DraggableScrollableSheet(
        //     initialChildSize: 1,
        //     minChildSize: 1,
        //     builder: (BuildContext context, ScrollController scrollController) {
        //       return PostsList(
        //         posts: posts,
        //         scrollController: scrollController,
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
