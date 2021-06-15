import 'package:flutter/material.dart';
import 'package:kalkulator_app/page/webview_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media-exp1.licdn.com/dms/image/C5603AQHllwMrAuMeWA/profile-displayphoto-shrink_800_800/0/1610163347964?e=1629331200&v=beta&t=XvXa4yF-OGHBgx2h5D10l4NqjcusBXcU7rOEPRTH1nI'),
                  radius: 50.0,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Ahmad Jamil Al Rasyid',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text('rasyidcode7@gmail.com'),
                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            WebViewPage(url: 'https://github.com/rasyidcode')));
                  },
                  child: Text(
                    'github.com/rasyidcode',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => WebViewPage(
                            url:
                                'https://www.linkedin.com/in/jamilalrasyid/')));
                  },
                  child: Text(
                    'linkedin.com/in/jamilalrasyid',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
