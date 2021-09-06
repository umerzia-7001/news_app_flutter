import 'package:blog_app_flutter/models/liveNews.dart';
import 'package:blog_app_flutter/models/post.dart';
import '../widgets/breaking_news.dart';
import 'package:flutter/material.dart';

class HomeScreenHeader extends StatefulWidget {
  // final List<LiveNews> posts;
  final LiveNews posts;
  const HomeScreenHeader({
    Key? key,
    required this.posts,
  }) : super(key: key);



  @override
  _HomeScreenHeaderState createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.7,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: PageView.builder(
              onPageChanged: (i) {
                setState(() {
                  _active = i;
                });
              },
              controller: PageController(initialPage: _active),
              itemCount: 2,
              itemBuilder: (ctx, i) {
                return FutureBuilder<String>(
   // future: _fetchNetworkCall, // async work
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
       switch (snapshot.connectionState) {
         case ConnectionState.waiting: return Text('Loading....');
         default:
           if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
           else
          return BreakingNews(
                    status: widget.posts.status,
                    totalResults: widget.posts.totalResults,
                    author: widget.posts.results[i].link,
                    imageUrl: widget.posts.results[i].image_url,
                    title: widget.posts.results[i].title,
                  //  post_url: widget.posts.results[i].link,
                  );
             
        }
     
                //   child: BreakingNews(
                //     status: widget.posts.status,
                //     totalResults: widget.posts.totalResults,
                //     author: widget.posts.results[i].link,
                //     imageUrl: widget.posts.results[i].image_url,
                //     title: widget.posts.results[i].title,
                //   //  post_url: widget.posts.results[i].link,
                //   ),
                // );

    });
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              value: _active / (2 - 1),
              backgroundColor: Colors.black.withOpacity(.3),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          
        ],
      ),
    );
  }
}
