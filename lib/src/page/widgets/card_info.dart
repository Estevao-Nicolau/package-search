import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String name;
  final int likes;
  final int pubPoints;
  final double popularity;
  final String info;

  const CardInfo({
    Key? key,
    required this.name,
    required this.likes,
    required this.pubPoints,
    required this.popularity,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double cardWidth = screenSize.width * 0.9;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Card(
                color: Colors.green[300],
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SizedBox(
                  width: cardWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.05,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.green),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Likes $likes',
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.04,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(
                                  color: Colors.green,
                                ),
                                Text(
                                  'PUB POINTS $pubPoints',
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.04,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(color: Colors.green),
                                Text(
                                  'POPULARITY, ${(popularity * 100).toStringAsFixed(0)}%,',
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.04,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              info,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.04,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
