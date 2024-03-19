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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  const LinkService(
                    onOpen: print,
                    text: "Today is #Happy ^^ #U",
                    highlighLinks: [
                      HashTagLink(),
                      UserTagLink(),
                      PhoneLink(),
                    ],
                  ),
                  const SizedBox(height: 64),
                  SelectableLink(
                    onOpen: _onOpen,
                    text:
                        "Made by https://www.facebook.com/hungnguyen280492/\n\nMail: hungnguyen.it36@gmail.com",
                  ),
                  const SizedBox(height: 64),
                  const LinkService(
                    onOpen: print,
                    text: "Contac via @HưngNguyễn     - Mobile: +84963907817     ",
                    highlighLinks: [
                      UserTagLink(),
                      PhoneLink(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }
}