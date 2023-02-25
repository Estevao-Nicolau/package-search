import 'package:developer_flutter_test/src/page/widgets/card_info.dart';
import 'package:developer_flutter_test/src/service/pub_api_client.dart';
import 'package:flutter/material.dart';
import 'package:pub_api_client/pub_api_client.dart';

class SearchAnimation extends StatefulWidget {
  const SearchAnimation({super.key});

  @override
  _SearchAnimationState createState() => _SearchAnimationState();
}

class _SearchAnimationState extends State<SearchAnimation> {
  bool sucess = false;
  final controller = PubApiClient();
  List<PackageResult> packages = [];
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isExpanded ? 320.0 : 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: isExpanded
                              ? TextField(
                                  onChanged: (value) async {
                                    if (value.length < 3) {
                                      packages = [];
                                    } else {
                                      packages = await controller
                                          .getSearchPackges(value);
                                    }
                                    setState(() {});
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() => isExpanded = !isExpanded);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              margin: const EdgeInsets.all(10),
              duration: const Duration(milliseconds: 400),
              height: isExpanded ? 200 : 0,
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: packages.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final package = packages.sublist(0, 5)[index];
                        return GestureDetector(
                          onTap: () async {
                            final PackageScore info =
                                await controller.packageScore(package.package);
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CardInfo(
                                    name: package.package,
                                    likes: info.likeCount,
                                    pubPoints: info.grantedPoints ?? 0,
                                    popularity: info.popularityScore ?? 0,
                                    info: 'Info do package',
                                  ),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 20,
                            ),
                            child: Text(
                              package.package,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
