import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogsTile extends StatelessWidget {
  final String imgUrl;
  final String blogUrl;
  final String title;
  final String summary;
  const BlogsTile({
    super.key,
    required this.imgUrl,
    required this.blogUrl,
    required this.title,
    required this.summary,
  });
  Future<void> openAppWebView(String url) async {
    //for opening external link in appView
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imgUrl,
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 180,
            decoration: BoxDecoration(
                color: Colors.black45.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.amberAccent.shade200.withOpacity(.4))),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    summary,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.black38)),
                    onPressed: () {
                      openAppWebView(blogUrl);
                    },
                    child: const Text(
                      'Read More',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
