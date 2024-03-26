import 'package:flutter/material.dart';
import 'package:highlight_sevice/link_sevvice.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const LinkServiceExample());

class LinkServiceExample extends StatelessWidget {
  const LinkServiceExample({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Highlight Link example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Highlight Link example'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                     LinkService(
                      onOpen: _onOpen,
                      options: const LinkOptions(showEmail: false, showHashTag: false, showPhoneNumber: false, showUserTag: false),
                      text: "Today is #Happy ^^ #U\nContac via @HưngNguyễn     - Mobile: +84963907817     facebook.com abc.ai ahhygyt.fgt\nMade by https://www.facebook.com/hungnguyen280492/\n\nMail: hungnguyen.it36@gmail.com facebook.com abc.ai hungnguyen.it36 http:/hungnguyen.it httpbin.org/anything?json https://httpbin.org/anything?json",
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if(link.isTag) {
      debugPrint(link.url);
    } else {
      if (await canLaunchUrl(Uri.parse(link.url))) {
        if (!await launchUrl(Uri.parse(link.url))) {
          throw Exception('Could not launch ${link.url}');
        }
      }
      
    }
  }
}