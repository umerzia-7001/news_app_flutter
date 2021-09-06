import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class BreakingNews extends StatelessWidget {
  final String imageUrl, title, author;
  final int totalResults;
  final String status;
  const BreakingNews({
    Key? key,
    required this.totalResults,
    required this.status,
    required this.imageUrl,
    required this.title,
    required this.author,
  }) : super(key: key);

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Stack(
          children: <Widget>[
           Positioned.fill(
             
              child:
                FadeInImage.assetNetwork(
                image: ("$imageUrl" ),
                placeholder: "assets/images/loading.gif",
                fit: BoxFit.cover,
              ),
           ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            "Breaking News",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            "$title",
                            maxLines: 10,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                         
                        ),
                        SizedBox(
                          height: 9.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        onTap: () => {
              launchURL("$author"),
            });
  }
}
