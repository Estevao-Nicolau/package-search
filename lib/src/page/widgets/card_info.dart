import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String name;
  final int likes;
  final int pubPoints;
  final int popularity;
  final String info;

  const CardInfo({
    super.key,
    required this.name,
    required this.likes,
    required this.pubPoints,
    required this.popularity,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        
        children: <Widget>[
          ListTile(
            title: Text(name),
          ),
          const Divider(),
          ListTile(
            title: Text('$likes'),
          ),
          ListTile(
            title: Text('$pubPoints'),
          ),
          ListTile(
            title: Text('$popularity'),
          ),
          const Divider(),
          ListTile(
            title: Text(info),
          ),
        ],
      ),
    );
  }
}
