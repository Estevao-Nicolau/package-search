import 'package:flutter/material.dart';

class SearchAnimation extends StatefulWidget {
  const SearchAnimation({super.key});

  @override
  _SearchAnimationState createState() => _SearchAnimationState();
}

class _SearchAnimationState extends State<SearchAnimation> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    List<String> itens = [
      'Maçã',
      'Banana',
      'Laranja',
      'Melão',
      'Abacaxi',
      'Uva',
      'Manga',
      'Pera',
    ];

    List<String> filteredItems = [];

    void _filteredItems(String filtered) {
      setState(() {
        filteredItems = itens
            .where(
                (item) => item.toLowerCase().startsWith(filtered.toLowerCase()))
            .toList();
      });
    }

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isExpanded ? 237.0 : 55.0,
                height: 55.0,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: isExpanded
                                ? TextField(
                                    onChanged: (texto) {
                                      _filteredItems(texto.substring(0, 2));
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Search',
                                      border: InputBorder.none,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              setState(
                                () {
                                  isExpanded = !isExpanded;
                                  ListView.builder(
                                    itemCount: filteredItems.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(filteredItems[index]),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
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
}
